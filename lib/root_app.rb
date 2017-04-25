class RootApp
  def call(env)
    [200, {}, [INTRO, env.to_s]]
  end
end

INTRO = <<-EOS
Whatever bro
EOS
