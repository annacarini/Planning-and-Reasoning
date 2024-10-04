import sys
import PIL
from PIL import Image, ImageDraw
from TileDrawer import *


    

# PARAMETRI GRAFICI
cell_size = 100
grid_color = (170, 170, 170)
grid_line_width = 6
gold_color = (247, 212, 43)
silver_color = (128, 128, 128)
rail_color = (33, 168, 186, 150)

# Prefisso azione di posizionamento tile nel plan
place_tile_prefix = "(place_tile_"




def main():
    args = sys.argv[1:]
    # args e' tipo: ["prob.txt", "sas_plan"]

    problem_file_name = ""
    plan_file_name = ""

    if len(args) < 1:
        raise Exception("Problem file missing")

    problem_file_name = args[0]

    if len(args) < 2:
        #..
        # cercati il file sas_plan_i con i piu' alto
        # plan_file_name = ...
        print("ciao")

    else:
        plan_file_name = args[1]


    
    # Apri file che descrive la griglia e gli ori
    problem_file = open(problem_file_name, 'r')
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
    img_width = cell_size * cols
    img_height = cell_size * rows
    img = PIL.Image.new(mode="RGB", size=(img_width, img_height), color=(255,255,255, 255))
    draw = ImageDraw.Draw(img, "RGBA")


    # Disegna ori
    for g in golds:
        pos_x = g[1] * cell_size + cell_size/2
        pos_y = g[0] * cell_size + cell_size/2
        r = cell_size/4
        draw.ellipse([(pos_x-r, pos_y-r), (pos_x+r, pos_y+r)], fill=gold_color)


    # Disegna argenti
    for s in silvers:
        pos_x = s[1] * cell_size + cell_size/2
        pos_y = s[0] * cell_size + cell_size/2
        r = cell_size/4
        draw.ellipse([(pos_x-r, pos_y-r), (pos_x+r, pos_y+r)], fill=silver_color)



    # Apri file con il plan per sapere dove mettere le tile
    plan_file = open(plan_file_name, 'r')
    lines = plan_file.readlines()
    plan_file.close()


    # Disegna le tile
    for line in lines:
        # Se la riga inizia con "(place_tile_"
        if (line[:len(place_tile_prefix)] == place_tile_prefix):

            # splitta dove ci sono gli spazi
            line_list = line.split(" ")

            # prendi tipo della tile e nome della cella
            pos_tile_type = len(place_tile_prefix)
            tile_type = line_list[0][pos_tile_type:pos_tile_type+1]    # il carattere dopo "place_tile_" indica che tile e'
            cell_name = line_list[1]
            #print("action name:" , line_list[0])
            #print("tile_type", tile_type)
            #print("cell_name", cell_name)
            
            cell_r = cells[cell_name][0]
            cell_c = cells[cell_name][1]

            #Disegna la tile
            if (tile_type == "3"):
                drawTile3(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "5"):
                drawTile5(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "6"):
                drawTile6(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "7"):
                drawTile7(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "9"):
                drawTile9(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "a" or tile_type == "A"):
                drawTileA(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "b" or tile_type == "B"):
                drawTileB(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "c" or tile_type == "C"):
                drawTileC(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "d" or tile_type == "D"):
                drawTileD(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "e" or tile_type == "E"):
                drawTileE(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
            elif (tile_type == "f" or tile_type == "F"):
                drawTileF(draw, rail_color, cell_size//4, getCellCorners(cell_r,cell_c,cell_size))
      


    # Disegna griglia
    for i in range(1, rows):
        draw.line([(0, i*cell_size), (img.width, i*cell_size)], fill=grid_color, width=grid_line_width)
    for i in range(1, cols):
        draw.line([(i*cell_size, 0), (i*cell_size, img.height)], fill=grid_color, width=grid_line_width)


    # Salva immagine
    img.save("output.png", "PNG")
     
    # Mostra immagine
    img.show()



main()

