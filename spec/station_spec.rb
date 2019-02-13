require 'station'

describe Station do

  context 'station returns expected attributes' do
    before (:each) do
      @subject = Station.new("Baker Street", 1)
    end

    it 'returns Baker Street when asked for station name' do
      expect(@subject.name).to eq("Baker Street")
    end

    it 'returns 1 when asked for a zone' do
      expect(@subject.zone).to eq(1)
    end
  end


end
