class BotApp
  def initialize(bots)
    @bots = bots
  end

  def call(env)
    path = env["PATH_INFO"]
    response = Rack::Response.new

    if path.empty? || path == "/"
      @bots.each do |bot|
        response.write(bot)
        response.write("\n\n\n")
      end
    elsif path.match %r{/(\d+)$}
      response.write(@bots[$1])
    end

    response.finish
  end
end
