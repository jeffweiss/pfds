defmodule PFDS.TreeSet do
  @behaviour PFDS.Set

  @type t() :: :empty | {any(), any(), any()}

  @spec empty() :: t()
  def empty(), do: :empty

  @spec insert(elem :: any(), set :: t()) :: t()
  def insert(x, :empty), do: {:empty, x, :empty}
  def insert(x, {left, root, right}) when x < root, do: {insert(x, left), root, right}
  def insert(x, {left, root, right}) when x > root, do: {left, root, insert(x, right)}
  def insert(x, {_, x, _} = orig), do: orig

  @spec member(elem :: any(), set :: t()) :: boolean()
  def member(_, :empty), do: false
  def member(x, {_, x, _}), do: true
  def member(x, {left, root, _}) when x < root, do: member(x, left)
  def member(x, {_, root, right}) when x > root, do: member(x, right)

end
