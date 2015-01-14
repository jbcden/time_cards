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
    parsed_entry = parse(entry)
    parsed_initial = parse(initial)
    compare(parsed_entry, parsed_initial) == 1
  end

  defp timezone, do: Date.timezone("EST")
  defp compare(entry, range_setter), do: Date.compare(entry, range_setter)
end
