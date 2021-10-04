class RomanNumerals
  ROMANS = %w[I IV V IX X XL L XC C CD D CM M]
  NUMBERS = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]

  def to_roman(num)
    response = ''

    until num.zero?
      nearest_roman_number = calc_nearest_roman_number(num)
      num -= nearest_roman_number
      response += number_to_roman(nearest_roman_number)
    end

    response
  end

  def from_roman(roman)
    number = 0
    take = 2
    until roman.empty?
      last_two = roman.slice(-2..-1)
      last_two_pos = ROMANS.index(last_two)
      if last_two_pos
        roman = roman.slice(0..-3)
        number += NUMBERS[last_two_pos]
      else
        number += NUMBERS[ROMANS.index(roman[-1])]
        roman = roman.slice(0..-2)
      end
    end

    number
  end

  def calc_nearest_roman_number(num)
    i = 1
    nearest = NUMBERS[-i]

    until nearest <= num || nearest < 1
      i += 1
      nearest = NUMBERS[-i]
    end

    nearest
  end

  def number_to_roman(number)
    position = NUMBERS.index(number)

    return false unless position

    ROMANS[position]
  end

  def roman_char_to_number(char)
    position = ROMANS.index(char)

    return false unless position

    NUMBERS[position]
  end
end

rn = RomanNumerals.new

p rn.to_roman(1747)

p rn.from_roman('MDCCXLVII')
