from PIL import Image


# Date le coordinate (r,c) di una cella, ti da' le coordinate (x1,y1) e (x2,y2) degli angoli in alto a sx e in basso a dx
def getCellCorners(r,c, cell_size):
    return (c*cell_size, r*cell_size, c*cell_size + cell_size, r*cell_size + cell_size)


# FUNZIONI PER DISEGNARE LE TILE

def drawTile3(img, color, width, corners):
    
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    y = (y1 + y2)/2
    #draw.line([(x1, y), (x2, y)], fill=color, width=width)
    im = Image.open("Script_python/images/tile_3.png")
    img.paste(im, [x1, y1], im)
    return


def drawTile5(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y2
    bx = (x2+x1)/2 - width/2
    by = (y2+y1)/2 - width/2
    cx = x2
    cy = (y2+y1)/2 - width/2
    dx = x2
    dy = (y2+y1)/2 + width/2
    ex = (x2+x1)/2 + width/2
    ey = (y2+y1)/2 + width/2
    fx = (x2+x1)/2 + width/2
    fy = y2
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy)], fill=color)
    im = Image.open("Script_python/images/tile_5.png")
    img.paste(im, [x1, y1], im)
    return


def drawTile6(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y2
    bx = (x2+x1)/2 - width/2
    by = (y2+y1)/2 + width/2
    cx = x1
    cy = (y2+y1)/2 + width/2
    dx = x1
    dy = (y2+y1)/2 - width/2
    ex = (x2+x1)/2 + width/2
    ey = (y2+y1)/2 - width/2
    fx = (x2+x1)/2 + width/2
    fy = y2
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy)], fill=color)
    im = Image.open("Script_python/images/tile_6.png")
    img.paste(im, [x1, y1], im)
    return


def drawTile7(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y2
    bx = (x2+x1)/2 - width/2
    by = (y2+y1)/2 + width/2
    cx = x1
    cy = (y2+y1)/2 + width/2
    dx = x1
    dy = (y2+y1)/2 - width/2
    ex = x2
    ey = (y2+y1)/2 - width/2
    fx = x2
    fy = (y2+y1)/2 + width/2
    gx = (x2+x1)/2 + width/2
    gy = (y2+y1)/2 + width/2
    hx = (x2+x1)/2 + width/2
    hy = y2
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy)], fill=color)
    im = Image.open("Script_python/images/tile_7.png")
    img.paste(im, [x1, y1], im)
    return


def drawTile9(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y1
    bx = (x2+x1)/2 - width/2
    by = (y2+y1)/2 + width/2
    cx = x2
    cy = (y2+y1)/2 + width/2
    dx = x2
    dy = (y2+y1)/2 - width/2
    ex = (x2+x1)/2 + width/2
    ey = (y2+y1)/2 - width/2
    fx = (x2+x1)/2 + width/2
    fy = y1
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy)], fill=color)
    im = Image.open("Script_python/images/tile_9.png")
    img.paste(im, [x1, y1], im)
    return


def drawTileA(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y1
    bx = (x2+x1)/2 - width/2
    by = (y2+y1)/2 - width/2
    cx = x1
    cy = (y2+y1)/2 - width/2
    dx = x1
    dy = (y2+y1)/2 + width/2
    ex = (x2+x1)/2 + width/2
    ey = (y2+y1)/2 + width/2
    fx = (x2+x1)/2 + width/2
    fy = y1
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy)], fill=color)
    im = Image.open("Script_python/images/tile_a.png")
    img.paste(im, [x1, y1], im)
    return


def drawTileB(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y1
    bx = (x2+x1)/2 - width/2
    by = (y2+y1)/2 - width/2
    cx = x1
    cy = (y2+y1)/2 - width/2
    dx = x1
    dy = (y2+y1)/2 + width/2
    ex = x2
    ey = (y2+y1)/2 + width/2
    fx = x2
    fy = (y2+y1)/2 - width/2
    gx = (x2+x1)/2 + width/2
    gy = (y2+y1)/2 - width/2
    hx = (x2+x1)/2 + width/2
    hy = y1
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy)], fill=color)
    im = Image.open("Script_python/images/tile_b.png")
    img.paste(im, [x1, y1], im)
    return



def drawTileC(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    x = (x1 + x2)/2
    #draw.line([(x, y1), (x, y2)], fill=color, width=width)
    im = Image.open("Script_python/images/tile_c.png")
    img.paste(im, [x1, y1], im)
    return


def drawTileD(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y2
    bx = (x2+x1)/2 - width/2
    by = y1
    cx = (x2+x1)/2 + width/2
    cy = y1
    dx = (x2+x1)/2 + width/2
    dy = (y2+y1)/2 - width/2
    ex = x2
    ey = (y2+y1)/2 - width/2
    fx = x2
    fy = (y2+y1)/2 + width/2
    gx = (x2+x1)/2 + width/2
    gy = (y2+y1)/2 + width/2
    hx = (x2+x1)/2 + width/2
    hy = y2
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy)], fill=color)
    im = Image.open("Script_python/images/tile_d.png")
    img.paste(im, [x1, y1], im)
    return


def drawTileE(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y2
    bx = (x2+x1)/2 + width/2
    by = y2
    cx = (x2+x1)/2 + width/2
    cy = y1
    dx = (x2+x1)/2 - width/2
    dy = y1
    ex = (x2+x1)/2 - width/2
    ey = (y2+y1)/2 - width/2
    fx = x1
    fy = (y2+y1)/2 - width/2
    gx = x1
    gy = (y2+y1)/2 + width/2
    hx = (x2+x1)/2 - width/2
    hy = (y2+y1)/2 + width/2
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy)], fill=color)
    im = Image.open("Script_python/images/tile_e.png")
    img.paste(im, [x1, y1], im)
    return



def drawTileF(img, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    ax = (x2+x1)/2 - width/2
    ay = y2
    bx = (x2+x1)/2 + width/2
    by = y2
    cx = (x2+x1)/2 + width/2
    cy = (y2+y1)/2 + width/2
    dx = x2
    dy = (y2+y1)/2 + width/2
    ex = x2
    ey = (y2+y1)/2 - width/2
    fx = (x2+x1)/2 + width/2
    fy = (y2+y1)/2 - width/2
    gx = (x2+x1)/2 + width/2
    gy = y1
    hx = (x2+x1)/2 - width/2
    hy = y1
    ix = (x2+x1)/2 - width/2
    iy = (y2+y1)/2 - width/2
    jx = x1
    jy = (y2+y1)/2 - width/2
    kx = x1
    ky = (y2+y1)/2 + width/2
    lx = (x2+x1)/2 - width/2
    ly = (y2+y1)/2 + width/2
    #draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy), (ix,iy), (jx,jy), (kx,ky), (lx,ly)], fill=color)
    im = Image.open("Script_python/images/tile_f.png")
    img.paste(im, [x1, y1], im)
    return










    
