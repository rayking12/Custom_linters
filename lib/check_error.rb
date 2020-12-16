require 'colorize'
require 'strscan'
require_relative '../lib/file_reader.rb'

class Error
  attr_reader :checks, :errors

  def initialize(files)
    @checks = FileReader.new(files)
    @errors = []
    @keywords = %w[begin case class def do if module unless]
  end

  def trailing_spaces
    @checks.file_lines.each_with_index do |string_value, index|
      if string_value[-2] == ' ' && !string_value.strip.empty?
        @errors << "line:#{index + 1}:#{string_value.size - 1}: Error: Trailing whitespace detected."
        + " '#{string_value.gsub(/\s*$/, '_')}'"
      end
    end
  end

  def end_error
    keyword_count = 0
    end_count = 0
    @checks.file_lines.each_with_index do |string_value, _index|
      keyword_count += 1 if @keywords.include?(string_value.split(' ').first) || string_value.split(' ').include?('do')
      end_count += 1 if string_value.strip == 'end'
    end

    status = keyword_count <=> end_count
    log_error("Missing 'end'") if status.eql?(1)
    log_error("Unexpected 'end'") if status.eql?(-1)
  end

  def empty_line_error
    @checks.file_lines.each_with_index do |string_value, index|
      check_class_empty_line(string_value, index)
      check_def_empty_line(string_value, index)
      check_end_empty_line(string_value, index)
      check_do_empty_line(string_value, index)
    end
  end

  # rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

  def check_indentation
    msg = 'Indentation Error: Use 2 spaces for indentation.'
    cur_val = 0
    indent_val = 0

    @checks.file_lines.each_with_index do |string_value, index|
      strip_line = string_value.strip.split(' ')
      exp_val = cur_val * 2
      res_word = %w[class def if elsif until module unless begin case]

      next unless !string_value.strip.empty? || !strip_line.first.eql?('#')

      indent_val += 1 if res_word.include?(strip_line.first) || strip_line.include?('do')
      indent_val -= 1 if string_value.strip == 'end'

      next if string_value.strip.empty?

      indent_error(string_value, index, exp_val, msg)
      cur_val = indent_val
    end
  end

  private

  def indent_error(string_value, index, exp_val, msg)
    strip_line = string_value.strip.split(' ')
    emp = string_value.match(/^\s*\s*/)
    end_chk = emp[0].size.eql?(exp_val.zero? ? 0 : exp_val - 2)

    if string_value.strip.eql?('end') || strip_line.first == 'elsif' || strip_line.first == 'when'
      log_error("line:#{index + 1} #{msg}") unless end_chk
    elsif !emp[0].size.eql?(exp_val)
      log_error("line:#{index + 1} #{msg}")
    end
  end

  # rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

  def check_tag_error(*args)
    @checks.file_lines.each_with_index do |string_value, index|
      open_p = []
      close_p = []
      open_p << string_value.scan(args[0])
      close_p << string_value.scan(args[1])

      status = open_p.flatten.size <=> close_p.flatten.size

      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{args[2]}' #{args[4]}") if status.eql?(1)
      log_error("line:#{index + 1} Lint/Syntax: Unexpected/Missing token '#{args[3]}' #{args[4]}") if status.eql?(-1)
    end
  end

  def check_class_empty_line(string_value, index)
    msg = 'Extra empty line detected at class body beginning'
    return unless string_value.strip.split(' ').first.eql?('class')

    log_error("line:#{index + 2} #{msg}") if @checks.file_lines[index + 1].strip.empty?
  end

  def check_def_empty_line(string_value, index)
    msg1 = 'Extra empty line detected at method body beginning'
    msg2 = 'Use empty lines between method definition'

    return unless string_value.strip.split(' ').first.eql?('def')

    log_error("line:#{index + 2} #{msg1}") if @checks.file_lines[index + 1].strip.empty?
    log_error("line:#{index + 1} #{msg2}") if @checks.file_lines[index - 1].strip.split(' ').first.eql?('end')
  end

  def check_end_empty_line(string_value, index)
    return unless string_value.strip.split(' ').first.eql?('end')

    log_error("line:#{index} Extra empty line detected at block body end") if @checks.file_lines[index - 1].strip.empty?
  end

  def check_do_empty_line(string_value, index)
    msg = 'Extra empty line detected at block body beginning'
    return unless string_value.strip.split(' ').include?('do')

    log_error("line:#{index + 2} #{msg}") if @checks.file_lines[index + 1].strip.empty?
  end

  def log_error(error_msg)
    @errors << error_msg
  end
end
