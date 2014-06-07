require "cutest"
require_relative "../lib/ost_job"

class RegularJob < Ost::Job
  def perform(data)
    $regular_data ||= []
    $regular_data << data
  end
end

test "deserializing the data for a plain job" do
  RegularJob.new.call(1)
  RegularJob.new.call(22)
  RegularJob.new.call(333)
  assert_equal [1, 22, 333], $regular_data
end

class JsonJob < Ost::JsonJob
  def perform(data)
    $deserialized_data ||= []
    $deserialized_data << data
  end
end

test "deserializing the data for a json based job" do
  JsonJob.new.call(JSON.dump({foo: 'bar', job: 1}))
  JsonJob.new.call(JSON.dump({fizz: 'buzz', job: 2}))
  assert_equal [{"foo" => "bar", "job" => 1}, {"fizz" => "buzz", "job" => 2}], $deserialized_data
end
