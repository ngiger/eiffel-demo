note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	DIO_WATCH_TEST

inherit
	EQA_TEST_SET

feature  watcher(k: IO_OBJECT;j: INTEGER)
do
	watched := watched +1 ;
	print("watcher: watched is "); print(watched); print("%N");

end

feature first_callback(k: IO_OBJECT;j: INTEGER)
do
	print("%Nfirst_callback: j is "); print(j); print(" ");
--	print(k.name)
	seen := seen + 1;
end

seen: INTEGER;
watched: INTEGER;
--observer: OBSERVABLE;

feature watch_digital_input
		local din1: DIO_INPUT;
		din2: DIO_INPUT;
		hw_io_watcher: HW_IO_WATCHER;
	do
		watched := 0;
		create din1.make_concrete("FIRST","1.2.3.4")
		create din2.make_concrete("SECOND","5.6.7.8")
		if false then

		create hw_io_watcher.add_watcher (agent watcher(?,?));
		din1.set_value (0)
		assert("watched 1", watched = 1);
		din1.set_value (1)
		assert("watched 2", watched = 2);
		din2.set_value (0)
		assert("watched 3", watched = 3);
		din2.set_value (1)
		assert("watched 4", watched = 4);
		end
end

feature check_digital_input
		local din1: DIO_INPUT;
		din2: DIO_INPUT;
	do
		create din1.make_digital_input
		create din2.make_concrete("MOULD_CLOSING","5.6.7.8")
		seen := 1;
		assert("seen = 1", seen = 1);
		din1.set_value (1)
		assert("seen = 1a", seen = 1);
		din1.set_value (0)
		assert("seen = 1c", seen = 1);

		din2.add_call_back (agent first_callback(din2,333333));
		din2.add_call_back (agent () do print("%Nseen is "); print(seen) end);
		din2.set_value (1);
		assert("seen = 2", seen = 2);

		-- Normally you should use this form
		din1.add_call_back (agent first_callback());
		din1.set_value (1);
		din1.set_value (0);
		assert("seen = 4", seen = 4);
	end

end


