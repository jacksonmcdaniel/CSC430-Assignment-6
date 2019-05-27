defmodule Examples do
  defstruct first: nil, last: nil

  @type y :: %Examples{first: integer, last: integer}
end


# x = [first: 1, last: 2]
# struct(Examples, x)    
# %Examples{first: 1, last: 2}
# doesn't have to be an int
