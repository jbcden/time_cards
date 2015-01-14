defmodule TimeCards.HoursCalculatorTest do
  use ExUnit.Case
  alias TimeCards.Entry

  test "it can take an entry and calculate the total hours" do
    e1 = %Entry{time_start: {{2015, 1, 13}, {12, 0,0}}, time_end: {{2015, 1, 13}, {14, 0, 0}}}
    result = TimeCards.HoursCalculator.calculate(e1)

    assert result == 2
  end
  test "it can sum for multiple entries" do
    e1 = %Entry{time_start: {{2015, 1, 13}, {12, 0,0}}, time_end: {{2015, 1, 13}, {14, 0, 0}}}
    e2 = %Entry{time_start: {{2015, 1, 23}, {12, 0,0}}, time_end: {{2015, 1, 23}, {14, 45, 0}}}
    result = TimeCards.HoursCalculator.calculate([e1,e2])

    assert result == 4.75
  end

  test "it can sum entries for a given range" do
    e1 = %Entry{time_start: {{2015, 1, 13}, {12, 0,0}}, time_end: {{2015, 1, 13}, {14, 0, 0}}}
    e2 = %Entry{time_start: {{2015, 1, 23}, {12, 0,0}}, time_end: {{2015, 1, 23}, {14, 45, 0}}}
    e3 = %Entry{time_start: {{2015, 2, 23}, {12, 0,0}}, time_end: {{2015, 1, 23}, {14, 45, 0}}}
    beginning = {{2015, 1, 12}, {12, 0, 0}}
    range_end = {{2015, 1, 24}, {12, 0, 0}}
    result = TimeCards.HoursCalculator.calculate([e1,e2], beginning, range_end)

    assert result == 4.75

  end
end
