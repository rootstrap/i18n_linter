# frozen_string_literal: true

RSpec.describe 'Integration Test' do
  spec_root = File.expand_path(__dir__)

  let(:output_path) do
    path = File.join(spec_root, 'integration_result.txt')

    config = I18nLinter::Config.new
    options = I18nLinter::Options.new(config)
    options.out_file = path

    I18nLinter::Runner.new(options, config).run

    path
  end
  let(:actual_output)   { File.read(output_path) }
  let(:expected_path)   { File.join(spec_root, 'integration_expected.txt') }
  let(:expected_output) { File.read(expected_path) }

  it 'outputs the result' do
    expect(actual_output).to eq(expected_output)
  end
end
