require 'blackjack_calculator'

describe BlackjackCalculator do

  it 'returns 0 score when there are no cards' do
    expect(subject.score).to eq 0
  end

  it 'returns correct score for regular cards' do
    subject.add_card '6'

    expect(subject.score).to eq 6
  end

  it 'returns 10 score for Jack card' do
    subject.add_card 'J'

    expect(subject.score).to eq 10
  end

  it 'returns 10 score for face cards' do
    subject.add_cards 'J', 'Q', 'K'

    expect(subject.score).to eq 30
  end

  context 'when Ace card' do
    it 'returns 11 score' do
      subject.add_card 'A'

      expect(subject.score).to eq 11
    end

    context 'when 11 score is not good for the player' do
      it 'returns 1 score when Ace is the last card' do
        subject.add_cards '7', '8', 'A'

        expect(subject.score).to eq 16
      end

      context 'when Ace is the first card' do
        it 'returns 1 score with regular cards' do
          subject.add_cards 'A', '7', '8'

          expect(subject.score).to eq 16
        end

        it 'returns 1 score with face cards' do
          subject.add_cards 'A', 'K', 'K'

          expect(subject.score).to eq 21
        end
      end
    end
  end

end