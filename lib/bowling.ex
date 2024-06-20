defmodule Bowling do
  def score(game) do
    game
    |> Enum.with_index()
    |> Enum.reduce(0, fn {frame, index}, acc ->
      acc + score_frame(frame, game, index)
    end)
  end

  defp score_frame([10, _], game, index) do
    10 + next_two_rolls(game, index)
  end

  defp score_frame([a, b], game, index) when a + b == 10 do
    10 + next_roll(game, index)
  end

  defp score_frame([a, b], _game, _index) do
    a + (b || 0)
  end

  defp score_frame([a, b, c], _game, _index) do
    a + b + (c || 0)
  end

  defp next_two_rolls(game, index) do
    case Enum.at(game, index + 1) do
      [10, _] ->
        10 + (Enum.at(game, index + 2) |> List.first() || 0)
      [a, b] ->
        a + (b || 0)
      _ ->
        0
    end
  end

  defp next_roll(game, index) do
    case Enum.at(game, index + 1) do
      [a, _] ->
        a
      _ ->
        0
    end
  end
end
