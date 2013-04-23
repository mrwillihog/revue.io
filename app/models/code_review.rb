class CodeReview < ActiveRecord::Base
  SPLIT_DIFFS = /^(--- .*?)(?=^index|^diff --git|\Z)/mi

  attr_accessible :raw, :token

  before_create :generate_hash, :set_expires_at

  scope :expired, lambda { where("expires_at < ?", Time.now) }
  scope :not_expired, lambda { where("expires_at >= ?",  Time.now) }

  validate :validate_diff

  def diffs
    # Scan raw text for separate diffs and map to an array containing Diff objects
    @diffs ||= raw.scan(SPLIT_DIFFS).map { |c| Unified::Diff.parse!(c[0]) }
  end

  def to_param
    token
  end

  def self.from_param(param)
    find_by_token!(param)
  end

private

  def validate_diff
    begin
      diffs
      raise Unified::ParseError if diffs.empty?
    rescue Unified::ParseError => e
      errors.add(:raw, e.message)
    end
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
