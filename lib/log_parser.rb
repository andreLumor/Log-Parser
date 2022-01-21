class LogParser
  
  def initialize(file_path)
    if File.file?(file_path)
      @file_path = file_path
    else
      raise "File not found"
    end		
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
end
