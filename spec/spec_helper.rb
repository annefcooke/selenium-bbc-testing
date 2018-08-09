require 'selenium-webdriver'
require_relative '../lib/bbc_registration'
require_relative '../lib/bbc_login'


RSpec.configure do |config|
  config.formatter = :documentation
end
