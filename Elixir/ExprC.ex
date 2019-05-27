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


defmodule IfC do
  defstruct if: nil, then: nil, otherwise: nil
end


defmodule AppC do
  defstruct fun: nil, args: nil
end


defmodule Binding do
	defstruct sym: nil, val: nil
end

defmodule PrimV do
	defstruct op: nil
end

defmodule Functions do
	def interp(input, env) do
		case input do
			%IdC{value: n} -> lookup(n, env)
			%NumC{value: n} -> n
			%StringC{value: n} -> n
			%IfC{if: if, then: then, otherwise: otherwise} -> if
			%AppC{fun: f, args: a} -> output = interp(f, env) 
				case output do

					%PrimV{op: op} -> 
						try do
							if length(a) > 2 do
								throw(length(a))
							else
								primHandler(op, interp(Enum.at(a, 0), env), interp(Enum.at(a,1), env))
							end
						catch
							x -> "More than two arguments given for a primary operation. You have #{x} Arguments."
						end
				end


		end
	end

	def lookup(sym, x) do
		[head | tail] = x
		if sym == head.sym do
			head.val
		else 
			lookup(sym, tail)
		end
	end

	def primHandler(op, left, right) do
		case op do
			:+ -> left + right
			:- -> left - right
			:/ -> left / right
			:* -> left * right
			:<= -> left <= right
			:equal? -> left == right
		end
	end
end

v = %AppC{fun: %IdC{value: :equal?}, args: [%NumC{value: 4}, %NumC{value: 4}]}
x = %AppC{fun: %IdC{value: :equal?}, args: [%NumC{value: 4}, %NumC{value: 5}]}
y = %AppC{fun: %IdC{value: :<=}, args: [%NumC{value: 4}, %NumC{value: 5}]}
z = %AppC{fun: %IdC{value: :<=}, args: [%NumC{value: 5}, %NumC{value: 4}, %NumC{value: 6}]}


topenv = [%Binding{sym: :+, val: %PrimV{op: :+}}, 
			%Binding{sym: :-, val: %PrimV{op: :-}}, 
			%Binding{sym: :*, val: %PrimV{op: :*}}, 
			%Binding{sym: :/, val: %PrimV{op: :/}}, 
			%Binding{sym: :<=, val: %PrimV{op: :<=}}, 
			%Binding{sym: :equal?, val: %PrimV{op: :equal?}},
			%Binding{sym: :true, val: true}, 
			%Binding{sym: :false, val: false}
		]
Functions.lookup(:*, topenv) 
Functions.interp(z, topenv)


