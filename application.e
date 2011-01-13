note
	description : "project application root class"
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
	local

		tr: TRACER;
		led : LED_DRIVER

		do
			--| Add your code here
			create led
			led.show
			led.set (1)
			led.set (2)
			led.set (8)
			led.show
			led.clear (8)
			led.clear (1)
			led.clear (2)
			led.show
			print ("TimeTest %N")
				print ("little endian: ");print (Is_little_endian); print("%N")
				print ("isLinux      : ");print (Is_unix);    print("%N")
				print ("isWindows    : ");print (Is_windows); print("%N")
				print ("isVxworks    : ");print (Is_vxworks); print("%N")
		create tr.showtime;
            --print ("Sleeping 5 seconds ")
            --sleep (5000000000)
            --print ("Awake!%N")
		create tr.showtime
	--	tr.seconds_in_minute
		sleep(1*1000*1000)
		create tr.showtime

		end

end
