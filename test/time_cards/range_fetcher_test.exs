defmodule TimeCards.RangeFetcherTest do
  use ExUnit.Case
  alias TimeCards.Entry

  test "it can return a list of entries within a time range" do
    e1 = %Entry{time_start: {{2015, 1, 13}, {12, 0,0}}, time_end: {{2015, 1, 13}, {14, 0, 0}}}
    e2 = %Entry{time_start: {{2015, 1, 23}, {12, 0,0}}, time_end: {{2015, 1, 23}, {14, 45, 0}}}
    e3 = %Entry{time_start: {{2015, 2, 23}, {12, 0,0}}, time_end: {{2015, 1, 23}, {14, 45, 0}}}
    beginning = {{2015, 1, 13}, {12, 0, 0}}
    range_end = {{2015, 1, 23}, {12, 0, 0}}
    result = TimeCards.RangeFetcher.fetch([e1,e2,e3], beginning, range_end)

    assert result == [e1, e2]
  end
end
