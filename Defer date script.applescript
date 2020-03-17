tell application "OmniFocus"
	
	set deferTime to value of setting id "DefaultStartTime" of default document
	
	set splitDeferTime to my splitText(deferTime as string, ":")
	
	set deferTimeHours to first item of splitDeferTime
	
	set deferTimeMinutes to second item of splitDeferTime
	
	set deferTimeSeconds to third item of splitDeferTime
	
	tell content of first document window of front document
		
		set selectedTasks to selected trees
		
		repeat with taskNum from 1 to count of selectedTasks
			
			set theTask to value of item taskNum of selectedTasks
			
			--- determine next defer date:
			
			--- --- condition1: has repeat schedule
			
			set repRule to repetition rule of theTask
			
			if repRule is not missing value and defer date of theTask is not missing value then
				
				set repMethod to repetition method of repRule as string
				
				if repMethod is equal to "fixed repetition" then
					
					--- condititon: "Repeat From This Item's: Completion"
					
					set nextDeferDate to next defer date of theTask
					
				end if
				
				if repMethod is equal to "start after completion" then
					
					--- condition: "Repeat From This Item's: Assigned Dates"
					
					set _frequency to recurrence of repRule
					
					set _repetition to repetition method of repRule
					
					set repetition rule of theTask to {repetition method:fixed repetition, recurrence:_frequency}
					
					set nextDeferDate to next defer date of theTask
					
					set repetition rule of theTask to {repetition method:_repetition, recurrence:_frequency}
					
				end if
				
			else
				
				--- --- condition2: has no repeat schedule
				
				set nextDeferDate to current date
				
				if defer date of theTask is missing value then
					
					--- defer date is empty (either new task or defer date was removed manually):
					
					set nextDeferDate's hours to deferTimeHours
					
					set nextDeferDate's minutes to deferTimeMinutes
					
					set nextDeferDate's seconds to deferTimeSeconds
					
				else
					
					--- defer date is set (keep time, reschedule date only):
					
					set deferDate to defer date of theTask
					
					set nextDeferDate's hours to deferDate's hours
					
					set nextDeferDate's minutes to deferDate's minutes
					
					set nextDeferDate's seconds to deferDate's seconds
					
					if nextDeferDate ² (current date) then
						
						set nextDeferDate to nextDeferDate + (1 * days)
						
					end if
					
				end if
				
			end if
			
			--- update defer date:
			
			set defer date of theTask to nextDeferDate
			
		end repeat
		
	end tell
	
end tell

on splitText(theText, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to ""
	return theTextItems
end splitText
