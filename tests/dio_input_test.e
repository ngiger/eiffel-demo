note
	description: "[
	  Unit-Tests for digital input
	]"
	author: "Niklaus Giger"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	DIO_INPUT_TEST

inherit
	EQA_TEST_SET


feature -- Test routines

	test_dio_input
			-- New test routine
		local din: DIO_INPUT;
		do
			create din.make_digital_input
			assert("D-in false after creation", din.value = 0);
			din.set_value (1)
			assert("D-in true", din.value = 1);
			din.set_value (0)
			assert("D-in true", din.value = 0);
			print(din.identify)
--			assert("D-in: name", din.identify.is_equal ("IO-Name: Unknown info: No-HW value: 0"))
		end

end


