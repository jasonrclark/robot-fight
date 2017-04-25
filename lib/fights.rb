class Fights
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
    @fights = @fights.take(10)
  end
end
