require_relative '../../lib/log_parser'

describe LogParser do
  context "when LogParser object is created" do
    it 'Raises "File not found" error when invalid path is given as argument' do
        expect { LogParser.new('lalala123') }.to raise_error("File not found")
    end
  end  

  let(:log) { LogParser.new('spec/fixtures/dummy.log') }
  describe '#head' do
    it 'Returns the first line of the file' do
      expect(log.head).to be == "  1:47 InitGame: \\sv_floodProtect\\1\\sv_maxPing\\0\\sv_minPing\\0\\sv_maxRate\\10000\\sv_minRate\\0\\sv_hostname\\Code Miner Server\\g_gametype\\0\\sv_privateClients\\2\\sv_maxclients\\16\\sv_allowDownload\\0\\bot_minplayers\\0\\dmflags\\0\\fraglimit\\20\\timelimit\\15\\g_maxGameClients\\0\\capturelimit\\8\\version\\ioq3 1.36 linux-x86_64 Apr 12 2009\\protocol\\68\\mapname\\q3dm17\\gamename\\baseq3\\g_needpass\\0\n" 
    end
  end

  describe '#count' do
    it 'Returns number of lines of the file' do
      expect(log.count).to be == 33
    end
  end
end
