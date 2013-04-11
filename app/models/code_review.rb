class CodeReview < ActiveRecord::Base
  DIFF_PATTERN = /^(--- .*?)(?=^index|^diff --git|\Z)/mi
  attr_accessible :raw, :token

  before_create :generate_hash, :set_expires_at
  before_validation :remove_carriage_returns

  scope :expired, lambda { where("expires_at < ?", Time.now) }
  scope :not_expired, lambda { where("expires_at >= ?",  Time.now) }

  validates :raw, format: { with: /^---\s.*?$\n^\+\+\+\s.*?$\n^@@.*?@@$(\n(^-|^\+|^\s).*?)+$/,
                            message: "content is invalid" }

  def diffs
    # Scan raw text for separate diffs and map to an array containing Diff objects
    @diffs ||= raw.scan(DIFF_PATTERN).map { |c| Revue::Diff.new(c[0]) }
  end

  def to_param
    token
  end

  def self.from_param(param)
    find_by_token!(param)
  end

private

  def remove_carriage_returns
    self.raw.gsub! "\r", ""
  end

  def generate_hash
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless CodeReview.where(token: random_token).exists?
    end
  end

  def set_expires_at
    self.expires_at = Time.now + 6.hours
  end
end
