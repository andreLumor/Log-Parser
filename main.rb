require_relative 'lib/log_parser.rb'
require 'json'

unless ARGV.empty?
  file_path = ARGV[0]
else
  raise "Must give file path as parameter"
end

parser = LogParser.new(file_path)

json_info = {
  "lines": parser.count, 
  "players": parser.players, 
  "kills": parser.kills, 
  "total_kills": parser.total_kills 
}

print file_path+": "

puts JSON.pretty_generate(json_info)
