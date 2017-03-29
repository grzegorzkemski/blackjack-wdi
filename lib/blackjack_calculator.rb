class BlackjackCalculator
  FACE_CARDS  = %w(J Q K)
  ACE_CARD    = 'A'
  BLACKJACK   = 21

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def add_cards(*cards)
    @cards += cards
  end

  def score
    sum = base_sum

    ace_count.times { sum += 10 if sum + 10 <= BLACKJACK }

    sum
  end

  private

  def ace_count
    @cards.count { |card| ace?(card) }
  end

  def base_sum
    @cards.reduce(0) { |sum, card| sum + card_score(card) }
  end

  def card_score(card)
    if FACE_CARDS.include?(card)
      10
    elsif ace?(card)
      1
    else
      card.to_i
    end
  end

  def ace?(card)
    card == ACE_CARD
  end

end