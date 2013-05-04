require "statsd"
require "stats"

describe Stats do
  before(:each) do
    Rails ||= double("Rails").as_null_object
  end

  it "exists" do
    Stats.should_not be_nil
  end

  it "sends stats in production" do
    Rails.stub(:env).and_return("production")
    expect(Stats.record_stats?).to be_true
  end

  it "doesnt send stats in development" do
    Rails.stub(:env).and_return("development")
    expect(Stats.record_stats?).to be_false
  end

  it "delegates method calls to statsd-ruby" do
    Rails.stub(:env).and_return("production")
    client = Stats.client
    client.should_receive(:increment).exactly(2).times
    client.should_receive(:decrement).exactly(1).times
    client.should_receive(:timing).exactly(1).times
    client.should_receive(:count).exactly(1).times
    Stats.increment "test"
    Stats.increment "test"
    Stats.decrement "test"
    Stats.timing "test"
    Stats.count "test", 4
  end
end