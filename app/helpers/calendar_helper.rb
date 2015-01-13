module CalendarHelper

	def calendar
		cal = "<table border='1'><tr>"
		days = %w(sun mon tue wed thu fri sat)
		days.each do |day|
			cal += "<td> #{day} </td>"
		end
		cal += "</tr></table>"
		return cal
	end

end