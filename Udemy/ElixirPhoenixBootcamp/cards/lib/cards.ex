defmodule Cards do
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

  def contains?(deck, card) do
    Enum.member?(deck, card) 
  end

  def deal(deck, hand_size) do
    # Solution #1
    # deck
    # |> Enum.split(hand_size)
    # |> elem(0)

    # Solution #2: Pattern Matching
    { hand, _rest_of_deck } = Enum.split(deck, hand_size)
    hand
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    { status, binary } = File.read(filename)

    case status do
      :ok    -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
  end
end
