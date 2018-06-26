defmodule TreeSetTest do
  use ExUnit.Case
  use PropCheck

  alias PFDS.TreeSet

  def treeset() do
    frequency([
      {1, TreeSet.empty()},
      {4, lazy(let_shrink([
        a <- any(),
        t <- treeset()
      ]) do
        TreeSet.insert(a, t)
      end)
      }
    ])
  end

  property "inserting -> member" do
    forall {a, t} <- {any(), treeset()} do
      TreeSet.member(a, TreeSet.insert(a, t))
    end
  end

  property "inserting existing item yields same tree" do
    forall {a, t} <- {any(), treeset()} do
      tree2 = TreeSet.insert(a, t)
      tree2 == TreeSet.insert(a, tree2)
    end
  end
end
