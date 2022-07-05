defmodule Cards do
    def create_deck do
      values = ["Ace", "Two", "Three", "Four", "Five"]
      suits = ["Tree", "Spades", "Clubs", "Hearts", "Diamonds"]

       for suit <- suits, value <- values, do: "#{value} of #{suit}"
    end

    def shuffle(deck), do: Enum.shuffle(deck)

    def contains?(deck, cards), do: Enum.member?(deck, cards)

    def deal(deck, hand_size), do: Enum.split(deck, hand_size)
end
