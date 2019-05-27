defmodule Test do
	def runc(stuff) do
  		case String.split(stuff, " ") do
    		[item1, item2] -> item1 <> item2 
    		[thing] -> 0
  		end
	end
end
