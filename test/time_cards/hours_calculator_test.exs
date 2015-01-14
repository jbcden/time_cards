defmodule TimeCards.HoursCalculatorTest do
  use ExUnit.Case
  alias TimeCards.Entry

  test "it can take an entry and calculate the total hours" do
    e1 = %Entry{time_start: {{2015, 1, 13}, {12, 0,0}}, time_end: {{2015, 1, 13}, {14, 0, 0}}}
    result = TimeCards.HoursCalculator.calculate(e1)

    assert result == 2
  end
end
