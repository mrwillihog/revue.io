require "statsd"

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

  def self.count(*args)
    client.count(*args) if record_stats?
  end

  def gauge(*args)
    client.gauge(*args) if record_stats?
  end

  def self.timing(*args)
    client.timing(*args) if record_stats?
  end

  def self.client
    @@client ||= begin
      client = Statsd.new(Rails.application.config.statsd_host, Rails.application.config.statsd_port)
      client.namespace = "revue"
      client
    end
  end
end