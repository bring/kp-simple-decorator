require File.expand_path(File.dirname(__FILE__) + '/../lib/simple_decorator/response_weaver.rb')
Dir["#{File.dirname(__FILE__)}/matchers/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include(CustomHtmlMatcher)
end