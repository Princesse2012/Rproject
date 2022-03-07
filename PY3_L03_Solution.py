# Introduction to Python Programming
# Lesson 03 Assignment
# Sample Solution

# Meteorologists use the Saffir-Simpson Scale to classify
# the strength of hurricanes.
# The intensity is based on the maximum sustained
# wind speed of a storm as follows:

# Category	Wind Speed (mph)
1	74-95
2	96-110
3	111-130
4	131-155
5	156 and higher
# Write a Python program that will prompt the user for a wind speed.
# The program should use this wind speed to display a message telling
# the user the hurricane's intensity based on the table above.

# Please note that this program takes advantage of the fact that
#   once a condition is met, the if structure is exited.  This
#   allows me to not need a lower limit in my conditions because
#   if the speed were below the minimum for that Category, the
#   program would have already printed the result and exited.

speed = eval(input("Please enter the wind speed: "))

if speed < 74:
    print ("This is not a hurricane")
elif speed <= 95:
    print ("Category 1")
elif speed <= 110:
    print ("Category 2")
elif speed <= 130:
    print ("Category 3")
elif speed <= 155:
    print ("Category 4")
else:
    print ("Category 5")
