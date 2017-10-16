#!/bin/bash
#!/usr/bin/phantomjs

year=2015
day=1
month=1
imageCounter=0
missedIamgeCounter=0
if [ -e $year-$month-$day.png ]
							then
								((imageCounter++))
							    echo "Image $year-$month-$day.png found!"
							    echo "Cropping Image!"
							    #convert $year-$month-$day.png -crop 1460x1230+650+310 $year-$month-$day.png
							    echo "Finished Cropping....!"
							else
							    echo "Image $year-$month-$day.png NOT FOUND!"
							    ((missedIamgeCounter++))
							fi
# newDay="0"
# newMonth="0"
# for year in {2015..2015}
# 	do
# 		for month in {1..2}
# 			do
# 				for day in {1..31}
# 					do
# 						#phantomjs takeScreenshot.js $day $month $year
# 						if [ $day -lt 10 ]
# 							then
# 								newDay="0$day"
# 								#rm $year-$newMonth-$newDay.png
# 								echo $newDay
# 							fi
# 						if [ $month -lt 10 ]
# 							then
# 								newMonth="0$month"
# 								rm $year-$newMonth-$day.png
# 								echo $newMonth
# 							fi	
# 						#convert $year-$newMonth-$newDay.png -crop 1460x1230+650+310 $year-$month-$day.png
#    					done
#    			done		
# 	done


