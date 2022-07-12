defmodule Cards do
  @moduledoc """
    Provides methods for creating and hadling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    for suit <- ["Tree", "Spades", "Clubs", "Hearts", "Diamonds"],
        value <- ["Ace", "Two", "Three", "Four", "Five"] do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck), do: Enum.shuffle(deck)

  def contains?(deck, cards), do: Enum.member?(deck, cards)

  @doc """
      Divides a deck into a hand and the remainder of the deck.
      The `hand_size` argument indicates how many cards should
      be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      => ["Ace of Spades"]
  """
  def deal(deck, hand_size), do: Enum.split(deck, hand_size)

  def save(deck, filename) do
    File.write(filename, :erlang.term_to_binary(deck))
  end

  def load(filename) do
    with {:ok, binary} <- File.read(filename) do
      :erlang.binary_to_term(binary)
    else
      {:error, reason} when reason == :enoent ->
        "O arquivo nao existe."
    end
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)

      {:error, reason} when reason == :enoent ->
        "O arquivo nao existe"
    end
  end

  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
