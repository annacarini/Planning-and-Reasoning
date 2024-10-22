(define (domain progetto)
    (:requirements :strips :typing :disjunctive-preconditions :negative-preconditions :action-costs :equality)

    (:types
        cell - object
        tile - object
        tile_3 tile_5 tile_6 tile_7 tile_9 tile_a tile_b tile_c tile_d tile_e tile_f - tile
        debt - object
    )

    (:predicates
        ; to structure the cells into a grid
        (is_above ?c1 - cell ?c2 - cell)
        (is_right ?c1 - cell ?c2 - cell)

        ; to know whether a cell has a silver
        (has_silver ?c - cell)

        ; to avoid using the same tile twice
        (used ?t - tile)

        ; to indicate that the agent has a debt
        (has_debt ?d - debt)

        ; to know whether a cell has a tile placed on it
        (has_tile ?c - cell)

        ; to know the type of tile placed on a cell
        (open_left ?c - cell)
        (open_right ?c - cell)
        (open_above ?c - cell)
        (open_below ?c - cell)

        ; to force the agent to only pay the debts at the end
        (started_paying)

    )

    (:functions
        (total-cost)
    )




    ;############################################### TILE 3 ###############################################

    ;  SHAPE:
    ;
    ;  _____
    ; |_____|
    ;

    (:action place_tile_3
        :parameters (?c - cell ?t - tile_3)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))
            
            ; there must be a cell c2 on the left or on the right with an appropriate tile
            (exists (?c2 - cell)
                (or
                    (and
                        ; c2 is on the left and it connects toward its right
                        (is_right ?c ?c2)
                        (open_right ?c2)
                    )
                    (and
                        ; c2 is on the right and it connects toward its left
                        (is_right ?c2 ?c)
                        (open_left ?c2)
                    )   
                )       
            )
        )

        :effect (and
        
            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its left and its right
            (open_right ?c)
            (open_left ?c)

            (increase (total-cost) 6)
        )
    )

    

    ;############################################### TILE 5 ###############################################

    ;  SHAPE:  
    ;
    ;    ___
    ;   |  _|
    ;   |_|

    (:action place_tile_5
        :parameters (?c - cell ?t - tile_5)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 on the right or below with an appropriate tile
            (exists (?c2 - cell)
                (or
                    (and
                        ; c2 is on the right and it connects toward its left
                        (is_right ?c2 ?c)
                        (open_left ?c2)  
                    )
                    (and
                        ; c2 is below and it connects toward above
                        (is_above ?c ?c2)
                        (open_above ?c2)
                    )
                )
            )
        )

        :effect (and
            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its right and below
            (open_below ?c)
            (open_right ?c)

            (increase (total-cost) 2)       
        )
    )



    ;############################################### TILE 6 ###############################################

    ;  SHAPE:
    ;  
    ;  ___
    ; |_  |
    ;   |_|

    (:action place_tile_6
        :parameters (?c - cell ?t - tile_6)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))
            
            ; there must be a cell c2 on the left or below with an appropriate tile
            (exists (?c2 - cell)
                (or
                    (and
                        ; c2 is on the left and it connects toward its right
                        (is_right ?c ?c2)                     
                        (open_right ?c2)
                    )
                    (and
                        ; c2 is below and it connects toward above
                        (is_above ?c ?c2)
                        (open_above ?c2)
                    )
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its left and below
            (open_below ?c)
            (open_left ?c)

            (increase (total-cost) 2)
        )
    )



    ;############################################### TILE 7 ###############################################

    ;  SHAPE:
    ;
    ;  _____
    ; |_   _|
    ;   |_|

    (:action place_tile_7
        :parameters (?c - cell ?t - tile_7)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 on the left or on the right or below with an appropriate tile
            (exists (?c2 - cell)
                (or
                    ; c2 is on the left and it connects toward its right
                    (and
                        (is_right ?c ?c2)     
                        (open_right ?c2)                     
                    )
                    ; c2 is on the right and it connects toward its left
                    (and
                        (is_right ?c2 ?c)
                        (open_left ?c2)
                    )
                    ; c2 is below and it connects toward above
                    (and
                        (is_above ?c ?c2)
                        (open_above ?c2)
                    )
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its left, right and below
            (open_below ?c)
            (open_left ?c)
            (open_right ?c)

            (increase (total-cost) 8)
        )
    )


    
    ;############################################### TILE 9 ###############################################

    ;  SHAPE:
    ;    _
    ;   | |_
    ;   |___|
    ;

    (:action place_tile_9
        :parameters (?c - cell ?t - tile_9)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 on the right or above with an appropriate tile
            (exists (?c2 - cell)
                (or
                    ; c2 is on the right and it connects toward its left
                    (and
                        (is_right ?c2 ?c)
                        (open_left ?c2)
                    )
                    ; c2 is above and it connects toward below
                    (and
                        (is_above ?c2 ?c)
                        (open_below ?c2)
                    )
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its right and above
            (open_above ?c)
            (open_right ?c)

            (increase (total-cost) 2)
        )
    )


    
    ;############################################### TILE A ###############################################

    ;  SHAPE:
    ;    _
    ;  _| |
    ; |___|
    ;

    (:action place_tile_a
        :parameters (?c - cell ?t - tile_a)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 on the left or above with an appropriate tile
            (exists (?c2 - cell)
                
                (or
                    ; c2 is on the left and it connects toward its right
                    (and
                        (is_right ?c ?c2)
                        (open_right ?c2)
                    )
                    ; c2 is above and it connects toward below
                    (and
                        (is_above ?c2 ?c)
                        (open_below ?c2)
                    )
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its left and above
            (open_above ?c)
            (open_left ?c)
    
            (increase (total-cost) 2)
        )
    )


    
    ;############################################### TILE B ###############################################

    ;  SHAPE:
    ;    _
    ;  _| |_
    ; |_____|
    ;

    (:action place_tile_b
        :parameters (?c - cell ?t - tile_b)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 on the left or on the right or above with an appropriate tile
            (exists (?c2 - cell)
                (or
                    ; c2 is on the left and it connects toward its right
                    (and
                        (is_right ?c ?c2)
                        (open_right ?c2)
                    )
                    ; c2 is on the right and it connects toward its left
                    (and
                        (is_right ?c2 ?c)
                        (open_left ?c2)
                    )
                    ; c2 is above and it connects toward below
                    (and
                        (is_above ?c2 ?c)
                        (open_below ?c2)
                    )
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its left, right and above
            (open_left ?c)
            (open_right ?c)
            (open_above ?c)

            (increase (total-cost) 8)
        )
    )


    
    ;############################################### TILE C ###############################################

    ;  SHAPE:
    ;    _
    ;   | |
    ;   | |
    ;   |_|

    (:action place_tile_c
        :parameters (?c - cell ?t - tile_c)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 above or below with an appropriate tile
            (exists (?c2 - cell)
                (or
                    ; c2 is above and it connects toward below
                    (and
                        (is_above ?c2 ?c)
                        (open_below ?c2)
                    )
                    ; c2 is bellw and it connects toward above
                    (and
                        (is_above ?c ?c2)
                        (open_above ?c2)
                    )   
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells above and below
            (open_above ?c)
            (open_below ?c)

            (increase (total-cost) 6)
        )
    )


    
    ;############################################### TILE D ###############################################

    ;  SHAPE:
    ;    _
    ;   | |_
    ;   |  _|
    ;   |_|

    (:action place_tile_d
        :parameters (?c - cell ?t - tile_d)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 on the right or above or below with an appropriate tile
            (exists (?c2 - cell)
                (or
                    ; c2 is on the right and it connects toward its left
                    (and
                        (is_right ?c2 ?c)
                        (open_left ?c2)
                    )
                    ; c2 is above and it connects toward below
                    (and
                        (is_above ?c2 ?c)
                        (open_below ?c2)
                    )
                    ; c2 is below and it connects toward above
                    (and
                        (is_above ?c ?c2)
                        (open_above ?c2)
                    )
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its right, above and below
            (open_below ?c)
            (open_above ?c)
            (open_right ?c)

            (increase (total-cost) 8)
        )
    )


    
    ;############################################### TILE E ###############################################

    ;  SHAPE:
    ;    _
    ;  _| |
    ; |_  |
    ;   |_|
    
    (:action place_tile_e
        :parameters (?c - cell ?t - tile_e)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 on the left or above or below with an appropriate tile
            (exists (?c2 - cell)
                (or
                    ; c2 is on the left and it connects toward its right
                    (and
                        (is_right ?c ?c2)
                        (open_right ?c2)
                    )
                    ; c2 is above and it connects toward below
                    (and
                        (is_above ?c2 ?c)
                        (open_below ?c2)
                    )
                    ; c2 is below and it connects toward above
                    (and
                        (is_above ?c ?c2)
                        (open_above ?c2)
                    )
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its left, above and below
            (open_left ?c)
            (open_above ?c)
            (open_below ?c)

            (increase (total-cost) 8)               
        )
    )


    
    ;############################################### TILE F ###############################################

    ;  SHAPE:
    ;    _
    ;  _| |_
    ; |_   _|
    ;   |_|

    (:action place_tile_f
        :parameters (?c - cell ?t - tile_f)
        
        :precondition (and

            ; the agent must not have paid any debt yet
            (not (started_paying))

            ; t must not have been used yet
            (not (used ?t))
            
            ; cell c must not have a tile on it
            (not (has_tile ?c))

            ; there must be a cell c2 on the left or on the right or above or below with an appropriate tile
            (exists (?c2 - cell)
                (or
                    ; c2 is on the left and it connects toward its right
                    (and
                        (is_right ?c ?c2)
                        (open_right ?c2)
                    )
                    ; c2 is on the right and it connects toward its left
                    (and
                        (is_right ?c2 ?c)
                        (open_left ?c2)
                    )
                    ; c2 is above and it connects toward below
                    (and
                        (is_above ?c2 ?c)
                        (open_below ?c2)
                    )
                    ; c2 is below and it connects toward above
                    (and
                        (is_above ?c ?c2)
                        (open_above ?c2)
                    )                            
                )
            )
        )

        :effect (and

            ; cell c has tile t, that is not available anymore
            (has_tile ?c)
            (used ?t)

            ; cell c can connect with cells to its left, right, above and below
            (open_above ?c)
            (open_below ?c)
            (open_left ?c)
            (open_right ?c)

            (increase (total-cost) 15)
        )
    )



    ;############################################### OTHER ###############################################


    (:action take_silver
        :parameters (?c - cell ?d - debt)
        
        :precondition (and
            ; cell c must have the silver
            (has_silver ?c)

            ; cell c must already have a tile on it
            (has_tile ?c)

            ; the agent must have debt d
            (has_debt ?d)
        )

        :effect (and
            ; cell c doesn't have a silver anymore
            (not (has_silver ?c))

            ; the agent doesn't have debt d anymore
            (not (has_debt ?d))
            
            ; the agent has started paying the debts
            (started_paying)
        )
    )



    (:action pay_debt
        :parameters (?d - debt)
        
        :precondition (and
            ; the agent must have debt d
            (has_debt ?d)
        )

        :effect (and
            ; the agent doesn't have debt d anymore
            (not (has_debt ?d))

            ; the agent has started paying the debts
            (started_paying)
              
            (increase (total-cost) 15)
        )
    )
)