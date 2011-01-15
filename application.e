note
	description : "eiffel demo: a small application"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	PLATFORM
    EXECUTION_ENVIRONMENT


create
	make
feature {NONE} -- Initialization

	make
			-- Run application.
		local		led : LED_DRIVER;
		do
			check_digital_input
		--	showEnum
			print("%NWorking with LEDs now%N")
			create led
			check_leds(led)
			eiffel_info
		end

feature watch2(in: IO_OBJECT;j: INTEGER)
do
	print("%Nwatch2: j is "); print(j); print(" ");
	print(in.identify)
	seen := seen + 1;
end

seen: INTEGER;

feature check_digital_input
		local din1: DIO_INPUT;
		din2: DIO_INPUT;
	do
		create din1.make_digital_input
		create din2.make_concrete("MOULD_CLOSING","5.6.7.8")
		seen := 1;
		print("%N"); print(seen ); print(" = seen %N")
		din1.add_call_back (agent watch2(din2,27));
		din1.set_value (1)
		din1.set_value (0)
		print("%N"); print(seen ); print(" = seen %N")
		din2.add_call_back (agent watch2(din2,333333));
		din2.add_call_back (agent watch2(?,?));
		din2.add_call_back (agent () do print("%Nxxx%N"); print(Current.out); end);
		din2.set_value (1);
	end

-- An example enumation in Eiffel
-- Red, Orange, Yellow, Blue, Green, Indigo, Violet: INTEGER is unique
-- -- But 'is unique' is a deprecated feature
--feature showEnum
--	do
--		print("%NUsing enumaration in Eiffel%N");
--		print("Red:    "); print(Red); print("%N");
--		print("Blue:   "); print(Blue); print("%N");
--		print("Violet: "); print(Violet); print("%N");
--	end

feature
	eiffel_info()
	do
		print ("Some info about Eiffel's world%N")
		print ("little endian: ");print (Is_little_endian); print("%N")
		print ("isLinux      : ");print (Is_unix);    print("%N")
		print ("isWindows    : ");print (Is_windows); print("%N")
		print ("isVxworks    : ");print (Is_vxworks); print("%N")
	end
feature -- Miscellaneous

	check_leds(led: LED_DRIVER)
			-- Runs a few tests
		do
			led.show
			led.set (1)
			led.set (2)
			led.set (8)
			led.show
			led.clear (8)
			led.clear (1)
			led.clear (2)
			led.show
		end

 end
