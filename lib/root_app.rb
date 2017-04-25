class RootApp
  def call(env)
    [200, {}, [intro(env)]]
  end

  def intro(env)
    INTRO.gsub("HTTP_HOST", env["HTTP_HOST"])
  end
end

INTRO = <<-EOS
Welcome to Robot Fight!

This app is intended to be driven at the command-line via something like curl.

Try out the following to see this intro:

  curl http://HTTP_HOST

How it works is you POST in a bot to http://HTTP_HOST/fight.

  curl http://HTTP_HOST/fight --data "
..........
. 0    0 .
..........
"

We'll pit your bot against one from our catalog in a pitched battle for survival!

Recent fights can be see at http://HTTP_HOST/fights and if you need
inspiration in making a bot, check out http://HTTP_HOST/bot for a few starters.

Bots must be less than 20 characters wide, 10 characters tall.

Battles involve:

  lasers (*),
  sharp pointy things (<, >, ^),
  armor (|, -, [, ])

Whose bot will reign supreme!

EOS
