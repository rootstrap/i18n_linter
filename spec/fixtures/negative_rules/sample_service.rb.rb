class SampleService
  include HTTParty

  # Testing EnvironmentVariable rule
  base_uri ENV['RESOURCE_URL']
  TEST_VAR = ENV.fetch('TEST_VAR')

  def send_message
    post(
      # Testing ForwardSlash rule
      '/sendMessage',
      # Testing MiddleDash rule
      headers: { 'Content-Type' => 'application/json' },
      body: { message: 'test' }
    )
  end
end
