class LogParser
  
  def initialize(file_path)
    if File.file?(file_path)
      @file_path = file_path
    else
      raise "File not found"
    end
    
    @kills = initialize_kills
  end

  #retorna a primeira linha do arquivo
  def head
    File.open(@file_path, 'r') do |file|
      file.first 
    end 
  end

  #retorna o número de linhas do arquivo
  def count
    File.open(@file_path, 'r') do |file|
      file.count
    end 
  end

  def players
    @kills.keys
  end

  private
  def initialize_kills
    kills_hash = {}
    File.readlines(@file_path).each do |line|

      if line.split[1] == 'Kill:'
        killer = line.split("killed")[0].split[5..].join(' ')
        victm = line.split("killed")[1].split[..-3].join(' ')
        if kills_hash.key?(killer)
          kills_hash[killer] += 1
        else
          kills_hash[killer] = 1
        end

        if kills_hash.key?(victm)
          kills_hash[victm] += 1
        else
          kills_hash[victm] = 0
        end
      end
    
      if line.split[1] == 'ClientUserinfoChanged:'
        player = line.split('\\')[1]

        unless kills_hash.key?(player)
          kills_hash[player] = 0
        end
      end
    end
    kills_hash.delete('<world>')
    kills_hash
  end

end
