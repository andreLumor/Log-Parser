require_relative '../lib/log_parser'
describe Log_Parser do
    it 'Returns the first line of the file when the method Log_Parser.lines is called' do
        l = Log_Parser.new('spec/test')
        expect(l.lines).to be == ["line 1"]
    end

    it 'Returns the N first lines of the file when the method Log_Parser.lines(N) is called' do
        l = Log_Parser.new('spec/test')
        expect(l.lines(3)).to be == ["line 1", "line 2", "line 3"] 
    end

    it 'Raises "File not found" error when invalid path is given as argument' do
        expect { Log_Parser.new('lalala123') }.to raise_error("File not found")
    end    

    it 'Raises "Number of lines printed must be greater than zero" error when numbers<1 are given to the Log_Parser.lines method' do
        l = Log_Parser.new('spec/test')
        expect { l.lines(-1) }.to raise_error("Number of lines printed must be greater than zero")
    end

    it 'Raises "Too many lines" error when argument in Log_Parser.lines is greater than the file\'s number of lines (fazer durante a tarefa 2)'
end