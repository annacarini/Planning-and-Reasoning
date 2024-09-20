
# Date le coordinate (r,c) di una cella, ti da' le coordinate (x1,y1) e (x2,y2) degli angoli in alto a sx e in basso a dx
def getCellCorners(r,c, cell_size):
    return (c*cell_size, r*cell_size, c*cell_size + cell_size, r*cell_size + cell_size)


# FUNZIONI PER DISEGNARE LE TILE

def drawTile3(draw, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    y = (y1 + y2)/2
    draw.line([(x1, y), (x2, y)], fill=color, width=width)
    return


def drawTile5(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy)], fill=color)
    return


def drawTile6(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy)], fill=color)
    return


def drawTile7(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy)], fill=color)
    return


def drawTile9(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy)], fill=color)
    return


def drawTileA(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy)], fill=color)
    return


def drawTileB(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy)], fill=color)
    return



def drawTileC(draw, color, width, corners):
    x1 = corners[0]
    y1 = corners[1]
    x2 = corners[2]
    y2 = corners[3]
    x = (x1 + x2)/2
    draw.line([(x, y1), (x, y2)], fill=color, width=width)
    return


def drawTileD(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy)], fill=color)
    return


def drawTileE(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy)], fill=color)
    return



def drawTileF(draw, color, width, corners):
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
    draw.polygon([(ax,ay), (bx,by), (cx,cy), (dx,dy), (ex,ey), (fx,fy), (gx,gy), (hx,hy), (ix,iy), (jx,jy), (kx,ky), (lx,ly)], fill=color)
    return










    
