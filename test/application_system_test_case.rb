require "test_helper"

# require 'selemium'

# require "rubygems"
require "selenium-webdriver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
                           "goog:chromeOptions" =>
                             { "args" =>
                               %w(no-sandbox headless disable-gpu window-size=1400,1400)
                             }
                         )
                        #    chromeOptions: { args: %w(no-sandbox headless disable-gpu disable-dev-shm-usage window-size=1400,1400) }
                        #  )

  Capybara.register_driver :hc do |app|
    if ENV['SELENIUM_HUB_URL']
      Capybara::Selenium::Driver.new app,
        url: ENV['SELENIUM_HUB_URL'],
        browser: :remote,
        desired_capabilities: desired_capabilities
    else
      Capybara::Selenium::Driver.new app,
        browser: :chrome,
        desired_capabilities: desired_capabilities
    end
  end

  driven_by :hc

  setup do
    if ENV['TEST_APP_HOST']
      Capybara.server_port = ENV['TEST_APP_PORT'].to_i
      Capybara.app_host = "http://#{ENV['TEST_APP_HOST']}:#{ENV['TEST_APP_PORT']}"
      Capybara.server_host = '0.0.0.0'
    end
  end
  # driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
