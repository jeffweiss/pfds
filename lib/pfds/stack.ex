defmodule PFDS.Stack do

  alias PFDS.Stack

  @type t() :: Stack.t()

  @callback empty() :: Stack.t()
  @callback isEmpty(stack :: Stack.t()) :: boolean()

  @callback cons(element :: any(), stack :: Stack.t()) :: Stack.t()
  @callback head(stack :: Stack.t()) :: any()
  @callback tail(stack :: Stack.t()) :: Stack.t()

end

defmodule EmptyStack do
  defexception []
  def message(_), do: "Empty stack"
end
