require 'colorize'
require 'strscan'
require_relative 'file_reader.rb'

class Error
  attr_reader :checks, :errors
  
  def initialize(files)
    @checks = FileReader.new(files)
    @errors = []
    @keywords = %w[begin case class def do if module unless]
  end

  def check_indentation
    indent_value = 0
    current_value = 0
    @checks.file.lines.each_with_index do |string_value, index|
      split_line = str_val.strip.split(' ')
      expected_value = current_value * 2
      check_words = %w[class def if elsif until  next while module unless begin case ]
        next unless !string_value.strip.empty? || !split_line.first.eql('#')

  end
end
