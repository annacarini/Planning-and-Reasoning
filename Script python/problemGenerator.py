from Problem import *


prob = Problem("prob1", 3, 4)

# tiles disponibili
prob.setTiles3(5)
prob.setTiles7(1)
prob.setTilesA(1)
prob.setTilesC(2)

#ori
prob.addGold(0,0)
prob.addGold(0,3)
prob.addGold(2,0)
prob.addGold(2,2)

# argenti
prob.addSilver(1,1)

# genera file PDDL
prob.generateProblemFile()
