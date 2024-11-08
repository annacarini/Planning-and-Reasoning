# Problem 5

### Code to generate the PDDL file

	prob = Problem("problem5", 4, 6)

	# available tiles
	prob.setTiles3(4)
	prob.setTiles5(2)
	prob.setTiles6(2)
	prob.setTiles7(1)
	prob.setTiles9(2)
	prob.setTilesA(2)
	prob.setTilesB(1)
	prob.setTilesC(2)
	prob.setTilesD(1)
	prob.setTilesE(0)
	prob.setTilesF(1)

	# golds
	prob.addGold(0,5)
	prob.addGold(3,0)
	prob.addGold(1,2)

	# silvers
	prob.addSilver(0,1)
	prob.addSilver(2,4)
	prob.addSilver(3,2)

	# generate PDDL file
	prob.generateProblemFile()
	prob.generateInputForDrawing()

## LAMA

We ran **LAMA-2011** and we obtained 7 plans, of progressively smaller costs. The first and last one are shown here:

<img src="problem5_sas_plan1.png" alt="plan" width="280"/> |  <img src="problem5_sas_plan7.png" alt="plan" width="280"/>
:-------------------------:|:-------------------------:
Plan 1  |  Plan 7

Information about all the generated plans:

| Plan | Search time | Plan cost |  Expanded states | Generated states |
|--|--|--|--|--|
| 1 | 0.00365988s | 77 | 18 | 342 |
| 2 | 0.00603755s | 64 | 34 | 725 |
| 3 | 0.00931537s | 62 | 115 | 956 |
| 4 | 0.0255309s | 58 | 353 | 3266 |
| 5 | 0.044791s | 49 | 642 | 6188 |
| 6 | 218.964s | 47 | 2421298 | 41289024 |
| 7 | 260.257s | 40 | 2974601 | 50760384 |
| FINISH |  | - |  |  |

| | |
|--|--|
| **Total time** | > 1h 37m |
| **Peak memory** | > 11 GB |

	run with:  --search-memory-limit 11G --alias seq-sat-lama-2011

## Other tests

### HMAX, A* (no reopening)

Plan obtained using **A\* (without reopening)** as search algorithm, and **hmax** as heuristic.

<img src="problem5_sas_plan_hmax.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 1638.26s |
| **Peak memory** | 6473408 KB |
| **Plan cost** | 40 |
| **Generated states** | 593561142 |

	Expanded 28920950 state(s).
	Reopened 0 state(s).
	Evaluated 41079120 state(s).
	Evaluations: 41079120
	Generated 593561142 state(s).
	Dead ends: 12158169 state(s).
	Number of registered states: 41079120

	run with:  --search-memory-limit 11G --search "lazy_wastar([hmax()], reopen_closed=false)"


### FF, A* (no reopening)

Plan obtained using **A\* (without reopening)** as search algorithm, and **ff** as heuristic.

<img src="problem5_sas_plan_ff.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 1072.32s |
| **Peak memory** | 3804388 KB |
| **Plan cost** | 40 |
| **Generated states** | 351056554 |

	Expanded 17913469 state(s).
	Reopened 0 state(s).
	Evaluated 25133516 state(s).
	Evaluations: 25133516
	Generated 351056554 state(s).
	Dead ends: 7220046 state(s).
	Number of registered states: 25133516

	run with:  --search-memory-limit 11G --search "lazy_wastar([ff()], reopen_closed=false)"

 
 ### FF, greedy

Plan obtained using **greedy search (without reopening)** as search algorithm, and **ff** as heuristic.

<img src="problem5_sas_plan_ff_greedy.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 0.0292772s |
| **Peak memory** | 11852 KB |
| **Plan cost** | 78 |
| **Generated states** | 3065 |

	Expanded 520 state(s).
	Reopened 0 state(s).
	Evaluated 551 state(s).
	Evaluations: 551
	Generated 3065 state(s).
	Dead ends: 30 state(s).
	Number of registered states: 551

	run with:  --search-memory-limit 11G --search "lazy_greedy([ff()], reopen_closed=false)"


  ### LMCUT, A* (reopening)

Plan obtained using **A\* (with reopening)** as search algorithm, and **lmcut** as heuristic.

<img src="problem5_sas_plan_lmcut.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 1576.96s |
| **Peak memory** | 4493432 KB |
| **Plan cost** | 40 |
| **Generated states** | 395109132 |

	Expanded 19950962 state(s).
	Reopened 0 state(s).
	Evaluated 28149786 state(s).
	Evaluations: 28149786
	Generated 395109132 state(s).
	Dead ends: 8198823 state(s).
	Number of registered states: 28149786

	run with:  --search-memory-limit 11G --search "lazy_wastar([lmcut()], reopen_closed=true)"

 
 
 
