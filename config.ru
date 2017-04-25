$LOAD_PATH << File.expand_path(File.join(__FILE__, "..", "lib"))

require 'bots'
require 'bot_app'

require 'fight'
require 'fights'
require 'fight_app'
require 'fights_app'

require 'root_app'

bots = Bots.new
fights = Fights.new

run Rack::URLMap.new(
  "/bot"    => BotApp.new(bots),
  "/fight"  => FightApp.new(bots, fights),
  "/fights" => FightsApp.new(fights),
  "/"       => RootApp.new
)
