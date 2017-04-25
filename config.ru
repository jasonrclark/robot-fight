$LOAD_PATH << File.expand_path(File.join(__FILE__, "..", "lib"))

require 'bot'
require 'bots'
require 'bot_app'
require 'root_app'

run Rack::URLMap.new(
  "/bot" => BotApp.new,
  "/"    => RootApp.new
)
