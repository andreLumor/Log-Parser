class Log_Parser
    def initialize(file_path)
        if File.file?(file_path)
            @log = File.open(file_path)
        else
            raise "File not found"
        end
        
    end

    def close
        @log.close
    end

    def print_lines(number_of_lines = 1)
        if number_of_lines > 0
            puts @log.readlines.map(&:chomp)[0..number_of_lines-1]
            @log.seek(0)
        else
            raise "Number of lines printed must be greater than zero"
        end
    end
end