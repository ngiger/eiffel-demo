note
	description: "Summary description for {LED_DRIVER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class LED_DRIVER

feature -- Access

	state: INTEGER_16;
			-- logical state of LEDs

feature -- Element change

	set (i: INTEGER)
			-- Set with LED-bit `i'.
		require 0 <= i and i < 16
		do
			print( i);
			state := state | (1 |<< i).as_integer_16
			show
		ensure
			state_assigned: state = old state | (1 |<< i)
			state_not_changed: state & (1 |<< i).as_integer_16.bit_not = old state & (1 |<< i).as_integer_16.bit_not
		end

feature -- Element change
	clear (i: INTEGER_16)
			-- Set with LED-bit `i'.
		require 0 <= i and  i < 16
		do
			state := state & (1 |<< i).as_integer_16.bit_not
			show
		ensure
			state_assigned: state = old state & (1 |<< i).as_integer_16.bit_not
			state_not_changed: state & (1 |<< i).as_integer_16.bit_not = old state & (1 |<< i).as_integer_16.bit_not
		end

feature show -- show state of LED
	do
		print(" LED-State is ")
		print(state)
		print("%N")
	end
end -- class LED_DRIVER
