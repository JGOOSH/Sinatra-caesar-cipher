require 'sinatra'
#require 'sinatra/reloader'

UPPERCASE_UPPER_LIMIT = "Z".ord
UPPERCASE_LOWER_LIMIT = "A".ord
UNDERCASE_UPPER_LIMIT = "z".ord
UNDERCASE_LOWER_LIMIT = "a".ord

def caesar_cipher(string, shift)
  caesar_string = ""
  string.each_char { |c|
    if c.ord.between?(UPPERCASE_LOWER_LIMIT, UPPERCASE_UPPER_LIMIT)
      c = (((c.ord - UPPERCASE_LOWER_LIMIT + shift)%26)+UPPERCASE_LOWER_LIMIT).chr
    elsif c.ord.between?(UNDERCASE_LOWER_LIMIT, UNDERCASE_UPPER_LIMIT)
      c = (((c.ord - UNDERCASE_LOWER_LIMIT + shift)%26)+UNDERCASE_LOWER_LIMIT).chr
    end
    caesar_string << c
  }
  return caesar_string
end

get '/' do
  erb :index
end

post '/' do
  @output = caesar_cipher(params[:string].to_s , params[:shift].to_i)
  erb :index
end
