RSpec.describe 'Configuration Test' do
  configuration = I18nLinter::Config.new

  it 'loads all set of rules' do
    expect(I18nLinter::Rules::POSITIVE_RULES + I18nLinter::Rules::NEGATIVE_RULES)
      .to eq(configuration.enabled_positive_rules + configuration.enabled_negative_rules)
  end
end
