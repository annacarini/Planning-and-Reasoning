(define (problem problema)
    (:domain progetto)
    
    (:objects
        ; GRID:
        ; c1 c2  c3  c4
        ; c5 c6  c7  c8
        ; c9 c10 c11 c12

        ; celle
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - cell

        ; tile 3
        t3_1 t3_2 t3_3 t3_4 t3_5- tile
        
        ; tile 7
        t7_1 - tile

        ; tile a
        ta_1 - tile

        ; tile c
        tc_1 tc_2 - tile

        ; ori
        g1 g2 g3 g4 - gold
    )

    (:init
        ; GRID
        (is_above c1 c5)
        (is_above c2 c6)
        (is_above c3 c7)
        (is_above c4 c8)
        (is_above c5 c9)
        (is_above c6 c10)
        (is_above c7 c11)
        (is_above c8 c12)

        (is_below c5 c1)
        (is_below c6 c2)
        (is_below c7 c3)
        (is_below c8 c4)
        (is_below c9 c5)
        (is_below c10 c6)
        (is_below c11 c7)
        (is_below c12 c8)

        (is_left c1 c2)
        (is_left c2 c3)
        (is_left c3 c4)       
        (is_left c5 c6)
        (is_left c6 c7)       
        (is_left c7 c8)
        (is_left c9 c10)
        (is_left c10 c11)
        (is_left c11 c12)

        (is_right c2 c1)
        (is_right c3 c2)
        (is_right c4 c3)
        (is_right c6 c5)
        (is_right c7 c6)
        (is_right c8 c7)
        (is_right c10 c9)
        (is_right c11 c10)
        (is_right c12 c11)

        ; TILE TYPES
        (tile_3 t3_1)
        (tile_3 t3_2)
        (tile_3 t3_3)
        (tile_3 t3_4)
        (tile_3 t3_5)
        (tile_7 t7_1)
        (tile_a ta_1)
        (tile_c tc_1)
        (tile_c tc_2)

        ; posizioni degli ori
        (at g1 c1)
        (at g2 c4)
        (at g3 c9)
        (at g4 c11)
    )

    (:goal
        ; l'obiettivo e' collegare tutti gli ori tra loro, per come sono costituite le azioni basta che su ogni cella con un oro ci sia posizionata una tile
        ( forall (?c - cell)
            (imply
                (exists
                    (?g - gold)
                    (at ?g ?c)
                )
                (has_tile ?c)
            )
        )
    )
)

