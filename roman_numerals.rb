class RomanNumerals
  ROMANS = %w[I II III IV V VI VII VIII IX X XL L XC C CD D CM M]
  NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]

  def to_roman(num, response = '')
    until num.zero?
      nearest_roman_number = calc_nearest_roman_number(num)
      num -= nearest_roman_number
      response += number_to_roman(nearest_roman_number)
    end

    response
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

  def num_with_zeros_to_roman(num)
    (1..3).each do |i|
      NUMBERS.each do |number|
        # next if number_char_to_roman(number).size == 2
        return create_roman_number(number, i) if num == number * i
      end
    end
  end

  def create_roman_number(number, i)
    number_char_to_roman(number) * i
  end

  def roman_char_to_number(char)
    position = ROMANS.index(char)

    return false unless position

    NUMBERS[position]
  end

  def number_char_to_roman(num)
    position = NUMBERS.index(num)

    return false unless position

    ROMANS[position]
  end
end

rn = RomanNumerals.new

p rn.to_roman(174)
