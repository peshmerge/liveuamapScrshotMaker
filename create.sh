#!/bin/bash
#!/usr/bin/phantomjs

imageCounter=0
missedIamgeCounter=0
for year in {2015..2017}
	do
		for month in {1..7}
			do
				#This line gets the number of days for each month based on Linux Cal
				amountOfDays=$(cal $month $year | awk 'NF {DAYS = $NF}; END {print DAYS}')
				for ((day = 1; day<=$amountOfDays; day++))
					do
						((imageCounter++))
						phantomjs takeScreenshot.js $day $month $year
						 echo "Searching for Image $year-$month-$day.png "
						if [ -e $year-$month-$day.png ]
							then
							    echo "Image $year-$month-$day.png found!"
							    echo "Cropping Image!"
							    convert $year-$month-$day.png -crop 1460x1230+650+310 $year-$month-$day.png
							    echo "Finished Cropping....!"
							else
							    echo "Image $year-$month-$day.png NOT FOUND!"
							    ((missedIamgeCounter++))
							fi
   					done
   			done		
	done

if [ $imageCounter -eq $missedIamgeCounter ]
	then
		echo "Nothing went Wrong we have $imageCounter images"
	else
		echo "We miss $missedIamgeCounter"
fi