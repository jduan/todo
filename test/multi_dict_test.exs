defmodule MultiDictTest do
  use ExUnit.Case

  test "it starts with empty" do
    md = MultiDict.new
    assert MultiDict.size(md) == 0
  end

  test "add entries to it" do
    md = MultiDict.new |>
      MultiDict.add(:name, 1) |>
      MultiDict.add(:name, 2)
    assert MultiDict.get(md, :name) == [2, 1]
  end
end
