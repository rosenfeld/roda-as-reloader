require 'active_support' # non-sense, but AS requires this to be required before any other module
require 'active_support/dependencies'

deps = ActiveSupport::Dependencies
if ENV['RACK_ENV'] == 'development'
  deps.mechanism = :load
  deps.autoload_paths = [__dir__] # add lib, models, as you wish

  # require_dependency 'app' # in case you don't want autoloading/const_missing uncomment this
  run ->(env){
    deps.clear
    App.call env
  }
else
  deps.mechanism = :require
  require_relative './app'
  run App
end
