require "test_helper"

require "selenium-webdriver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # http://chromedriver.chromium.org/capabilities
  desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
                           "goog:chromeOptions" =>
                             { "args" =>
                               %w(no-sandbox headless disable-gpu window-size=1400,1400)
                             }
                         )

  Capybara.register_driver :hc do |app|
    Capybara::Selenium::Driver.new app,
      browser: :chrome,
      desired_capabilities: desired_capabilities
  end

  driven_by :hc
end
