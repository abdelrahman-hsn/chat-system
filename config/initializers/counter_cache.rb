# frozen_string_literal: true

Counter::Cache.configure do |c|
  c.default_worker_adapter = CounterCacheWorker
  c.recalculation_delay    = 6.hours # Default delay for recalculations
  c.redis_pool             = Redis.new
  c.counting_data_store    = Counter::Cache::Redis.new # Default is Counter::Cache::Redis
end
