defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]
    suits  = [ "♡", "♧", "♢", "♤" ]

    # List Comprehension (for every element in the list, do this, e.g. MAP)

    # This is the WRONG way to do it (nested arrays):
    # for suit <- suits do
    #   for value <- values do
    #     value <> suit
    #   end
    # end
  
    # Solution #1: Flatten the array of arrays
    # cards = for suit <- suits do
    #   for value <- values do
    #     value <> suit
    #   end
    # end
    # List.flatten(cards)

    # Solution #2: MULTIPLE List Comprehensions
    for suit <- suits, value <- values do
      value <> suit
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    Determines whether a deck contains a given card.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "A♧")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card) 
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be
    in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["2♡"]
      
  """
  def deal(deck, hand_size) do
    # Solution #1
    # deck
    # |> Enum.split(hand_size)
    # |> elem(0)

    # Solution #2: Pattern Matching
    # { hand, _rest_of_deck } = Enum.split(deck, hand_size)
    # hand

    Enum.split(deck, hand_size)
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # Verbose way of doing it
    # { status, binary } = File.read(filename)
    # case status do
    #   :ok    -> :erlang.binary_to_term(binary)
    #   :error -> "That file does not exist"
    # end

    # Clean (correct) way of doing it
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } -> "That file does not exist"
    end
  end
end
