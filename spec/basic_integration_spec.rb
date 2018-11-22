# frozen_string_literal: true

RSpec.describe 'Basic Integration Test' do
  spec_root = File.expand_path(__dir__)

  let(:output_path) do
    path = File.join(spec_root, 'fixtures/basic/result.txt')

    config = I18nLinter::Config.new
    options = I18nLinter::Options.new(config)
    options.out_file = path

    I18nLinter::Runner.new(options, config).run

    path
  end

  let(:actual_output) do
    File.read(output_path)
  end

  let(:expected_path) do
    File.join(spec_root, 'fixtures/basic/expected.txt')
  end

  let(:expected_output) do
    File.read(expected_path)
  end

  it 'outputs the result' do
    expect(actual_output).to eq(expected_output)
  end
end
