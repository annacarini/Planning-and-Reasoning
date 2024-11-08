
#NOME DOMINIO
DOMAIN_NAME = "progetto"



class PositionedObject:
    def __init__(self, row, col):
        self.row = row
        self.col = col
    def __str__(self):
        return f"({self.row},{self.col})"


class Problem:

    def __init__(self, problemName, rows, cols):
        self.problemName = problemName
        self.rows = rows
        self.cols = cols
        
        self.golds = []
        self.silvers = []
        
        self.tiles3 = 0
        self.tiles5 = 0
        self.tiles6 = 0
        self.tiles7 = 0
        self.tiles9 = 0
        self.tilesA = 0
        self.tilesB = 0
        self.tilesC = 0
        self.tilesD = 0
        self.tilesE = 0
        self.tilesF = 0
        
        self.cells = []     # array coi nomi delle celle: ["c1", "c2", ...], serve per dopo
        cellsNumber = rows * cols
        for i in range(0, cellsNumber):
            self.cells.append("c" + str(i+1))
            


    # per mettere gli ori
    def addGold(self, r, c):
        if (r >= self.rows):
            raise Exception("Trying to position a gold on row " + str(r) + ", but there are " + str(self.rows) + " rows.")
        if (c >= self.cols):
            raise Exception("Trying to position a gold on column " + str(c) + ", but there are " + str(self.cols) + " columns.") 
        self.golds.append(PositionedObject(r,c))

    # per mettere gli argenti
    def addSilver(self, r, c):
        if (r >= self.rows):
            raise Exception("Trying to position a silver on row " + str(r) + ", but there are " + str(self.rows) + " rows.")
        if (c >= self.cols):
            raise Exception("Trying to position a silver on column " + str(c) + ", but there are " + str(self.cols) + " columns.") 
        self.silvers.append(PositionedObject(r,c))


    # per impostare quante tile abbiamo a disposizione
    def setTiles3(self, k):
        self.tiles3 = k

    def setTiles5(self, k):
        self.tiles5 = k

    def setTiles6(self, k):
        self.tiles6 = k

    def setTiles7(self, k):
        self.tiles7 = k

    def setTiles9(self, k):
        self.tiles9 = k

    def setTilesA(self, k):
        self.tilesA = k

    def setTilesB(self, k):
        self.tilesB = k

    def setTilesC(self, k):
        self.tilesC = k

    def setTilesD(self, k):
        self.tilesD = k

    def setTilesE(self, k):
        self.tilesE = k
        
    def setTilesF(self, k):
        self.tilesF = k



    # funzioni ausiliarie per generateProblemFile()
    
    def createTileObjectsString(self, quantity, tileType):      # tileType deve essere: "3", "5", ecc
        res = ""
        for i in range(0, quantity):
            res += "t" + tileType + "_" + str(i+1) + " "
        res += "- tile_" + tileType
        return res


    def createGridInitString(self, indentQuantity):
        indent = ""
        indent += "\t" * indentQuantity
        
        # is_above:
        isAbove = ""
        for i in range(0, len(self.cells) - self.cols):
            isAbove += indent + "(is_above " + self.cells[i] + " " + self.cells[i + self.cols] + ")\n"
     
        # is_right:
        isRight = ""
        for i in range(0, len(self.cells)):
            if (i % self.cols != 0):            # se non e' la prima cella di una riga
                isRight += indent + "(is_right " + self.cells[i] + " " + self.cells[i - 1] + ")\n"

        return isAbove + "\n" + isRight


    def cellAtPosition(self, r, c):
        index = (r * self.cols) + c
        return self.cells[index]


    # per generare il file del problema
    def generateProblemFile(self):

        # crea file
        filename = self.problemName + ".pddl"
        f = open(filename, "w")

        # nome problema e dominio
        f.write("(define (problem " + self.problemName + ")\n")
        f.write("\t(:domain " + DOMAIN_NAME + ")\n")


        ########### OBJECTS ###########
        f.write("\t(:objects\n")


        # celle
        cellsToWrite = ""
        for cell in self.cells:
            cellsToWrite += cell + " "
        cellsToWrite += "- cell"
        f.write("\t\t" + cellsToWrite + "\n")


        # tiles
        if (self.tiles3 > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tiles3, "3") + "\n")
        if (self.tiles5 > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tiles5, "5") + "\n")
        if (self.tiles6 > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tiles6, "6") + "\n")
        if (self.tiles7 > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tiles7, "7") + "\n")
        if (self.tiles9 > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tiles9, "9") + "\n")
        if (self.tilesA > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tilesA, "a") + "\n")
        if (self.tilesB > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tilesB, "b") + "\n")
        if (self.tilesC > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tilesC, "c") + "\n")
        if (self.tilesD > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tilesD, "d") + "\n")
        if (self.tilesE > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tilesE, "e") + "\n")
        if (self.tilesF > 0):
            f.write("\t\t" + self.createTileObjectsString(self.tilesF, "f") + "\n")


        # debt, 1 per ogni silver
        debtToWrite = "\t\t"
        for i in range(0, len(self.silvers)):
            debtToWrite += "d" + str(i+1) + " "
        debtToWrite += "- debt\n"
        f.write(debtToWrite)


        f.write("\t)\n")
        ########### FINE OBJECTS ###########


        
        ########### INIT ###########
        f.write("\t(:init\n")

        # is_above, is_below, is_left, is_right
        gridInit = self.createGridInitString(2)
        f.write(gridInit)

        # posiziono una tile F sul primo oro
        cell = self.cellAtPosition(self.golds[0].row, self.golds[0].col)
        toWrite = "\n\t\t(has_tile " + cell + ")\n"
        toWrite += "\t\t(open_left " + cell + ")\n"
        toWrite += "\t\t(open_above " + cell + ")\n"
        toWrite += "\t\t(open_below " + cell + ")\n"
        toWrite += "\t\t(open_right " + cell + ")\n"
        f.write(toWrite)

        # has_silver
        f.write("\n")
        toWrite = ""
        for silv in self.silvers:
            toWrite += "\t\t(has_silver " + self.cellAtPosition(silv.row, silv.col) + ")\n"
        f.write(toWrite)

        # parti con tutti i debiti
        debtToWrite = "\n"
        for i in range(0, len(self.silvers)):
            debtToWrite += "\t\t(has_debt d" + str(i+1) + ")\n"
        f.write(debtToWrite)

        # costo iniziale
        f.write("\n\t\t(= (total-cost) 0)\n")


        f.write("\t)\n")
        ########### FINE INIT ###########



        ########### GOAL ###########
        f.write("\t(:goal\n\t\t(and\n")

        # controllo ori
        toWrite = ""
        for gold in self.golds:
            toWrite += "\t\t\t(has_tile " + self.cellAtPosition(gold.row, gold.col) + ")\n"
        f.write(toWrite)

        # controllo debiti
        debtToWrite = ""
        for i in range(0, len(self.silvers)):
            debtToWrite += "\t\t\t(not (has_debt d" + str(i+1) + "))\n"
        f.write(debtToWrite)


        f.write("\t\t)\n\t)\n")
        ########### FINE GOAL ###########


        ########### METRIC ###########
        f.write("\t(:metric\n\t\tminimize (total-cost)\n\t)\n")
        ########### FINE METRIC ###########


        # chiudi file
        f.write(")")
        f.close()
        

    def generateInputForDrawing(self):

        filename = self.problemName + ".txt"
        f = open(filename, "w")
        
        f.write(f"{self.rows},{self.cols}\n")

        golds_string = ""
        for g in self.golds:
            golds_string += str(g) + ";"
        f.write(golds_string[:-1] + "\n")

        silvers_string = ""
        for s in self.silvers:
            silvers_string += str(s) + ";"
        f.write(silvers_string[:-1] + "\n")

        f.close()
        


