defmodule TimeCards.RangeFetcher do
  alias TimeCards.TimeParser

  def fetch([], _, _), do: []

  def fetch([entry|tail], start, range_end) do
    if TimeParser.after_initial(entry, start) and
    TimeParser.before_end(entry, range_end) do
      [entry|fetch(tail, start, range_end)]
    else
      fetch(tail, start, range_end)
    end
  end
end
