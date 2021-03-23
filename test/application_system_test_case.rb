require "test_helper"

require "selenium-webdriver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # http://chromedriver.chromium.org/capabilities

  driver = ENV['CHROME_HEADLESS'] ? :headless_chrome : :chrome

  driven_by :selenium, using: driver do |driver_options|
    driver_options.add_argument('--no-sandbox')
    driver_options.add_argument('--disable-dev-shm-usage')
    driver_options.add_argument('--disable-gpu')
    driver_options.add_argument('--window-size=1400,1400')
  end
end
