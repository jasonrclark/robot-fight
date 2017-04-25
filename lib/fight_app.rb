class FightApp
  def initialize(bots, fights)
    @bots = bots
    @fights = fights
  end

  def call(env)
    request = Rack::Request.new(env)
    return [400, {}, ["Bad Request -- Try POST"]] unless request.post?

    response = Rack::Response.new

    bot = @bots.sample
    challenger = request.body.read

    fight = Fight.new(@bots.sample, challenger)
    puts fight.bot1
    puts fight.bot2

    fight.fight!

    result = HEADER.dup
    result << fight.bot1
    result << "\nVS in the battle of #{fight.battle.to_s.upcase}!!!!\n"
    result << fight.bot2
    if fight.winner
      result << "\n\nAnd the winner is...\n"
      result << fight.winner
    else
      result << "\n\nAnd it's a draw? BOOOOOORING\n"
    end

    response.write(result)
    @fights.add(result)

    response.finish
  rescue Fight::ValidationError => e
    return [400, {}, ["Bad Request -- #{e.message}"]]
  end

  HEADER = <<-'EOS'
 (                                  (                                
 )\ )            )            )     )\ )                   )      )  
(()/(         ( /(         ( /(    (()/(   (    (  (    ( /(   ( /(  
 /(_))   (    )\())   (    )\())    /(_))  )\   )\))(   )\())  )\()) 
(_))     )\  ((_)\    )\  (_))/    (_))_| ((_) ((_))\  ((_)\  (_))/  
| _ \   ((_) | |(_)  ((_) | |_     | |_    (_)  (()(_) | |(_) | |_   
|   /  / _ \ | '_ \ / _ \ |  _|    | __|   | | / _` |  | ' \  |  _|  
|_|_\  \___/ |_.__/ \___/  \__|    |_|     |_| \__, |  |_||_|  \__|  
                                               |___/                 
    EOS
end
