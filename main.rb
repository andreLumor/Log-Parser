log = File.open('logs/games.log')
puts log.readlines.map(&:chomp)[0]
log.close