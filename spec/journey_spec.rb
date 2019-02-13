require 'journey'
require 'station'

describe Journey do

  context 'journey returns entry station ' do

    it 'returns Baker Street when asked for entry station' do
      subject.touch_in("Baker Street")
      expect(subject.entry_station).to eq("Baker Street")
    end

    it 'returns Finsbury Park when asked for entry station' do
      subject.touch_out("Finsbury Park")
      expect(subject.exit_station).to eq("Finsbury Park")
    end

  end


end
