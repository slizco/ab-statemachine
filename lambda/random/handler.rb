module Handler
  class << self
    def client
      @client ||= Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
    end

    def handle(event:, context:)
      puts "receiving event: #{event}"
      rn = rand(100)
      puts "returning random number: #{rn}"
      rn
    end
  end
end
