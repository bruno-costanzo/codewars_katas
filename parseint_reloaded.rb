class ParseInt
  NUMBERS_STRINGS = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }

  UNITS_STRINGS = {
    'hundred' => 100,
    'thousand' => 1000
  }

  STRINGS_NUMBERS = NUMBERS_STRINGS.invert

  def parse_int(string, res = '')
    return 1_000_000 if string.include?('million')

    string = string.gsub(' and ', ' ')
    thousands = string.split(' thousand ')
    thousands.each do |part|
      res += ('000' + to_number(part).to_s)[-3..-1] if to_number(part).to_s.size <= 3
      res += to_number(part).to_s if to_number(part).to_s.size > 3
    end
    res.to_i
  end

  def to_number(part, result = 0)
    words = part.split
    words.each do |word|
      if word == 'hundred'
        result *= 100
      elsif STRINGS_NUMBERS[word]
        result += STRINGS_NUMBERS[word]
      elsif word == 'thousand'
        result *= 1000
      else
        return 0 unless word.index('-')

        ws = word.split('-')
        ws.each { |w| result += STRINGS_NUMBERS[w] }
      end
    end

    result
  end
end

def parse_int(string)
  ParseInt.new.parse_int(string)
end
