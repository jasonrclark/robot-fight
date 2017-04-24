$LOAD_PATH << File.expand_path(File.join(__FILE__, "..", "lib"))

class Application
  def call(env)
    [200, {}, ["Beep"]]
  end
end

run Application.new
