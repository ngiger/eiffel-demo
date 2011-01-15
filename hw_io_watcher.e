note
	description: "Summary description for {HW_IO_WATCHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HW_IO_WATCHER

create
	add_watcher
--	create_hw_io_watcher

feature {NONE} -- Initialization

	frozen create_hw_io_watcher
			-- Initialization for `Current'.
		do
			if watcher = Void then
				create watcher.make
			end
--			Result := watcher
		end

feature -- Access

	frozen add_watcher(proc: PROCEDURE[ANY, TUPLE])
			-- Watch all changes to any IO-object
		do
			print("add_watcher: %N")
			if watcher = Void then
				create watcher.make
			end
			watcher.extend (proc)
		end

feature
	frozen notify_hw_io_watch(hw_io: IO_OBJECT; oldstate: INTEGER)
	do
			if watcher /= Void then
				from
	                watcher.start
	            until
	                watcher.off
	            loop
	                watcher.item.call ([Current, oldstate])
	                watcher.forth
	            end

			end
	end

--click: EVENT_TYPE [TUPLE [INTEGER, INTEGER]]
watcher: LINKED_LIST[PROCEDURE[ANY, TUPLE]]
end
