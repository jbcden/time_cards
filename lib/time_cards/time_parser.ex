defmodule TimeCards.TimeParser do
  alias Timex.Date

  def parse(date) do
    datetime = Date.from(date, timezone)
    Date.local(datetime, timezone)
  end

  def convert_and_round(time_in_mins) do
    Kernel.round((time_in_mins/60)*4)/4
  end

  def after_initial(entry, initial) do
    (entry.time_start - initial) > -1
  end

  def before_end(entry, end_time) do
    (end_time - entry.time_start) > -1
  end

  defp timezone, do: Date.timezone("EST")
end
