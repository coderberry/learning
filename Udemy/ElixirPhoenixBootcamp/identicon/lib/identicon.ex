defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  # RGB is the first 3 numbers
  # cavneb => [79, 138, 16, 197, 12, 253, 52, 136, 220, 17, 130, 13, 253, 239, 145, 14]
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  # Before
  # def pick_color(image) do
  #   # Before
  #   # %Identicon.Image{hex: hex_list} = image
  #   # [r, g, b | _tail] = hex_list

  #   # After
  #   %Identicon.Image{hex: [r, g, b | _tail]} = image
    
  #   # Create new Image with new property
  #   %Identicon.Image{image | color: {r, g, b}} # tuple
  # end

  # After
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end
end
