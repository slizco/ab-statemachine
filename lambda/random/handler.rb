module Handler
  class << self
    def handle(event:, context:)
      puts "receiving event: #{event}"
      rn = rand(100)
      puts "returning random number: #{rn}"
      rn
    end
  end
end
