defmodule TodoList do
  defstruct auto_id: 1, entries: HashDict.new

  def new, do: %TodoList{}

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todo_list,
    entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = HashDict.put(entries, auto_id, entry)
    %TodoList{entries: new_entries, auto_id: auto_id + 1}
  end

  def entries(%TodoList{entries: entries}, lookup_date) do
    entries
    |> Stream.filter(fn({_, %{date: date}}) ->
      date == lookup_date
    end)
    |> Enum.map(fn({_, entry}) -> entry end)
  end
end
