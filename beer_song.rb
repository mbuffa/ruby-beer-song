class BookKeeping
  VERSION = 2
end

class BeerSong
  def lyrics
    99.downto(0).to_a.map do |count|
      verse(count)
    end.join("\n")
  end

  def verses(start, finish)
    start.downto(finish).to_a.map { |count| verse(count) }.join("\n")
  end

  def verse(count)
    verse = first_sentence(count) + second_sentence(count)
    verse += "\n" if count.zero?
    verse
  end

  private

  def first_sentence(count)
    "#{titleize(remaining(count))} #{bottle_counter(count)} of beer on the wall, #{remaining(count)} #{bottle_counter(count)} of beer.\n"
  end

  def second_sentence(count)
    return 'Go to the store and buy some more, 99 bottles of beer on the wall.' if count.zero?
    "Take #{take(count)} down and pass it around, #{remaining(count - 1)} #{bottle_counter(count - 1)} of beer on the wall.\n"
  end

  def remaining(count)
    return 'no more' if count.zero?
    count
  end

  def take(count)
    return 'it' if count == 1
    'one'
  end

  private

  def titleize(arg)
    return arg if arg.is_a? Integer
    arg[0].upcase + arg[1..(arg.size - 1)]
  end

  def bottle_counter(count)
    return 'bottle' if count == 1
    'bottles'
  end
end
