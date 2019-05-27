

defmodule Parser do
	def parse (line) do
		case line do 
			:hello ->
				"I got hello world"
			:bye ->
				"I got bye"
			_ ->
				"Didn't get what I expected"	
		end
	end

	
end

