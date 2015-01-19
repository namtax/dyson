module Dyson
  describe CLI do
    subject     { CLI.new(opts) }
    let(:opts)  { nil }

    before { allow_any_instance_of(FileParser)
             .to receive(:file_path)
             .and_return('spec/fixtures/input.txt') }

    it { expect(subject.run).to eq %Q[3 0\n1] }

    context 'invalid opts' do
      let(:opts) { ['any-opts']}
      it { expect(subject.run).to eq 'Dyson doesnt accept any command line arguments' }
    end

    context 'help' do
      let(:opts) { ['--help']}
      let(:help) { ['----------------------------',
                    'Please store an input.txt file at dyson/bin',
                    'Example:',
                    '5 5 #Room dimensions',
                    '1 2 #Hoover start position',
                    '1 0 #Zero or more dirt patches',
                    '2 2',
                    '2 3',
                    'NNESEESWNWW #instructions']}

      it { expect(subject.run).to eq help }
    end
  end
end
