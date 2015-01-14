defmodule TimeCards.TimeParserTest do
  use ExUnit.Case
  alias TimeCards.TimeParser

  test "it can parse a tuple representing a datetime" do
    datetime = {{2015, 1, 13}, {12, 15, 0}}
    result = TimeParser.parse(datetime)

    assert result == parsed_time
  end

  test "it takes a time in minutes and converts it to hours" do
    converted_time = TimeParser.convert_and_round(120)

    assert converted_time == 2
  end

  test "it can round to the nearest 1/4 hour" do
    converted_time = TimeParser.convert_and_round(80)

    assert converted_time == 1.25
  end

  defp parsed_time do
    %Timex.DateTime{calendar: :gregorian, day: 13, hour: 12, minute: 15,
       month: 1, ms: 0, second: 0,
        timezone: %Timex.TimezoneInfo{dst_abbreviation: "EST", dst_end_day: :undef,
            dst_end_time: {0, 0}, dst_name: "EST", dst_start_day: :undef,
              dst_start_time: {0, 0}, full_name: "EST", gmt_offset_dst: 0,
                gmt_offset_std: -300, standard_abbreviation: "EST", standard_name: "EST"},
               year: 2015}
  end
end