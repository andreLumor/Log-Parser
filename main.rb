require_relative 'lib/log_parser.rb'

unless ARGV.empty?
  file_path = ARGV[0]
else
  raise "Must give file path as parameter"
end
parser = LogParser.new(file_path)
puts parser.head
