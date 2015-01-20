defmodule TimeCards.HoursCalculator do
  alias Timex.Date
  alias TimeCards.TimeParser

  def calculate([]), do: 0

  def calculate([entry|tail]) do
    calculate(entry) + calculate(tail)
  end

  def calculate(entry) do
    time_in_mins = (entry.time_end - entry.time_start) / 60
    TimeParser.convert_and_round(time_in_mins)
  end
end
