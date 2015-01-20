defmodule TimeCards.HoursCalculatorTest do
  use ExUnit.Case
  alias TimeCards.Entry

  test "it can take an entry and calculate the total hours" do
    start = :calendar.datetime_to_gregorian_seconds({{2015, 1, 13}, {12, 0,0}})
    end_time = :calendar.datetime_to_gregorian_seconds({{2015, 1, 13}, {14, 0,0}})
    e1 = %Entry{time_start: start, time_end: end_time}
    result = TimeCards.HoursCalculator.calculate(e1)

    assert result == 2
  end
  test "it can sum for multiple entries" do
    before1 = :calendar.datetime_to_gregorian_seconds({{2015, 1, 13}, {12, 0,0}})
    after1 = :calendar.datetime_to_gregorian_seconds({{2015, 1, 13}, {14, 0,0}})
    before2 = :calendar.datetime_to_gregorian_seconds({{2015, 1, 23}, {12, 0,0}})
    after2 = :calendar.datetime_to_gregorian_seconds({{2015, 1, 23}, {14, 45,0}})

    e1 = %Entry{time_start: before1, time_end: after1}
    e2 = %Entry{time_start:  before2, time_end: after2}
    result = TimeCards.HoursCalculator.calculate([e1,e2])

    assert result == 4.75
  end
end
