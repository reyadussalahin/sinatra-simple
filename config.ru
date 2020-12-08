$: << File.join(File.dirname(__FILE__), "lib")

require "rubygems"
require "bundler"

Bundler.require

# set :bind, "0.0.0.0"
# set :port, 8000

require "app"
# Rack::Handler.default.run(MyApp, :Port => 8000)
run MyApp
