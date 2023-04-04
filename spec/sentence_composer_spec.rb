require_relative '../lib/sentence_composer'

RSpec.describe SentenceComposer do
  subject { SentenceComposer.new(input) }

  describe 'if input not provided' do
    let(:input) {''}
    it 'returns blank array' do
      expect(subject.call).to eq([])
    end
  end

  describe 'if input provided' do
    context 'for input - abcdefg' do
      let(:input) {'abcdefg'}
      let(:output) {
        [
          'abcd e fg',
          'a bc def g',
          'a bcd e fg'
        ]
      }
      it 'returns valid multiple output strings' do
        expect(subject.call).to eq(output)
      end
    end

    context 'for input - abcc' do
      let(:input) {'abcc'}
      let(:output) {
        [
          'a bc c'
        ]
      }
      it 'returns valid single output string' do
        expect(subject.call).to eq(output)
      end
    end

    context 'for input - abcdefghij' do
      let(:input) {'abcdefghij'}
      let(:output){
        [
          'abcd e fg h ij',
          'abcd e fg hij',
          'a bc def g h ij',
          'a bc def g hij',
          'a bcd e fg h ij',
          'a bcd e fg hij'
        ]
      }
      it 'returns array of multiple string' do
        expect(subject.call).to eq(output)
      end
    end

    context 'for input - abcd' do
      let(:input) {'abcd'}
      it 'returns blank array' do
        expect(subject.call).to eq([])
      end
    end
  end
end