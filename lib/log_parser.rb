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

    def lines(number_of_lines = 1)
        raise("Number of lines printed must be greater than zero") if number_of_lines <=0

        lines = @log.readlines.map(&:chomp)[0..number_of_lines-1]
        @log.seek(0)
        lines

    end
end