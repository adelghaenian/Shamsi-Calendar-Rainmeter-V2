function Update()       
	tShamsiDate = ShamsiDateCalculator()	
	SKIN:Bang('!SetOption', 'MtShowShamsiMonthTitle', 'Text', (tShamsiDate[1]))
	SKIN:Bang('!SetOption', 'MtShowShamsiDay', 'Text', (tShamsiDate[0]))
	SKIN:Bang('!SetOption', 'MtShowShamsiDayTitle', 'Text', (tShamsiDate[2]))
	return 'dates refreshed....'
end -- of function Update	

function ShamsiDateCalculator ()
	secondInOneDay = 24*60*60
	timeStamp = os.time(os.date("!*t"))
	days = math.floor(timeStamp / secondInOneDay)+1
	year = 1348
	month = 11
	day = 11
	days = days - 19
	daysInMonth = {31,31,31,31,31,31,30,30,30,30,30,29}
	while true do
		if ( days > daysInMonth[month-1]) then
			days = days - daysInMonth[month-1]
			month = month + 1

			if (month == 14) then
				year = year + 1
				if ((year - 1347)%4 == 0) then
					days = days - 1
				end
				month = 2
			end
		else
			break
		end
	end


	weekdayTitles = {
	"شنبه",
	"یکشنبه",
	"دوشنبه",
	"سه‌شنبه",
	"چهارشنبه",
	"پنج‌شنبه",
	"جمعه"
	}
	monthTitles = {
	"فروردین",
	"اردیبهشت",
	"خرداد",
	"تیر",
	"مرداد",
	"شهریور",
	"مهر",
	"آبان",
	"آذر",
	"دی",
	"بهمن",
	"اسفند",
	}
	myRes = {}
	myRes[0] = day
	myRes[1] = monthTitles[month]


	return myRes
end  -- of ShamsiDateCalculator

