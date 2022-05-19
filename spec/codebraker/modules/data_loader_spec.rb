# frozen_string_literal: true

RSpec.describe Modules::DataLoader do
  subject(:dummy) { Class.new { extend Modules::DataLoader } }

  describe 'load_data' do
    let(:file_data) do
      "---\n"\
        " :name: Ame\n"\
        " :difficulty: :easy\n"\
        " :attempts: 15\n"\
        " :attempts_left: 14\n"\
        " :hints: 2\n"\
        " :hints_left: 2\n"\
        " :date: !ruby/object:DateTime 2021-02-23 14:28:52.481897200 +02:00\n"\
    end

    let(:file_records) do
      [
        {
          name: 'Ame',
          difficulty: :easy,
          attempts: 15,
          attempts_left: 14,
          hints: 2,
          hints_left: 2,
          date: DateTime.parse('2021-02-23 14:28:52.481897200 +02:00')
        }
      ]
    end

    it 'returns empty array if file does not exist' do
      allow(File).to receive(:exist?).and_return(false)
      expect(dummy.load_data).to eq([])
    end

    it 'returns empty array if file exist' do
      allow(File).to receive(:read).and_return('')
      expect(dummy.load_data).to eq([])
    end
  end

  describe 'save_data' do
    let(:file) { StringIO.new }
    let(:data) do
      {
        secret_code: %w[4 5 6 1],
        name: 'Ame',
        difficulty: :easy,
        attempts: 15,
        attempts_left: 14,
        hints: 2,
        hints_left: 2,
        date: DateTime.parse('2021-02-23 14:28:52.481897200 +02:00')
      }
    end

    it 'creates file and saves data into it' do
      allow(File).to receive(:open).with(Modules::Constants::DATA_FILE, 'a').and_yield(file)
      expect(file).to receive(:write).with(data.to_yaml)
      dummy.save_data(data)
    end
  end
end
