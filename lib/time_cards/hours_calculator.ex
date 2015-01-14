defmodule TimeCards.HoursCalculator do
  alias Timex.Date
  alias TimeCards.TimeParser

  def calculate(entry) do
    start_time = TimeParser.parse(entry.time_start)
    end_time   = TimeParser.parse(entry.time_end)

    _calculate(start_time, end_time)
  end
  defp _calculate(start_time, end_time) do
    time_in_mins = Date.diff(start_time, end_time, :mins)
    TimeParser.convert_and_round(time_in_mins)
  end
end
