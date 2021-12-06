defmodule Cards do
    def create_deck do
      ["Ace", "Two", "Three"]
      |> shuffle
    end

    def shuffle(param) do
      param ++ ["Foi!!"]
    end

    def save() do
      
    end

    def load() do
      
    end
end