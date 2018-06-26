defmodule ListStackTest do
  use ExUnit.Case
  use PropCheck

  alias PFDS.ListStack

  def stack() do
    frequency([
      {1, ListStack.empty()},
      {9, lazy(let_shrink([
        a <- any(),
        s <- stack()
      ]) do
        ListStack.cons(a, s)
      end)
      }
    ])
  end

  test "empty is isEmpty" do
    assert ListStack.isEmpty(ListStack.empty())
  end

  property "anything added to an empty stack is no longer empty" do
    forall a <- any() do
      !ListStack.isEmpty( ListStack.cons(a, ListStack.empty() ) )
    end
  end

  property "cons |> head yield original element" do
    forall {a, stack} <- {any(), stack()} do
      a == ListStack.head(ListStack.cons(a, stack))
    end
  end

  property "cons |> tail yield original stack" do
    forall {a, stack} <- {any(), stack()} do
      stack == ListStack.tail(ListStack.cons(a, stack))
    end
  end

end
