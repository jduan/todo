defmodule TodoList.CsvImporter do
  def new(lines) do
    lines
    |> Enum.map(fn line ->
      [date, title] = String.split(line, ",")
      date_tuple = String.split(date, "/")
                    |> Enum.map(&String.to_integer/1)
                    |> List.to_tuple
      %{date: date_tuple, title: title}
    end)
    |> TodoList.new
  end
end
