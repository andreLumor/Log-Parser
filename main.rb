require_relative 'lib/log_parser.rb'

unless ARGV.empty?
    file_path = ARGV[0]
else
    raise "Must give file path as parameter"
end
parser = Log_Parser.new(file_path)
puts parser.print_lines(1)
parser.close