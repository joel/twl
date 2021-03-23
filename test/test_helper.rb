ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

begin
  require "pry"
rescue LoadError
end

Dir[Rails.root.join("test/support/**/*.rb")].sort.each { |f| require f }

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
end
