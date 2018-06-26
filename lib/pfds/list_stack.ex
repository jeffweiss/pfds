defmodule PFDS.ListStack do

  @behaviour PFDS.Stack

  def empty(), do: []
  def isEmpty([]), do: true
  def isEmpty(x) when is_list(x), do: false

  def cons(x, xs) when is_list(xs), do: [x|xs]

  def head([]), do: raise EmptyStack
  def head([x|xs]) when is_list(xs), do: x
  def tail([]), do: raise EmptyStack
  def tail([_|xs]) when is_list(xs), do: xs

end
