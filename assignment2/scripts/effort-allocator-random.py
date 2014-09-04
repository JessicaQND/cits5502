import random

DATA_SET = [
	[10,6,7,25],
	[7,9,8,20],
	[6,5,4,15],
	[7,4,8,8],
	[2,5,1,14],
	[3,3,2,16],
	[1,2,1,15],
	[1,1,3,9],
	[1,4,1,7],
	[2,2,2,5],
	[1,1,1,5],
	[1,0,4,3],
	[2,1,3,2],
	[2,1,3,2],
	[1,1,0,1],
	[0,0,1,1],
	[2,2,0,0],
	[0,1,0,1],
	[1,2,0,1],
	[0,0,1,0],
]

HOURS_TO_FIX = [
	5, # Hard & Major
	5, # Hard & Minor
	2, # Easy & Major
	2, # Easy & Minor
]

WORK_WEEK = 25

EMPLOYEES = 3

FIXERS = [2] * len(DATA_SET) # Two fixers per week for every week

if __name__ == "__main__":
	fix_list = []
	cumulative = [0, 0, 0, 0]

	for week in range(len(DATA_SET)):
		finders = EMPLOYEES - FIXERS[week]
		hours_remaining = WORK_WEEK * FIXERS[week]
		
		found = [0, 0, 0, 0]
		w_count = week
		if finders > 0:
			for i in range(finders):
				found = [x+y for x, y in zip(found, DATA_SET[w_count])]
				w_count += 1
				if w_count >= len(DATA_SET):
					break
				if i > 0:
					del DATA_SET[w_count]
					DATA_SET.append([0] * 4)
		else:
			DATA_SET.insert(week, [0] * 4)
			del DATA_SET[-1]
			
		bugs_remaining = [x+y for x, y in zip(found, cumulative)]
	
		week_fix = [0, 0, 0, 0]
		exhausted = [False, False, False, False]
	
		while hours_remaining >= min(HOURS_TO_FIX):
			type = random.randint(0, 3)
			
			if bugs_remaining[type] > 0 and hours_remaining >= HOURS_TO_FIX[type]:
				hours_remaining -= HOURS_TO_FIX[type]
				bugs_remaining[type] -= 1
				week_fix[type] += 1
			else:
				exhausted[type] = True
				if all(exhausted):
					break
			
		
		fix_list.append(found + [FIXERS[week], finders] + week_fix)
		cumulative = bugs_remaining
	
	print("{},{},{},{},{},{},{},{}".format(*([1,1,1,1] + HOURS_TO_FIX)))
	
	for row in fix_list:
		print("{},{},{},{},{},{},{},{},{},{}".format(*row))
		
		