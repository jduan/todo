defmodule TodoTest do
  use ExUnit.Case

  test "use TodoList" do
    todo = TodoList.new |>
      TodoList.add_entry(%{date: {2013, 12, 19}, title: "Dentist"}) |>
      TodoList.add_entry(%{date: {2013, 12, 19}, title: "Basketball"})

    assert TodoList.entries(todo, {2013, 12, 19}) == [
      %{date: {2013, 12, 19}, title: "Basketball"},
      %{date: {2013, 12, 19}, title: "Dentist"},
    ]
  end
end
