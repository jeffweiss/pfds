defmodule PFDS.TreeSet do
  @behaviour PFDS.Set

  def empty(), do: {:empty, :empty, :empty}

  def insert(x, :empty), do: insert(x, empty())
  def insert(x, {:empty, :empty, :empty}), do: {:empty, x, :empty}
  def insert(x, {left, root, right}) when x < root, do: {insert(x, left), root, right}
  def insert(x, {left, root, right}) when x > root, do: {left, root, insert(x, right)}
  def insert(x, {_, x, _} = orig), do: orig

  def member(_, {:empty, :empty, :empty}), do: false
  def member(x, {_, x, _}), do: true
  def member(x, {left, root, _}) when x < root, do: member(x, left)
  def member(x, {_, root, right}) when x > root, do: member(x, right)

end
