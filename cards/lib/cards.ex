defmodule Cards do
    def create_deck do
      ["Ace", "Two", "Three"]
      |> shuffle
    end

    def shuffle(deck) do
      Enum.shuffle(deck)
      |> contains?("Two")
    end

    def contains?(deck, cards) do
      if (cards in deck), do: true, else: false 
    end

    def load() do
      
    end
end