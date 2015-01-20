defmodule TimeCards.RangeFetcherTest do
  use ExUnit.Case
  alias TimeCards.Entry

  test "it can return a list of entries within a time range" do
    start1 = :calendar.datetime_to_gregorian_seconds({{2015, 1, 13}, {12,0,0}})
    after1 = :calendar.datetime_to_gregorian_seconds({{2015, 1, 13}, {14,0,0}})
    start2 = :calendar.datetime_to_gregorian_seconds({{2015, 1, 23}, {12,0,0}})
    after2 = :calendar.datetime_to_gregorian_seconds({{2015, 1, 13}, {14,45,0}})
    start3 = :calendar.datetime_to_gregorian_seconds({{2015, 2, 23}, {12,0,0}})
    after3 = :calendar.datetime_to_gregorian_seconds({{2015, 2, 23}, {14,45,0}})

    e1 = %Entry{time_start: start1, time_end: after1}
    e2 = %Entry{time_start: start2, time_end: after2}
    e3 = %Entry{time_start: start3, time_end: after3}
    beginning = :calendar.datetime_to_gregorian_seconds({{2015, 1, 13}, {12, 0, 0}})
    range_end = :calendar.datetime_to_gregorian_seconds({{2015, 1, 23}, {12, 0, 0}})
    result = TimeCards.RangeFetcher.fetch([e1,e2,e3], beginning, range_end)

    assert result == [e1, e2]
  end
end
