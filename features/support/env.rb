require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'capybara/rspec/matcher_proxies'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'faker'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

Faker::Config.locale = 'pt-BR'

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://ninjainvoices.herokuapp.com'
end

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
    :browser => :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' => {
        'args' => [ "--start-maximized" ]
      }
    )
  )
end

Capybara.default_max_wait_time = 5