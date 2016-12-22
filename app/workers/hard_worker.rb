class HardWorker
  include Sidekiq::Worker

  def perform
    puts Shop::Category.select(:id).to_a.sample[:id]
  end
end
