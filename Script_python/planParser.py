import sys
import PIL
from PIL import Image, ImageDraw
from TileDrawer2 import *
import os


    

# PARAMETRI GRAFICI
CELL_SIZE = 100
GRID_COLOR = (100, 100, 100)
GRID_LINE_WIDTH = 2
GOLD_COLOR = (247, 212, 43)
SILVER_COLOR = (128, 128, 128)
RAIL_COLOR = (33, 168, 186, 150)
BACKGROUND_COLOR = (203, 225, 156)
#BACKGROUND_COLOR = (255, 255, 255)
PROBLEMS_DIR = "Script_python"
PLAN_NAME_NO_EXT = "sas_plan"


# Prefisso azione di posizionamento tile nel plan
PLACE_TILE_PREFIX = "(place_tile_"


def find_best_plan(cartella):
    cartella = os.path.join(PROBLEMS_DIR, cartella)
    # Controlla se la cartella esiste
    if not os.path.isdir(cartella):
        print(f"La cartella '{cartella}' non esiste.")
        exit(1)

    # Lista dei file che iniziano con 'sas_plan.' nella cartella
    sas_plan_files = [f for f in os.listdir(cartella) if f.startswith('sas_plan.')]

    # Se non ci sono file che iniziano con 'sas_plan.'
    if not sas_plan_files:
        print("Nessun file 'sas_plan.' trovato.")
        exit(1)

    max_num = None
    max_file = None

    # Cerca il file con il numero più alto dopo 'sas_plan.'
    for file in sas_plan_files:
        try:
            # Estrae il numero dopo 'sas_plan.'
            num = int(file.split('.')[1])
            if max_num is None or num > max_num:
                max_num = num
                max_file = file
        except (IndexError, ValueError):
            # Ignora file che non seguono il formato corretto
            continue

    return max_file
    






def main():
    args = sys.argv[1:]
    # args e' tipo: ["prob.txt", "sas_plan"]

    problem = ""
    plan_file_name = ""     # serve per il nome dell'immagine che salviamo
    plan_file_path = ""

    if len(args) < 1:
        raise Exception("Problem file missing")

    problem = args[0]

    if len(args) < 2:
        plan_file_name = find_best_plan(problem)
        
    else:
        plan_file_name = args[1]

    plan_file_path = os.path.join(PROBLEMS_DIR, problem, plan_file_name)

    
    # Apri file che descrive la griglia e gli ori
    problem_file = open(os.path.join(PROBLEMS_DIR, problem, problem + '.txt'), 'r')
    problem_lines = problem_file.readlines()
    problem_file.close()


    # PARAMETRI GRIGLIA
    grid = problem_lines[0].split(",")
    rows = int(grid[0])
    cols = int(grid[1])

    # ORI
    golds_strings = problem_lines[1].split(";")     # ["(0,0)", ...]
    golds = [eval(x) for x in golds_strings]

    # ARGENTI
    silvers = []
    if (len(problem_lines) > 2):
        silvers_strings = problem_lines[2].split(";")     # ["(0,0)", ...]
        silvers = [eval(x) for x in silvers_strings]
    


    # Creo dizionario che associa nomi delle celle a posizione
    cells = {}
    k = 1
    for i in range(0, rows):
        for j in range(0, cols):
            name = "c" + str(k)
            cells[name] = [i,j]
            k +=1


    # Crea immagine
    img_width = CELL_SIZE * cols
    img_height = CELL_SIZE * rows
    img = PIL.Image.new(mode="RGB", size=(img_width, img_height), color=BACKGROUND_COLOR)
    draw = ImageDraw.Draw(img, "RGBA")


    # Apri file con il plan per sapere dove mettere le tile
    plan_file = open(plan_file_path, 'r')
    lines = plan_file.readlines()
    plan_file.close()


    # Disegna le tile
    for line in lines:
        # Se la riga inizia con "(place_tile_"
        if (line[:len(PLACE_TILE_PREFIX)] == PLACE_TILE_PREFIX):

            # splitta dove ci sono gli spazi
            line_list = line.split(" ")

            # prendi tipo della tile e nome della cella
            pos_tile_type = len(PLACE_TILE_PREFIX)
            tile_type = line_list[0][pos_tile_type:pos_tile_type+1]    # il carattere dopo "place_tile_" indica che tile e'
            cell_name = line_list[1]
            #print("action name:" , line_list[0])
            #print("tile_type", tile_type)
            #print("cell_name", cell_name)
            
            cell_r = cells[cell_name][0]
            cell_c = cells[cell_name][1]

            #Disegna la tile
            if (tile_type == "3"):
                drawTile3(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "5"):
                drawTile5(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "6"):
                drawTile6(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "7"):
                drawTile7(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "9"):
                drawTile9(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "a" or tile_type == "A"):
                drawTileA(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "b" or tile_type == "B"):
                drawTileB(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "c" or tile_type == "C"):
                drawTileC(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "d" or tile_type == "D"):
                drawTileD(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "e" or tile_type == "E"):
                drawTileE(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))
            elif (tile_type == "f" or tile_type == "F"):
                drawTileF(img, RAIL_COLOR, CELL_SIZE//4, getCellCorners(cell_r,cell_c,CELL_SIZE))

    # Disegna ori
    for g in golds:
        pos_x = g[1] * CELL_SIZE + CELL_SIZE/2
        pos_y = g[0] * CELL_SIZE + CELL_SIZE/2
        r = CELL_SIZE/4
        #draw.ellipse([(pos_x-r, pos_y-r), (pos_x+r, pos_y+r)], fill=GOLD_COLOR)
        x = g[1] * CELL_SIZE
        y = g[0] * CELL_SIZE
        im = Image.open("Script_python/images/gold.png")
        img.paste(im, [x, y], im)


    # Disegna argenti
    for s in silvers:
        pos_x = s[1] * CELL_SIZE + CELL_SIZE/2
        pos_y = s[0] * CELL_SIZE + CELL_SIZE/2
        r = CELL_SIZE/4
        #draw.ellipse([(pos_x-r, pos_y-r), (pos_x+r, pos_y+r)], fill=SILVER_COLOR)
        x = s[1] * CELL_SIZE
        y = s[0] * CELL_SIZE
        im = Image.open("Script_python/images/silver.png")
        img.paste(im, [x, y], im)


    
    # Disegna griglia
    for i in range(1, rows):
        draw.line([(0, i*CELL_SIZE), (img.width, i*CELL_SIZE)], fill=GRID_COLOR, width=GRID_LINE_WIDTH)
    for i in range(1, cols):
        draw.line([(i*CELL_SIZE, 0), (i*CELL_SIZE, img.height)], fill=GRID_COLOR, width=GRID_LINE_WIDTH)
    

    # Salva immagine
    img.save(os.path.join(PROBLEMS_DIR, problem, problem + "_" + plan_file_name.replace(".", "") + ".png"), "PNG")
     
    # Mostra immagine
    img.show()



main()

