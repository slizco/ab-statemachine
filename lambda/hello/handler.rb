module Handler
  class << self
    def handle(event:, context:)
      puts "receiving event: #{event}"
      'hello'
    end
  end
end
