RSpec.configure do |config|
  config.include Features::SessionsHelper, type: :feature
  config.include Features::ListHelper, type: :feature
end
