class Stats
  def self.record_stats?
    Rails.env == "production"
  end

  def self.increment(*args)
    client.increment(*args) if record_stats?
  end

  def self.decrement(*args)
    client.decrement(*args) if record_stats?
  end

  def self.timing(*args)
    client.timing(*args) if record_stats?
  end

  def self.client
    @@client ||= Statsd.new '198.0.0.0'
  end
end