defmodule TodoListTest do
  use ExUnit.Case

  test "use TodoList" do
    todo = TodoList.new |>
      TodoList.add_entry(%{date: {2013, 12, 19}, title: "Dentist"}) |>
      TodoList.add_entry(%{date: {2013, 12, 20}, title: "Basketball"}) |>
      TodoList.add_entry(%{date: {2013, 12, 19}, title: "Shopping"})

    assert TodoList.entries(todo, {2013, 12, 19}) == [
      %{date: {2013, 12, 19}, id: 3, title: "Shopping"},
      %{date: {2013, 12, 19}, id: 1, title: "Dentist"},
    ]

    new_todo = TodoList.update_entry(todo, 3,
      fn %{title: title} = entry ->
        %{entry | title: String.upcase(title)}
      end
    )

    assert TodoList.entries(new_todo, {2013, 12, 19}) == [
      %{date: {2013, 12, 19}, id: 3, title: "SHOPPING"},
      %{date: {2013, 12, 19}, id: 1, title: "Dentist"},
    ]

  end
end
