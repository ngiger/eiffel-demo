note
	description: "Summary description for {DIO_INPUT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DIO_INPUT

inherit
	IO_OBJECT

create
	make_digital_input, make_concrete


feature  -- Initialization

	make_digital_input
			-- Initialization for `Current'.
		do
			make(0)
		end

invariant
		value >= 0 and value <= 1

end
