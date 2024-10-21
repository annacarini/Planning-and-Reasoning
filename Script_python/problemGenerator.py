from Problem import *

'''

################## PROVA ##################

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
prob.generateInputForDrawing()

'''



################## ISTANZA 1 NEW ##################

prob = Problem("problem1", 5, 5)


# tiles disponibili
prob.setTiles3(3)
prob.setTiles5(1)
prob.setTiles6(2)
# prob.setTiles7(1)
prob.setTiles9(2)
prob.setTilesA(1)
#prob.setTilesB(2)
prob.setTilesC(3)
prob.setTilesD(1)
# prob.setTilesE(1)
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


'''
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

'''


'''
# ################## ISTANZA 3 NEW ##################

prob = Problem("problem3", 6, 5)

# tiles disponibili
prob.setTiles3(3)
prob.setTiles5(1)
prob.setTiles6(2)
prob.setTiles7(2)
prob.setTiles9(1)
prob.setTilesA(2)
# prob.setTilesB(1)
prob.setTilesC(4)
prob.setTilesD(1)
prob.setTilesE(1)
# prob.setTilesF(1)

#ori
prob.addGold(2,2)
prob.addGold(1,1)
prob.addGold(5,3)

# argenti
prob.addSilver(3,0)
prob.addSilver(0,3)
prob.addSilver(2,4)
prob.addSilver(4,2)

'''


'''
################### ISTANZA 4 NEW ##################

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
#prob.setTilesF(1)

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

'''


'''
# # ################## ISTANZA 5 NEW ##################

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
#prob.setTilesE(1)
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

'''



