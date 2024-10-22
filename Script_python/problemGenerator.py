from Problem import *



################## ISTANZA 1 ##################

prob = Problem("problem1", 5, 5)

# tiles disponibili
prob.setTiles3(3)
prob.setTiles5(1)
prob.setTiles6(2)
prob.setTiles7(0)
prob.setTiles9(2)
prob.setTilesA(1)
prob.setTilesB(0)
prob.setTilesC(3)
prob.setTilesD(1)
prob.setTilesE(0)
prob.setTilesF(1)

#ori
prob.addGold(1,4)
prob.addGold(0,1)
prob.addGold(3,2)

# argenti
prob.addSilver(0,2)
prob.addSilver(2,0)
prob.addSilver(4,3)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()




################## ISTANZA 2 ##################

prob = Problem("problem2", 4, 7)

# tiles disponibili
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

#ori
prob.addGold(2,6)
prob.addGold(1,2)

# argenti
prob.addSilver(1,1)
prob.addSilver(0,6)
prob.addSilver(3,3)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()




# ################## ISTANZA 3 ##################

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




################### ISTANZA 4 ##################

prob = Problem("problem4", 9, 3)

# tiles disponibili
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

#ori
prob.addGold(1,2)
prob.addGold(3,0)
prob.addGold(6,2)

# argenti
prob.addSilver(1,0)
prob.addSilver(3,1)
prob.addSilver(6,1)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()




# # ################## ISTANZA 5 ##################

prob = Problem("problem5", 4, 6)

# tiles disponibili
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

#ori
prob.addGold(0,5)
prob.addGold(3,0)
prob.addGold(1,2)

# argenti
prob.addSilver(0,1)
prob.addSilver(2,4)
prob.addSilver(3,2)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()





