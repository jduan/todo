defmodule MultiDict do
  def new, do: HashDict.new

  def size(dict), do: HashDict.size(dict)

  def add(dict, key, value) do
    HashDict.update(
      dict,
      key,
      [value],
      &[value | &1]
    )
  end

  def get(dict, key) do
    HashDict.get(dict, key, [])
  end
end
