# Problem 4

### Code to generate the PDDL file

        prob = Problem("problem4", 9, 3)

        # available tiles
        prob.setTiles3(3)
        prob.setTiles5(2)
        prob.setTiles6(2)
        prob.setTiles7(1)
        prob.setTiles9(1)
        prob.setTilesA(2)
        prob.setTilesB(1)
        prob.setTilesC(2)
        prob.setTilesD(1)
        prob.setTilesE(1)
        prob.setTilesF(0)

        # golds
        prob.addGold(1,2)
        prob.addGold(3,0)
        prob.addGold(6,2)

        # silvers
        prob.addSilver(1,0)
        prob.addSilver(3,1)
        prob.addSilver(6,1)

        # generate PDDL file
        prob.generateProblemFile()
        prob.generateInputForDrawing()

## LAMA

We ran **LAMA-2011** and we obtained 5 plans, of progressively smaller costs. The first and last one are shown here:

<img src="problem4_sas_plan1.png" alt="plan" width="120"/> |  <img src="problem4_sas_plan5.png" alt="plan" width="120"/>
:-------------------------:|:-------------------------:
Plan 1  |  Plan 5

Information about all the generated plans:

| Plan | Search time | Plan cost |  Expanded states | Generated states |
|--|--|--|--|--|
| 1 | 0.00444783s | 83 | 25 | 565 |
| 2 | 0.00552817s | 58 | 20 | 472 |
| 3 | 0.0191639s | 49 | 150 | 1545 |
| 4 | 0.0844012s | 47 | 590 | 6045 |
| 5 | 0.824973s | 38 | 7009 | 94799 |
| FINISH |  | - |  |  |

| | |
|--|--|
| **Total time** |  |
| **Peak memory** |  |

	run with:  --search-memory-limit 11G --alias seq-sat-lama-2011

## Other tests


### HMAX, A* (no reopening)

Plan obtained using **A\* (without reopening)** as search algorithm, and **hmax** as heuristic.

<img src="problem4_sas_plan_hmax.png" alt="plan" height="340"/>

| | |
|--|--|
| **Total time** | 457.581s |
| **Peak memory** | 1899164 KB |
| **Plan cost** | 38 |
| **Generated states** | 178321153 |

	Expanded 8180154 state(s).
	Reopened 0 state(s).
	Evaluated 11941858 state(s).
	Evaluations: 11941858
	Generated 178321153 state(s).
	Dead ends: 3761703 state(s).
	Number of registered states: 11941858

	run with:  --search-memory-limit 11G --search "lazy_wastar([hmax()], reopen_closed=false)"


### FF, A* (no reopening)

Plan obtained using **A\* (without reopening)** as search algorithm, and **ff** as heuristic.

<img src="problem4_sas_plan_ff.png" alt="plan" height="340"/>

| | |
|--|--|
| **Total time** | 298.776s |
| **Peak memory** | 1184684 KB |
| **Plan cost** | 38 |
| **Generated states** | 998738719 |

	Expanded 5012871 state(s).
	Reopened 0 state(s).
	Evaluated 7112921 state(s).
	Evaluations: 7112921
	Generated 104772916 state(s).
	Dead ends: 2100049 state(s).
	Number of registered states: 7112921

	run with:  --search-memory-limit 11G --search "lazy_wastar([ff()], reopen_closed=false)"

 
 ### FF, greedy

Plan obtained using **greedy search (without reopening)** as search algorithm, and **ff** as heuristic.

<img src="problem4_sas_plan_ff_greedy.png" alt="plan" height="340"/>

| | |
|--|--|
| **Total time** | 0.0452217s |
| **Peak memory** | 11828 KB |
| **Plan cost** | 62 |
| **Generated states** | 6115 |

	Expanded 692 state(s).
	Reopened 0 state(s).
	Evaluated 716 state(s).
	Evaluations: 716
	Generated 6115 state(s).
	Dead ends: 23 state(s).
	Number of registered states: 716

	run with:  --search-memory-limit 11G --search "lazy_greedy([ff()], reopen_closed=false)"


  ### LMCUT, A* (reopening)

Plan obtained using **A\* (with reopening)** as search algorithm, and **lmcut** as heuristic.

<img src="problem4_sas_plan_lmcut.png" alt="plan" height="340"/>

| | |
|--|--|
| **Total time** | 524.762s |
| **Peak memory** | 1276556 KB |
| **Plan cost** | 38 |
| **Generated states** | 114141143 |

	Expanded 5460625 state(s).
	Reopened 0 state(s).
	Evaluated 7736060 state(s).
	Evaluations: 7736060
	Generated 114141143 state(s).
	Dead ends: 2275434 state(s).
	Number of registered states: 7736060

	run with:  --search-memory-limit 11G --search "lazy_wastar([lmcut()], reopen_closed=true)"

 
 
 
