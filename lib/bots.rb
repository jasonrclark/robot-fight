class Bots
  def self.[](index)
    @bots[index.to_i]
  end

  def self.add(bot)
    @bots ||= []
    @bots << bot
  end

  def self.each
    @bots.each do |bot|
      yield bot
    end
  end

  add <<-EOS
 ..............
 .  *      *  .
[.      '     .]
 .            .
 .     ~~     .
 ..............
 EOS

end
