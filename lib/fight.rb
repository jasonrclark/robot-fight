class Fight
  FIGHTS = [
    :pointy,
    :laser,
    :huge,
    :small
  ]

  attr_reader :battle, :winner, :loser, :bot1, :bot2

  class ValidationError < StandardError
  end

  def initialize(bot1, bot2)
    validate(bot1)
    validate(bot2)
    @bot1, @bot2 = [bot1, bot2].shuffle
  end

  def validate(bot)
    lines = bot.lines
    if lines.any? { |line| line.length > 20 }
      raise ValidationError.new("Line too long in bot!")
    end

    if lines.length > 10
      raise ValidationError.new("Too many lines!")
    end
  end

  def fight!
    @battle = FIGHTS.sample
    send(@battle, @bot1, @bot2)

    if @pt1 > @pt2
      @winner = bot1
    elsif @pt2 > @pt1
      @winner = bot2
    end
  end

  def pointy(bot1, bot2)
    @pt1 = armor(bot1) - points(bot2)
    @pt2 = armor(bot2) - points(bot1)
  end

  def laser(bot1, bot2)
    @pt1 = armor(bot1) - lasers(bot2)
    @pt2 = armor(bot2) - lasers(bot1)
  end

  def huge(bot1, bot2)
    @pt1 = bot1.size
    @pt2 = bot2.size
  end

  def small(bot1, bot2)
    @pt1 = bot2.size
    @pt2 = bot1.size
  end

  def armor(bot)
    bot.count("|") + bot.count("-") + bot.count("[") + bot.count("]")
  end

  def points(bot)
    bot.count("<") + bot.count(">") + bot.count("^")
  end

  def lasers(bot)
    bot.count("*")
  end
end
