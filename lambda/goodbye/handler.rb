module Handler
  class << self
    def handle(event:, context:)
      puts "receiving event: #{event}"
      'goodbye'
    end
  end
end
