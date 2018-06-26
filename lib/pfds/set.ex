defmodule PFDS.Set do
  alias PFDS.Set

  @type t() :: Set.t()

  @callback empty() :: Set.t()
  @callback insert(elem :: any(), set :: Set.t()) :: Set.t()
  @callback member(elem :: any(), set :: Set.t()) :: boolean()
end
