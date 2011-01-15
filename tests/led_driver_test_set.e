note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	LED_DRIVER_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	test_led_driver
			-- New test routine
			local l: LED_DRIVER
		do
			create l
			print ("Testing")
			assert("0 after creation", l.state = 0)
			l.set (8); l.show
			assert("256 after set 8", l.state = 256)
			l.set (0);
			assert("257 after set 0", l.state = 257)
			l.clear (8)
			assert("1 after clear 8", l.state = 1)

			--assert ("not_implemented", False)
		end
feature -- Test routines

	test_led_driver_2
			-- New test routine
			local l: LED_DRIVER
		do
			print ("Test zwo")
			create l
			assert("0 after creation", l.state = 0)
			-- assert ("not_implemented", False)
		end
end


