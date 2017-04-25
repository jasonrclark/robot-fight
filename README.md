# Welcome to Robot Fight!

Code's at https://github.com/jasonrclark/robot-fight!

This app is intended to be driven at the command-line via something like curl.

Try out the following to see this intro:

  curl http://localhost:9292

How it works is you POST in a bot to http://localhost:9292/fight.

  curl http://localhost:9292/fight --data "
..........
. 0    0 .
..........
"

We'll pit your bot against one from our catalog in a pitched battle for survival!

Recent fights can be see at http://localhost:9292/fights and if you need
inspiration in making a bot, check out http://localhost:9292/bot for a few starters.

Bots must be less than 20 characters wide, 10 characters tall.

Battles involve:

  lasers (*),
  sharp pointy things (<, >, ^),
  armor (|, -, [, ])

Whose bot will reign supreme!
