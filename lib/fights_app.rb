class FightsApp
  def initialize(fights)
    @fights = fights
  end

  def call(env)
    response = Rack::Response.new
    @fights.each do |fight|
      response.write(fight)
      response.write("\n")
      response.write("*" * 80)
      response.write("\n")
      response.write("\n")
    end
    response.finish
  end
end
