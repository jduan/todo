defmodule TodoList do
  def new, do: MultiDict.new

  def add_entry(dict, entry) do
    MultiDict.add(dict, entry.date, entry)
  end

  def entries(dict, date) do
    MultiDict.get(dict, date)
  end
end
