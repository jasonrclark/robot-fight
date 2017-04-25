class FightsApp
  def initialize(fights)
    @fights = fights
  end

  def call(env)
    response = Rack::Response.new
    @fights.each do |fight|
      response.write(fight)
      response.write("\n")
    end
    response.finish
  end
end
