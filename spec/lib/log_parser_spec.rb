require_relative '../../lib/log_parser'

describe LogParser do
  context "when LogParser object is created" do
    it 'Raises "File not found" error when invalid path is given as argument' do
        expect { LogParser.new('lalala123') }.to raise_error("File not found")
    end
  end  

  describe '#head' do
    it 'Returns the first line of the file' do
        l = LogParser.new('spec/fixtures/test')
        expect(l.head).to be == "line 1\n"
    end
  end
end
