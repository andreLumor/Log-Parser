require_relative 'lib/log_parser.rb'
require 'json'

unless ARGV.empty?
  file_path = ARGV[0]
else
  raise "Must give file path as parameter"
end

parser = LogParser.new(file_path)

json_info = parser.get_json

print file_path+": "

puts JSON.pretty_generate(json_info)
