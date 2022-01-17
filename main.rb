require_relative 'src/log_parser.rb'

unless ARGV.empty?
    file_path = ARGV[0]
else
    raise "Must give file path as parameter"
end
log = Log_Parser.new(file_path)
log.print_lines(1)
log.close