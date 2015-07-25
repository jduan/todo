defmodule FractionTest do
  use ExUnit.Case

  test "fraction" do
    one_half = %Fraction{a: 1, b: 2}
    assert 1 == one_half.a
    assert 2 == one_half.b

    # pattern match
    %Fraction{a: a, b: b} = one_half
    assert 1 == a
    assert 2 == b

    one_quarter = %Fraction{one_half | b: 4}
    assert %Fraction{a: 1, b: 4} == one_quarter

    f = Fraction.add(one_half, one_quarter)
    assert Fraction.value(f) == 0.75
  end
end
