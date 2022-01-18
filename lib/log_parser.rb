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

    def head()
        lines = @log.readlines.map(&:chomp)[0]
        @log.seek(0)
        lines

    end
end
