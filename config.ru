$LOAD_PATH << File.expand_path(File.join(__FILE__, "..", "lib"))

require 'bots'
require 'bot_app'
require 'root_app'

#use Rack::Reloader

run Rack::URLMap.new(
  "/bot" => BotApp.new,
  "/"    => RootApp.new
)
