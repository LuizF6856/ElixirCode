defmodule Cards do
  @moduledoc """
    Provides methods for creating and hadling a deck of cards
  """

    def create_deck do
      values = ["Ace", "Two", "Three", "Four", "Five"]
      suits = ["Tree", "Spades", "Clubs", "Hearts", "Diamonds"]

       for suit <- suits, value <- values, do: "#{value} of #{suit}"
    end

    def shuffle(deck), do: Enum.shuffle(deck)

    def contains?(deck, cards), do: Enum.member?(deck, cards)

    def deal(deck, hand_size), do: Enum.split(deck, hand_size)

    def save(deck, filename) do
      binary = :erlang.term_to_binary(deck)
      File.write(filename, binary)
    end

    def load(filename) do
      with {:ok, binary} <- File.read(filename) do
        :erlang.binary_to_term(binary)
      else
        {:error, reason} when reason == :enoent
          -> "O arquivo nao existe."
      end
    end

    def load(filename) do
      case File.read(filename) do
        {:ok, binary} ->
             :erlang.binary_to_term(binary)

        {:error, reason} when reason == :enoent
           -> "O arquivo nao existe"
      end
    end

    def create_hand(hand_size) do
      create_deck()
      |> shuffle()
      |> deal(hand_size)
    end
end
