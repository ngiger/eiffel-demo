note
	description: "IO-Object (e.g. a digital or analog in- or output"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	IO_OBJECT

create

feature {NONE} -- Initialization

	make(initialValue: INTEGER)
			-- Initialization for `Current'.
		do
			name := "Unknown"
			set_value(initialValue);
			hw_info := "No-HW";
			create callback.make
		end



feature
	make_concrete(a_name: STRING;
		a_hw_info: STRING)
	do
		name := a_name;
		set_value(0);
		hw_info := a_hw_info;
		create callback.make
--		create hw_io_watcher.create_hw_io_watcher
	end


	 identify: READABLE_STRING_8
	 	local s: STRING
	 	--l: LIST(INTEGER)
		do
		--	l.do_all (agent my_action)

			create s.make_from_string ("IO-Name: ")
			s.append (name)
			s.append (" info: ")
			s.append(hw_info)
			s.append(" value: ")
			s.append(value.out)
			Result := s;
		end

	value: INTEGER;
	name:  STRING;
	hw_info: STRING;
	hw_io_watcher: HW_IO_WATCHER;

feature {NONE}
	callback :  LINKED_LIST[PROCEDURE[ANY, TUPLE]]

feature add_call_back(proc: PROCEDURE[ANY, TUPLE])
	do
		callback.extend (proc)
	end

feature -- Element change

	set_value (a_value: like value; )
			-- Assign `value' with `a_value'.
		do
			value := a_value;
			if callback /= Void then
				from
	                callback.start
	            until
	                callback.off
	            loop
	                callback.item.call ([Current, value])
	                callback.forth
	            end

			end
		--	if hw_io_watcher /= Void then
	--			hw_io_watcher.notify_hw_io_watch(Current, value)
	--		end
		ensure value = a_value;
		end


end
