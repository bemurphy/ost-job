require "json"

module Ost
  class Job
    def call(data)
      perform(deserialize(data))
    end

    def deserialize(data)
      data
    end
  end

  class JsonJob < Job
    def deserialize(data)
      JSON[data]
    end
  end
end
