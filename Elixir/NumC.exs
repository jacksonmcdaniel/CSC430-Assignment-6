defmodule NumC do
  defstruct value: nil
  @type y :: %NumC{value: integer}
end

defmodule IdC do
  defstruct value: nil
end


defmodule StringC do
  defstruct value: nil
end


defmodule AppC do
  defstruct fun: nil, args: nil
end









# x = [first: 1, last: 2]
# struct(Examples, x)    
# %Examples{first: 1, last: 2}
# doesn't have to be an int