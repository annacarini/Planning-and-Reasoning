import PIL
from PIL import Image, ImageDraw
from TileDrawer import *




# PARAMETRI GRIGLIA (andranno passati da linea di comando)
rows = 3
cols = 4

# POSIZIONI ORI (andranno passati da linea di comando)
golds = {"g1":[0,0], "g2":[0,3], "g3":[2,0], "g4":[2,2]}


# PARAMETRI GRAFICI
cell_size = 100
grid_color = (170, 170, 170)
grid_line_width = 6
gold_color = (247, 212, 43)
rail_color = (33, 168, 186, 150)

# Prefisso azione di posizionamento tile nel plan
place_tile_prefix = "(place_tile_"


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
for i in golds:
    pos_x = golds[i][1] * cell_size + cell_size/2
    pos_y = golds[i][0] * cell_size + cell_size/2
    r = cell_size/4
    draw.ellipse([(pos_x-r, pos_y-r), (pos_x+r, pos_y+r)], fill=gold_color)


# Apri file con il plan per sapere dove mettere le tile
plan_file = open('sas_plan', 'r')
lines = plan_file.readlines()
plan_file.close()


# Disegna le tile
for line in lines:
    # Se la riga inizia con "(place_tile_"
    if (line[:len(place_tile_prefix)] == place_tile_prefix):
        tile_type = line[len(place_tile_prefix)]    # il carattere dopo "(place_tile_" indica che tile e'
        position_of_space = line.index(" ", len(place_tile_prefix)+2)
        cell_name = line[len(place_tile_prefix)+2:position_of_space]
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





