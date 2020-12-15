require 'colorize'

class FileReader
  attr_reader :errors_message, :files_lines, :file_path, :file_lines_count
  def initialize(files)
    @error_message = ''
    @files = files
    begin
      @file_lines = File.readlines(@files)
      @file_lines_count = @file_lines.size
    rescue StandardError => e
      @file_lines = []
      @errors_message = 'Please check file name or path\n'.colorize(:light_green) + exception.to_s.colorize(:red)
    end
  end
end
