defmodule TodoList.CsvImporterTest do
  use ExUnit.Case

  test "create TodoList from CSV file" do
    lines = [
      "2013/12/19,Dentist",
      "2013/12/20,Shopping",
      "2013/12/19,Movies",
    ]
    todo_list = TodoList.CsvImporter.new(lines)

    assert TodoList.entries(todo_list, {2013, 12, 19}) == [
      %{date: {2013, 12, 19}, id: 3, title: "Movies"},
      %{date: {2013, 12, 19}, id: 1, title: "Dentist"},
    ]
  end
end
