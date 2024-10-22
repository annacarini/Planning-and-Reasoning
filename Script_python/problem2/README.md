# Problem 2

### Code to generate the PDDL file

        prob = Problem("problem2", 4, 7)
        
        # available tiles
        prob.setTiles3(4)
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

        # golds
        prob.addGold(2,6)
        prob.addGold(1,2)

        # silvers
        prob.addSilver(1,1)
        prob.addSilver(0,6)
        prob.addSilver(3,3)

        # generate PDDL file
        prob.generateProblemFile()
        prob.generateInputForDrawing()


## LAMA

We ran **LAMA-2011** and we obtained 6 plans, of progressively smaller costs. The first and last one are shown here:

<img src=" " alt="plan" width="220"/> |  <img src=" " alt="plan" width="220"/>
:-------------------------:|:-------------------------:
Plan 1  |  Plan 6

Information about all the generated plans:

| Plan | Search time | Plan cost |  Expanded states | Generated states |
|--|--|--|--|--|
| 1 | 0.00195456s | 71 | 9 | 186 |
| 2 | 0.0037423s | 56 | 16 | 284 |
| 3 | 0.0172526s | 54 | 172 | 1353 |
| 4 | 0.330794s | 52 | 4125 | 25956 |
| 5 | 15.7498s | 41 | 214881 | 214881 |
| 6 | 1104.55s | 36 | 16763870 | 252571006 |
| FINISH | 1926.3s | - | 18948571 | 337922749 |

| | |
|--|--|
| **Total time** | 3049.95s |
| **Peak memory** | 4074132 KB |

	run with:  --search-memory-limit 11G --alias seq-sat-lama-2011

## Other tests

### HMAX, A* (no reopening)

Plan obtained using **A\* (without reopening)** as search algorithm, and **hmax** as heuristic.

<img src="problem2_sas_plan_hmax.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 2792.2s |
| **Peak memory** | 11207776 KB |
| **Plan cost** | 36 |
| **Generated states** | 998738719 |

	Expanded 60862207 state(s).
	Reopened 0 state(s).
	Evaluated 71891773 state(s).
	Evaluations: 71891773
	Generated 998738719 state(s).
	Dead ends: 11029565 state(s).
	Number of registered states: 71891773

	run with:  --search-memory-limit 11G --search "lazy_wastar([hmax()], reopen_closed=false)"


### FF, A* (no reopening)

Plan obtained using **A\* (without reopening)** as search algorithm, and **ff** as heuristic.

<img src="problem2_sas_plan_ff.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 2723.43s |
| **Peak memory** | 10146244 KB |
| **Plan cost** | 36 |
| **Generated states** | 998738719 |

	Expanded 55254641 state(s).
	Reopened 0 state(s).
	Evaluated 64115963 state(s).
	Evaluations: 64115963
	Generated 889034948 state(s).
	Dead ends: 8861321 state(s).
	Number of registered states: 64115963

	run with:  --search-memory-limit 11G --search "lazy_wastar([ff()], reopen_closed=false)"

 
 ### FF, greedy

Plan obtained using **greedy search (without reopening)** as search algorithm, and **ff** as heuristic.

<img src="problem2_sas_plan_ff_greedy.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 0.0479828s |
| **Peak memory** | 12036 KB |
| **Plan cost** | 51 |
| **Generated states** | 4071 |

	Expanded 318 state(s).
	Reopened 0 state(s).
	Evaluated 352 state(s).
	Evaluations: 352
	Generated 4071 state(s).
	Dead ends: 33 state(s).
	Number of registered states: 352

	run with:  --search-memory-limit 11G --search "lazy_greedy([ff()], reopen_closed=false)"

 
  ### LMCUT, A* (reopening)

Plan obtained using **A\* (with reopening)** as search algorithm, and **lmcut** as heuristic.

<img src="problem2_sas_plan_lmcut.png" alt="plan" width="300"/>

| | |
|--|--|
| **Total time** | 3034.31s |
| **Peak memory** | 10456908 KB |
| **Plan cost** | 36 |
| **Generated states** | 920702333 |

	Expanded 56961080 state(s).
	Reopened 0 state(s).
	Evaluated 66413608 state(s).
	Evaluations: 66413608
	Generated 920702333 state(s).
	Dead ends: 9452527 state(s).
	Number of registered states: 66413608

	run with:  --search-memory-limit 11G --search "lazy_wastar([lmcut()], reopen_closed=true)"
 
