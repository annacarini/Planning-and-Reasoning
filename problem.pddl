(define (problem progetto-problem1)
    (:domain progetto)
    
    (:objects
        ; GRID:
        ; c1 c2  c3  c4
        ; c5 c6  c7  c8
        ; c9 c10 c11 c12

        ; celle
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - cell

        ; tile 3
        t3_1 t3_2 - tile
        
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
        ; l'obiettivo e' collegare tutti gli ori tra loro, quindi che esista una casella c collegata a tutti
        ; gli ori
        (exists (?c - cell)
            ; la casella deve avere o una tile o un oro, se no in una situazione tipo: |g| |g| risulta gia'
            ; soddisfatto l'obiettivo perche' la casella al centro e' vicina a due caselle con ori
            (and
                (or
                    (exists (?t - tile) (at ?t ?c))
                    (exists (?g - gold) (at ?g ?c))
                )
                (forall (?g - gold)
                    ; o l'oro si trova nella casella c, o la casella c e' collegata all'oro, o una delle caselle
                    ; adiacenti ha l'oro o e' collegata all'oro e c'e' una tile appropriata su c
                    (or
                        (at ?g ?c)
                        (connected ?c ?g)
                        (exists (?c2 - cell)
                            (and
                                ; c2 e' connessa all'oro g o ha l'oro g
                                (or
                                    (connected ?c2 ?g)
                                    (at ?g ?c2)
                                )
                                ; c ha una tile che la collega a c2
                                (exists (?t - tile)
                                    (and
                                        (at ?t ?c)
                                        (or
                                            ; o c2 e' a sx, e t e' di tipo {3, 6, 7, a, b, e, f}
                                            (and
                                                (is_left ?c2 ?c)
                                                (or
                                                    (tile_3 ?t)
                                                    (tile_6 ?t)
                                                    (tile_7 ?t)
                                                    (tile_a ?t)
                                                    (tile_b ?t)
                                                    (tile_e ?t)
                                                    (tile_f ?t)
                                                )
                                            )
                                            ; o c2 e' a dx, e t e' di tipo { 3, 5, 7, 9, b, d, f }
                                            (and
                                                (is_right ?c2 ?c)
                                                (or
                                                    (tile_3 ?t)
                                                    (tile_5 ?t)
                                                    (tile_7 ?t)
                                                    (tile_9 ?t)
                                                    (tile_b ?t)
                                                    (tile_d ?t)
                                                    (tile_f ?t)
                                                )
                                            )
                                            ; o c2 e' sopra, e t e' di tipo { 9, a, b, c, d, e, f }
                                            (and
                                                (is_above ?c2 ?c)
                                                (or
                                                    (tile_9 ?t)
                                                    (tile_a ?t)
                                                    (tile_b ?t)
                                                    (tile_c ?t)
                                                    (tile_d ?t)
                                                    (tile_e ?t)
                                                    (tile_f ?t)
                                                )
                                            )
                                            ; o c2 e' sotto, e t e' di tipo { 5, 6, 7, c, d, e, f }
                                            (and
                                                (is_below ?c2 ?c)
                                                (or
                                                    (tile_5 ?t)
                                                    (tile_6 ?t)
                                                    (tile_7 ?t)
                                                    (tile_c ?t)
                                                    (tile_d ?t)
                                                    (tile_e ?t)
                                                    (tile_f ?t)
                                                )
                                            )
                                        )           
                                    )
                                )
                            )
                        )
                    )
                )
            )            
        )
    )
)

; IDEE:
