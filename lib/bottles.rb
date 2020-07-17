class Bottles
  def song
    verses(99, 0)
  end

  def verses(start_count, end_count)
    paragraph = verse(start_count)

    if start_count != end_count
      paragraph += "\n"

      paragraph += verses(start_count - 1, end_count)
    end

    paragraph
  end

  def verse(bottle_count)
    return alternate_verse if bottle_count == 0

    main_verse(bottle_count)
  end

  private

  def main_verse(count)
    "#{first_sentence(count)}" \
      "#{third_phrase(count)}" \
      "#{last_phrase(count - 1)}\n"
  end

  def alternate_verse
    "No more bottles of beer on the wall, " \
      "no more bottles of beer.\n" \
      "Go to the store and buy some more, " \
      "99 bottles of beer on the wall.\n"
  end

  def pluralize_bottle(count)
    return 'bottle' if count == 1

    'bottles'
  end

  def first_sentence(count)
    "#{count} #{pluralize_bottle(count)} of beer on the wall, " \
    "#{count} #{pluralize_bottle(count)} of beer.\n"
  end

  def third_phrase(count)
    return 'Take it down and pass it around, ' if count == 1

    'Take one down and pass it around, '
  end

  def last_phrase(count)
    return 'no more bottles of beer on the wall.' if count.zero?

    "#{count} #{pluralize_bottle(count)} of beer on the wall."
  end
end
