require_relative '../lib/log_parser'
describe Log_Parser do
    it 'Returns the first line of the file when the method Log_Parser.lines is called' do
        l = Log_Parser.new('spec/test')
        expect(l.head).to be == "line 1\n"
    end

    it 'Raises "File not found" error when invalid path is given as argument' do
        expect { Log_Parser.new('lalala123') }.to raise_error("File not found")
    end    

end
