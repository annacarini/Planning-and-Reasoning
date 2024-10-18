# Planning-and-Reasoning
https://prod.liveshare.vsengsaas.visualstudio.com/join?E0CE1ADFB7A6A7780442162C8EBEF67F6616


TEMPI

new_problem4

problem generator:
	prob = Problem("new_problem4", 9, 3)
	prob.setTiles3(3)
	prob.setTiles5(2)
	prob.setTiles9(1)
	prob.setTilesA(1)
	prob.setTilesB(1)
	prob.setTilesC(2)
	prob.setTilesE(1)
	prob.addGold(1,2)
	prob.addGold(3,0)
	prob.addGold(6,2)
	prob.addSilver(1,0)
	prob.addSilver(3,1)
	prob.addSilver(6,1)

avviato con:
	astar(ff())	->  tempo = 993.915s

	astar(hmax())	->  tempo = 1334.53s

	astar(ff()) SENZA STARTED_PAYING   ->  tempo = 717.153s

	astar(hmax()) SENZA STARTED_PAYING ->  tempo = 1893.61s

	astar(hmax()) CON COSTO PAY_DEBT=20 ->  tempo = boh l'ho fermato io dopo 2198 secondi ma non aveva ancora finito




