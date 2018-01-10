require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  str = params['str']
  shift = params['shift'].to_i
  n_str = caesar_cipher(str, shift) unless str.nil?

  erb :index, :locals => {:new_string => n_str}
end

def caesar_cipher(str, shift)
  n_str = ""
   
  str.each_char do |char|
    int = char.ord
    
    if (65..90) === int && 90 - int < shift
      char = (65 + (shift - (90 - int) - 1)).chr
    elsif 122 - int < shift
      char = (97 + (shift - (122 - int) - 1)).chr
    elsif (97..122) === int || (65..90) === int
      char = (int + shift).chr
    end
    
    n_str << char
  end
  
  n_str
end
