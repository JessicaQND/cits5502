from copy import copy

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

PRIORITIES = [
	2, # Hard & Major
	4, # Hard & Minor
	1, # Easy & Major
	3, # Easy & Minor
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
	cumulative = []
	
	prior = list(enumerate(PRIORITIES))
	prior = sorted(prior, key=lambda x: x[1])

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
			
		cumulative.append(copy(found))
	
		week_fix = [0, 0, 0, 0]
	
		for i in range(len(cumulative)):
			for typer, _ in prior:
				week_bugs = cumulative[i]
				remaining_bugs = week_bugs[typer]
				
				if remaining_bugs == 0:
					continue
				
				max_bugs = hours_remaining // HOURS_TO_FIX[typer]
			
				to_fix = min(remaining_bugs, max_bugs)
			
				week_fix[typer] += to_fix
				
				hours_remaining -= to_fix * HOURS_TO_FIX[typer]
				cumulative[i][typer] -= to_fix
				

		fix_list.append(found + [FIXERS[week], finders] + week_fix)
	
	print("{},{},{},{},{},{},{},{},fifo".format(*(PRIORITIES + HOURS_TO_FIX)))
	
	for row in fix_list:
		print("{},{},{},{},{},{},{},{},{},{}".format(*row))
		
		