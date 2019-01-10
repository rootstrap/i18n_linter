class SampleService
  include HTTParty

  # Testing EnvironmentVariable rule
  base_uri ENV['RESOURCE_URL']
  TEST_VAR = ENV.fetch('TEST_VAR')

  def save_access_token
    auth = "#{ENV['BITLY_USER']}:#{ENV['BITLY_PASSWORD']}"
    post(
      '/oauth/access_token',
      # Testing HttpHeaders rule
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded',
                 'Authorization' => "Basic #{Base64.strict_encode64(auth)}" }
    )
  end

  def send_message
    post(
      # Testing ForwardSlash rule
      '/sendMessage',
      # Testing MiddleDash rule
      headers: { 'Content-Type' => 'application/json' },
      body: { message: 'test' }
    )
  end

  def perform
    # Testing Puts rule
    puts "Request's response: "
    puts send_message
  end
end
