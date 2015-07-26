defmodule TodoTest do
  use ExUnit.Case

  test "truth" do
    assert 1 == 1
  end

  test "deep update" do
    todo_list = [
      {1, %{date: {2013, 12, 19}, title: "Dentist"}},
      {2, %{date: {2013, 12, 20}, title: "Shopping"}},
      {3, %{date: {2013, 12, 19}, title: "Movies"}},
    ] |> Enum.into(HashDict.new)

    new_todo_list = Kernel.put_in(todo_list[3][:title], "Theater")

    assert "Theater" == new_todo_list[3][:title]
  end
end
