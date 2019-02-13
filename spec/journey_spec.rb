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

  context 'determine if journey is complete' do
    it 'views a journey as complete' do
      subject.touch_in("Waterloo")
      subject.touch_out("Embankment")
      expect(subject.journey_complete?).to eq(true)
    end

    it 'views a journey as incomplete if no touch out' do
      subject.touch_in("Waterloo")
      expect(subject.journey_complete?).to eq(false)
    end

    it 'views a journey as incomplete if no touch_in' do
      subject.touch_out("Embankment")
      expect(subject.journey_complete?).to eq(false)
    end
  end

  context 'it assigns a fare to a journey' do
    it 'assigns a fare of 1 by default' do
      expect(subject.fare).to eq(1)
    end

    it 'assigns a penalty fare to a journey' do
      subject.assign_penalty_fare
      expect(subject.fare).to eq(6)
    end
  end


end
