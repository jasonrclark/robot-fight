class RootApp
  def call(env)
    [200, {}, ["Beep"]]
  end
end
