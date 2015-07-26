defmodule TodoList do
  defstruct auto_id: 1, entries: HashDict.new

  def new, do: %TodoList{}

  def new(entries) do
    entries
    |> Enum.reduce(%TodoList{}, fn entry, todo_list ->
      add_entry(todo_list, entry)
    end)
  end

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id},
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

  def update_entry(
    %TodoList{entries: entries} = todo_list,
    entry_id,
    updater_fun
  ) do
    case entries[entry_id] do
      nil -> todo_list
      old_entry ->
        new_entry = %{} = updater_fun.(old_entry)
        old_entry_id = old_entry.id
        # assert the id hasn't changed
        %{id: ^old_entry_id} = new_entry
        new_entries = HashDict.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry_by_id(
    %TodoList{entries: entries} = todo_list,
    entry_id
  ) do
    new_entries = HashDict.delete(entries, entry_id)
    %TodoList{todo_list | entries: new_entries}
  end
end
