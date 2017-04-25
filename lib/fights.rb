class Fights
  KEEP = 20

  attr_reader :fights

  def initialize
    @fights = []
  end

  def each
    @fights.each do |fight|
      yield fight
    end
  end

  def add(result)
    @fights.insert(0, result)
    @fights = @fights.take(KEEP)
  end
end
