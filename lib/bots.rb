class Bots
  def initialize
    @bots = []
    add <<-EOS
 .................
 .               .
[.    *     *    .]
 .       '       .
 .       ~       .
 .................
 EOS

    add <<-EOS
 --------------
 |            |
<|  -|-  -|-  |>
 |            |
 |     --     |
 --------------
 EOS

    add <<-EOS
   --------
 <          >
<  <.>  <.>  >
<     --     >
  <-------->
 EOS
  end

  def [](index)
    @bots[index.to_i]
  end

  def add(bot)
    @bots << bot
  end

  def each
    @bots.each do |bot|
      yield bot
    end
  end

  def sample
    @bots.sample
  end
end
