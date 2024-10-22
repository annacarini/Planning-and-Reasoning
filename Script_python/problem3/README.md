# Problem 3

### Code to generate the PDDL file

	prob = Problem("problem3", 4, 5)
	
	# tiles disponibili
	prob.setTiles3(3)
	prob.setTiles5(2)
	prob.setTiles6(2)
	prob.setTiles7(1)
	prob.setTiles9(1)
	prob.setTilesA(2)
	prob.setTilesB(1)
	prob.setTilesC(3)
	prob.setTilesD(0)
	prob.setTilesE(1)
	prob.setTilesF(0)
	
	#ori
	prob.addGold(0,1)
	prob.addGold(3,3)
	
	# argenti
	prob.addSilver(2,0)
	prob.addSilver(0,4)
	prob.addSilver(2,2)
	
	# genera file PDDL
	prob.generateProblemFile()
	prob.generateInputForDrawing()

### HMAX, A* (no reopening)

Plan obtained using **A\* (without reopening)** as search algorithm, and **hmax** as heuristic.

<img src="problem3_sas_plan_hmax.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 1850s |
| **Peak memory** | 4.4G |
| **Plan cost** | 34 |
| **Expanded states** | 14 millions |

	run with:  --search-memory-limit 11G --search "lazy_wastar([hmax()], reopen_closed=false)"


### FF, A* (no reopening)

Plan obtained using **A\* (without reopening)** as search algorithm, and **ff** as heuristic.

<img src="problem3_sas_plan_ff.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 780s |
| **Peak memory** | 1.2G |
| **Plan cost** | 34 |
| **Expanded states** | 2.4 millions |

	run with:  --search-memory-limit 11G --search "lazy_wastar([ff()], reopen_closed=false)"

 
 ### FF, greedy

Plan obtained using **greedy search (without reopening)** as search algorithm, and **ff** as heuristic.

<img src="problem3_sas_plan_ff_greedy.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 0.114276s |
| **Peak memory** | 11872 KB |
| **Plan cost** | 50 |
| **Generated states** | 24924 |

	Expanded 2494 state(s).
	Reopened 0 state(s).
	Evaluated 2501 state(s).
	Evaluations: 2501
	Generated 24924 state(s).
	Dead ends: 6 state(s).
	Number of registered states: 2501

	run with:  --search-memory-limit 11G --search "lazy_greedy([ff()], reopen_closed=false)"

 
  ### LMCUT, A* (reopening)

Plan obtained using **A\* (with reopening)** as search algorithm, and **lmcut** as heuristic.

<img src="problem3_sas_plan_lmcut.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 770s |
| **Peak memory** | 1.2G |
| **Plan cost** | 34 |
| **Expanded states** | 2.5 millions |

	run with:  --search-memory-limit 11G --search "lazy_wastar([lmcut()], reopen_closed=true)"
 
