class Log_Parser
    def initialize(file_path)
        if File.file?(file_path)
            @file_path = file_path
        else
            raise "File not found"
        end
        
    end

    def head
        File.open(@file_path, 'r') do |file|
            file.first 
        end 
    end
end
