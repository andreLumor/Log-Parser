class LogParser
  
  def initialize(file_path)
    if File.file?(file_path)
      @file_path = file_path
    else
      raise "File not found"
    end
    
    @score = initialize_score
  end

  #return the first line of the log
  def head
    File.open(@file_path, 'r') do |file|
      file.first 
    end 
  end

  #return the number of lines in the log
  def count
    File.open(@file_path, 'r') do |file|
      file.count
    end
  end

  def get_json
    json_info = {
      "lines": self.count, 
      "players": self.players,  
    }

  def players
    @score.except('<world>').keys

  end

  #return kills hash
  def kills
    @score.except('<world>')
  end

  #return kills total
  def total_kills
    @score.values.sum
  end

  #read the file and returns the hash {"player1": score1, "player2": score2}
  private
  def initialize_score
    score_hash = {}
    File.readlines(@file_path).each do |line|

      if line.split[1] == 'Kill:'
        killer = line.split("killed")[0].split[5..].join(' ')
        victm = line.split("killed")[1].split[..-3].join(' ')
        if score_hash.key?(killer)
          score_hash[killer] += 1
        else
          score_hash[killer] = 1
        end

        unless score_hash.key?(victm)
          score_hash[victm] = 0
        end

        if killer == victm
          score_hash[killer] -= 2 #taking 1 that was added and 1 for suicide
        end
        
        if killer == '<world>'
          score_hash[victm] -= 1
          score_hash[killer] += 1 #balancing kills total in score
        end
      end
    
      if line.split[1] == 'ClientUserinfoChanged:'
        player = line.split('\\')[1]

        unless score_hash.key?(player) #não consegui fazer unless de uma linha só
          score_hash[player] = 0
        end
      end
    end
    score_hash
  end

end
