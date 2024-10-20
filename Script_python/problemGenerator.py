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

'''

################## ISTANZA 1 ##################

prob = Problem("problem1", 10, 7)

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
prob.generateInputForDrawing()



################## ISTANZA 2 ##################

prob = Problem("problem2", 12, 8)

# tiles disponibili
prob.setTiles3(4)
prob.setTiles5(5)
prob.setTiles6(6)
prob.setTiles7(5)
prob.setTiles9(4)
prob.setTilesA(6)
prob.setTilesB(3)
prob.setTilesC(7)
prob.setTilesD(5)
prob.setTilesE(4)
prob.setTilesF(3)

#ori
prob.addGold(1,1)
prob.addGold(5,6)
prob.addGold(11,7)

# argenti
prob.addSilver(2,2)
prob.addSilver(3,5)
prob.addSilver(7,3)
prob.addSilver(10,4)
prob.addSilver(11,2)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()



################## ISTANZA 3 ##################

prob = Problem("problem3", 10, 12)

# tiles disponibili
prob.setTiles3(5)
prob.setTiles5(6)
prob.setTiles6(5)
prob.setTiles7(4)
prob.setTiles9(7)
prob.setTilesA(5)
prob.setTilesB(6)
prob.setTilesC(5)
prob.setTilesD(4)
prob.setTilesE(5)
prob.setTilesF(6)

#ori
prob.addGold(2,3)
prob.addGold(4,8)
prob.addGold(8,11)
prob.addGold(9,2)

# argenti
prob.addSilver(1,5)
prob.addSilver(3,6)
prob.addSilver(6,9)
prob.addSilver(8,4)
prob.addSilver(9,7)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()


################## ISTANZA 4 ##################

prob = Problem("problem4", 8, 10)

# tiles disponibili
prob.setTiles3(6)
prob.setTiles5(5)
prob.setTiles6(6)
prob.setTiles7(5)
prob.setTiles9(3)
prob.setTilesA(6)
prob.setTilesB(7)
prob.setTilesC(5)
prob.setTilesD(4)
prob.setTilesE(5)
prob.setTilesF(4)

#ori
prob.addGold(3,2)
prob.addGold(6,7)
prob.addGold(7,9)

# argenti
prob.addSilver(1,1)
prob.addSilver(2,4)
prob.addSilver(4,6)
prob.addSilver(5,8)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()


################## ISTANZA 5 ##################

prob = Problem("problem5", 12, 6)

# tiles disponibili
prob.setTiles3(5)
prob.setTiles5(4)
prob.setTiles6(7)
prob.setTiles7(6)
prob.setTiles9(6)
prob.setTilesA(4)
prob.setTilesB(5)
prob.setTilesC(6)
prob.setTilesD(5)
prob.setTilesE(7)
prob.setTilesF(4)

#ori
prob.addGold(2,1)
prob.addGold(6,3)
prob.addGold(10,5)

# argenti
prob.addSilver(1,2)
prob.addSilver(4,4)
prob.addSilver(5,2)
prob.addSilver(7,5)
prob.addSilver(10,1)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()




################## ISTANZA 6 ##################

prob = Problem("problem6", 8, 6)

# tiles disponibili
prob.setTiles3(4)
prob.setTiles5(5)
prob.setTiles6(6)
prob.setTiles7(5)
prob.setTiles9(4)
prob.setTilesA(6)
prob.setTilesB(3)
prob.setTilesC(7)
prob.setTilesD(5)
prob.setTilesE(4)
prob.setTilesF(3)

#ori
prob.addGold(1,1)
prob.addGold(5,5)

# argenti
prob.addSilver(2,3)
prob.addSilver(6,2)
prob.addSilver(7,4)

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()

'''

################## ISTANZA 7 ##################

# prob = Problem("problem7", 5, 5)
#
# # tiles disponibili
# prob.setTiles3(4)
# #prob.setTiles5(0)
# prob.setTiles6(1)
# #prob.setTiles7(2)
# prob.setTiles9(1)
# prob.setTilesA(1)
# prob.setTilesB(1)
# prob.setTilesC(1)
# #prob.setTilesD(4)
# prob.setTilesE(3)
# prob.setTilesF(1)
#
# #ori
# prob.addGold(1,1)
# prob.addGold(3,3)
#
# # argenti
# prob.addSilver(2,4)
# prob.addSilver(4,2)
#
# # genera file PDDL
# prob.generateProblemFile()
# prob.generateInputForDrawing()

################## ISTANZA 1 NEW ##################

prob = Problem("new_problem1", 5, 5)



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

################## ISTANZA 2 NEW ##################

# prob = Problem("new_problem2", 4, 7)
#
# # tiles disponibili
# prob.setTiles3(4)
# prob.setTiles5(2)
# prob.setTiles6(2)
# prob.setTiles7(1)
# prob.setTiles9(1)
# prob.setTilesA(2)
# prob.setTilesB(1)
# prob.setTilesC(3)
# prob.setTilesD(0)
# prob.setTilesE(1)
# prob.setTilesF(1)
#
# #ori
# prob.addGold(2,6)
# prob.addGold(1,2)
#
# # argenti
# prob.addSilver(1,1)
# prob.addSilver(0,6)
# prob.addSilver(3,3)
#
#
# ################## ISTANZA 3 NEW ##################
# #

'''
prob = Problem("new_problem3", 6, 5)

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


################### ISTANZA 4 NEW ##################

prob = Problem("new_problem4", 9, 3)

# tiles disponibili
prob.setTiles3(3)
prob.setTiles5(2)
#prob.setTiles6(1)
#prob.setTiles7(1)
prob.setTiles9(1)
prob.setTilesA(1)
prob.setTilesB(1)
prob.setTilesC(2)
#prob.setTilesD(1)
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

# # ################## ISTANZA 5 NEW ##################
# #
# prob = Problem("new_problem5", 4, 6)
#
# # tiles disponibili
# prob.setTiles3(4)
# prob.setTiles5(2)
# prob.setTiles6(2)
# prob.setTiles7(1)
# prob.setTiles9(2)
# prob.setTilesA(2)
# prob.setTilesB(1)
# prob.setTilesC(2)
# prob.setTilesD(1)
# #prob.setTilesE(1)
# prob.setTilesF(1)
#
# #ori
# prob.addGold(0,5)
# prob.addGold(3,0)
# prob.addGold(1,2)
#
# # argenti
# prob.addSilver(0,1)
# prob.addSilver(2,4)
# prob.addSilver(3,2)
#

# genera file PDDL
prob.generateProblemFile()
prob.generateInputForDrawing()





