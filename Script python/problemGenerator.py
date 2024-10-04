from Problem import *

################## PROVA ##################
'''
prob = Problem("problem0", 3, 4)

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
prob.addSilver(1,2)

# genera file PDDL
prob.generateProblemFile()
'''


################## ISTANZA 1 ##################
'''
prob = Problem("problem1", 8, 10)

# tiles disponibili
prob.setTiles3(4)
prob.setTiles5(6)
prob.setTiles6(6)
prob.setTiles7(5)
prob.setTiles9(7)
prob.setTilesA(7)
prob.setTilesB(5)
prob.setTilesC(5)
prob.setTilesD(5)
prob.setTilesE(5)
prob.setTilesF(3)

#ori
prob.addGold(2,4)
prob.addGold(7,2)
prob.addGold(6,6)

# argenti
prob.addSilver(4,4)
prob.addSilver(4,2)
prob.addSilver(6,0)
prob.addSilver(7,5)

# genera file PDDL
prob.generateProblemFile()
'''



################## ISTANZA 2 ##################

prob = Problem("problem2", 6, 7)

# tiles disponibili
prob.setTiles3(4)
prob.setTiles5(6)
prob.setTiles6(6)
prob.setTiles7(5)
prob.setTiles9(7)
prob.setTilesA(7)
prob.setTilesB(5)
prob.setTilesC(5)
prob.setTilesD(5)
prob.setTilesE(5)
prob.setTilesF(3)

#ori
prob.addGold(2,4)
prob.addGold(3,6)
prob.addGold(5,6)

# argenti
prob.addSilver(4,4)
prob.addSilver(4,2)
prob.addSilver(1,0)
prob.addSilver(2,5)

# genera file PDDL
#prob.generateProblemFile()
prob.generateInputForDrawing()






