(define (domain progetto)
    (:requirements :strips :typing)

    (:types
        cell - object
        tile - object
        gold - object
        silver - object
    )

    (:predicates
        ; per creare la griglia
        (is_above ?c1 - cell ?c2 - cell)
        (is_below ?c1 - cell ?c2 - cell)
        (is_right ?c1 - cell ?c2 - cell)
        (is_left ?c1 - cell ?c2 - cell)

        ; per indicare se una cella e' connessa a un oro
        (connected ?ob - object ?g - gold)
    
        ; per indicare la posizione di: tile, oro, argento
        (at ?ob - object ?c - cell)

        ; non c'e' un modo per verificare i tipi delle tile, quindi usiamo dei predicati
        (tile_3 ?t - tile)
        (tile_5 ?t - tile)
        (tile_6 ?t - tile)
        (tile_7 ?t - tile)
        (tile_9 ?t - tile)
        (tile_a ?t - tile)
        (tile_b ?t - tile)
        (tile_c ?t - tile)
        (tile_d ?t - tile)
        (tile_e ?t - tile)
        (tile_f ?t - tile)

        ; per indicare quali tile sono gia' state usate
        (used ?t - tile)

        ; per ridurre la complessita' delle precondizioni - senza questo predicato non funziona
        (has_tile ?c - cell)

        (has_tile_3 ?c - cell)
        (has_tile_5 ?c - cell)
        (has_tile_6 ?c - cell)
        (has_tile_7 ?c - cell)
        (has_tile_9 ?c - cell)
        (has_tile_a ?c - cell)
        (has_tile_b ?c - cell)
        (has_tile_c ?c - cell)
        (has_tile_d ?c - cell)
        (has_tile_e ?c - cell)
        (has_tile_f ?c - cell)
    )


    ;############################################### TILE 3 ###############################################

    (:action place_tile_3
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o a sx ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile a dx
            ; deve essere di tipo { 3, 6, 7, a, b, e, f }

            ; t deve essere una tile_3
            (tile_3 ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            
            ; deve esserci almeno una cella c2 a dx o a sx con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_left ?c2 ?c)
                        (is_right ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; se una cella c2 e' a dx o a sx e ha una tile, deve essere appropriata
            (forall (?c2 - cell)
                (and
                    ; se sta a sx e ha una tile
                    (imply
                        (and
                            (is_left ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve avere una tile appropriata: { 3, 5, 7, 9, b, d, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_5 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_9 ?c2)
                            (has_tile_b ?c2)
                            (has_tile_d ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                
                    ; se sta a dx e ha una tile
                    (imply
                        (and
                            (is_right ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 3, 6, 7, a, b, e, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )   
                    )
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_3 ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a sx o dx allora per tutti gli ori se la cella e' connessa
            ; a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a sx o a dx
                    (or
                        (is_left ?c2 ?c)
                        (is_right ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                        
                    )
                )              
            )
        )
    )


    ;############################################### TILE 5 ###############################################

    (:action place_tile_5
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella a dx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }

            ; t deve essere una tile_5
            (tile_5 ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            ; deve esserci almeno una cella c2 a dx o sotto con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_right ?c2 ?c)
                        (is_below ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; o a dx o sotto ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a dx e ha una tile
                    (imply
                        (and
                            (is_right ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 3, 6, 7, a, b, e, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )  
                    )
                
                    ; se sta sotto e ha una tile
                    (imply
                        (and
                            (is_below ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve una tile appropriata: { 9, a, b, c, d, e, f }
                        (or
                            (has_tile_9 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_5 ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a dx o sotto allora per tutti gli ori se la cella e' connessa
            ; a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a dx o sotto
                    (or
                        (is_right ?c2 ?c)
                        (is_below ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                        
                    )
                )              
            )
        )
    )



    ;############################################### TILE 6 ###############################################

    (:action place_tile_6
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella a sx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }

            ; t deve essere una tile_6
            (tile_6 ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            
            ; deve esserci almeno una cella c2 a sx o sotto con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_left ?c2 ?c)
                        (is_below ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )


            ; o a sx o sotto ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a sx e ha una tile
                    (imply 
                        (and
                            (is_left ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve avere una tile appropriata: { 3, 5, 7, 9, b, d, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_5 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_9 ?c2)
                            (has_tile_b ?c2)
                            (has_tile_d ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                
                    ; se sta sotto e ha una tile
                    (imply
                        (and
                            (is_below ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve una tile appropriata: { 9, a, b, c, d, e, f }
                        (or
                            (has_tile_9 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_6 ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a sx o sotto allora per tutti gli ori se la cella e' connessa
            ; a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a sx o sotto
                    (or
                        (is_left ?c2 ?c)
                        (is_below ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                        
                    )
                )              
            )
        )
    )



    ;############################################### TILE 7 ###############################################

    (:action place_tile_7
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }

            ; t deve essere una tile_7
            (tile_7 ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
    
            ; deve esserci almeno una cella c2 a sx o dx o sotto con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_left ?c2 ?c)
                        (is_right ?c2 ?c)
                        (is_below ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; o a sx o dx o sotto ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a sx e ha una tile
                    (imply 
                        (and
                            (is_left ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve avere una tile appropriata: { 3, 5, 7, 9, b, d, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_5 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_9 ?c2)
                            (has_tile_b ?c2)
                            (has_tile_d ?c2)
                            (has_tile_f ?c2)
                        )
                    )

                    ; se sta a dx e ha una tile
                    (imply
                        (and
                            (is_right ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 3, 6, 7, a, b, e, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )  
                    )
                
                    ; se sta sotto e ha una tile
                    (imply
                        (and
                            (is_below ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve una tile appropriata: { 9, a, b, c, d, e, f }
                        (or
                            (has_tile_9 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )

                    )
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_7 ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a dx o sotto allora per tutti gli ori se la cella e' connessa
            ; a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a sx, dx o sotto
                    (or
                        (is_left ?c2 ?c)
                        (is_right ?c2 ?c)
                        (is_below ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                    )
                )              
            )
        )
    )


    
    ;############################################### TILE 9 ###############################################

    (:action place_tile_9
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sopra
            ; deve essere: { 5, 6, 7, c, d, e, f }

            ; t deve essere una tile_9
            (tile_9 ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            
            ; deve esserci almeno una cella c2 a dx o sopra con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_right ?c2 ?c)
                        (is_above ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; o a dx o sopra ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a dx e ha una tile
                    (imply
                        (and
                            (is_right ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 3, 6, 7, a, b, e, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )   
                    )
                                  
                    ; se sta sopra e ha una tile
                    (imply
                        (and
                            (is_above ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 5, 6, 7, c, d, e, f }
                        (or
                            (has_tile_5 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )  
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_9 ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a dx o sopra allora per tutti gli ori se la cella e'
            ; connessa a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a dx o sopra
                    (or
                        (is_right ?c2 ?c)
                        (is_above ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                    )
                )              
            )
        )
    )


    
    ;############################################### TILE A ###############################################

    (:action place_tile_a
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ; t deve essere una tile_a
            (tile_a ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            ; deve esserci almeno una cella c2 a sx o sopra con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_left ?c2 ?c)
                        (is_above ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; o a sx o sopra ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a sx e ha una tile
                    (imply 
                        (and
                            (is_left ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve avere una tile appropriata: { 3, 5, 7, 9, b, d, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_5 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_9 ?c2)
                            (has_tile_b ?c2)
                            (has_tile_d ?c2)
                            (has_tile_f ?c2)
                        )
                    )
        
                    ; se sta sopra e ha una tile
                    (imply
                        (and
                            (is_above ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 5, 6, 7, c, d, e, f }
                        (or
                            (has_tile_5 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )  
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_a ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a sx o sopra allora per tutti gli ori se la cella e'
            ; connessa a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a sx o sopra
                    (or
                        (is_left ?c2 ?c)
                        (is_above ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                    )
                )              
            )
        )
    )



    
    ;############################################### TILE B ###############################################

    (:action place_tile_b
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile a sx deve essere
            ; di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ; t deve essere una tile_b
            (tile_b ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            ; deve esserci almeno una cella c2 a sx o dx o sopra con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_left ?c2 ?c)
                        (is_right ?c2 ?c)
                        (is_above ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; o a sx o dx o sopra ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a sx e ha una tile
                    (imply 
                        (and
                            (is_left ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve avere una tile appropriata: { 3, 5, 7, 9, b, d, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_5 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_9 ?c2)
                            (has_tile_b ?c2)
                            (has_tile_d ?c2)
                            (has_tile_f ?c2)
                        )
                    )

                    ; se sta a dx e ha una tile
                    (imply
                        (and
                            (is_right ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 3, 6, 7, a, b, e, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )   
                    )
                    
                    ; se sta sopra e ha una tile
                    (imply
                        (and
                            (is_above ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 5, 6, 7, c, d, e, f }
                        (or
                            (has_tile_5 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )  
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_b ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a dx o sx o sopra allora per tutti gli ori se la cella e'
            ; connessa a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a sx, dx o sopra
                    (or
                        (is_left ?c2 ?c)
                        (is_right ?c2 ?c)
                        (is_above ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                    )
                )              
            )
        )
    )



    
    ;############################################### TILE C ###############################################

    (:action place_tile_c
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile sotto deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile sopra
            ; deve essere: { 5, 6, 7, c, d, e, f }

            ; t deve essere una tile_c
            (tile_c ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            ; deve esserci almeno una cella sopra o sotto con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_above ?c2 ?c)
                        (is_below ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; su ogni cella o sotto o sopra ci deve essere un oro o una tile appropriata
            (forall (?c2 - cell)
                (and
                    ; se sta sotto e ha una tile
                    (imply
                        (and
                            (is_below ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve una tile appropriata: { 9, a, b, c, d, e, f }
                        (or
                            (has_tile_9 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                    
                    ; se sta sopra e ha una tile
                    (imply
                        (and
                            (is_above ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 5, 6, 7, c, d, e, f }
                        (or
                            (has_tile_5 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )   
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_c ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' sotto o sopra allora per tutti gli ori se la cella e'
            ; connessa a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' sotto o sopra
                    (or
                        (is_below ?c2 ?c)
                        (is_above ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                    )
                )              
            )
        )
    )


    
    ;############################################### TILE D ###############################################

    (:action place_tile_d
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ; t deve essere una tile_d
            (tile_d ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            ; deve esserci almeno una cella a dx o sopra o sotto con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_right ?c2 ?c)
                        (is_above ?c2 ?c)
                        (is_below ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )


            ; o a dx o sotto o sopra ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a dx e ha una tile
                    (imply
                        (and
                            (is_right ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 3, 6, 7, a, b, e, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )    
                    )
                
                    ; se sta sotto e ha una tile
                    (imply
                        (and
                            (is_below ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve una tile appropriata: { 9, a, b, c, d, e, f }
                        (or
                            (has_tile_9 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                    
                    ; se sta sopra e ha una tile
                    (imply
                        (and
                            (is_above ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 5, 6, 7, c, d, e, f }
                        (or
                            (has_tile_5 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )  
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_d ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a dx o sotto o sopra allora per tutti gli ori se la cella e'
            ; connessa a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a dx, sotto o sopra
                    (or
                        (is_right ?c2 ?c)
                        (is_below ?c2 ?c)
                        (is_above ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                    )
                )              
            )
        )
    )


    
    ;############################################### TILE E ###############################################

    (:action place_tile_e
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile sotto deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere
            ; di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ; t deve essere una tile_e
            (tile_e ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            ; deve esserci almeno una cella a sx o sopra o sotto con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_left ?c2 ?c)
                        (is_above ?c2 ?c)
                        (is_below ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; o a sx o dx o sotto o sopra ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a sx e ha una tile
                    (imply 
                        (and
                            (is_left ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve avere una tile appropriata: { 3, 5, 7, 9, b, d, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_5 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_9 ?c2)
                            (has_tile_b ?c2)
                            (has_tile_d ?c2)
                            (has_tile_f ?c2)
                        )
                    )

                    ; se sta sotto e ha una tile
                    (imply
                        (and
                            (is_below ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve una tile appropriata: { 9, a, b, c, d, e, f }
                        (or
                            (has_tile_9 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                    
                    ; se sta sopra e ha una tile
                    (imply
                        (and
                            (is_above ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 5, 6, 7, c, d, e, f }
                        (or
                            (has_tile_5 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )  
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_e ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a sx o sotto o sopra allora per tutti gli ori se la cella e'
            ; connessa a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a sx, sotto o sopra
                    (or
                        (is_left ?c2 ?c)
                        (is_below ?c2 ?c)
                        (is_above ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                    )
                )              
            )
        )
    )



    
    ;############################################### TILE F ###############################################

    (:action place_tile_f
        :parameters (?c - cell ?t - tile)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ; t deve essere una tile_f
            (tile_f ?t)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            ; deve esserci almeno una cella a sx o dx o sopra o sotto con un oro o una tile
            (exists (?c2 - cell)
                (and
                    (or
                        (is_left ?c2 ?c)
                        (is_right ?c2 ?c)
                        (is_above ?c2 ?c)
                        (is_below ?c2 ?c)
                    )
                    (or
                        ; o c'e' un oro
                        (exists (?g - gold) (at ?g ?c2))
                        ; o c'e' una tile
                        (has_tile ?c2)
                    )
                )    
            )

            ; o a sx o dx o sotto o sopra ci deve essere un oro o una tile
            (forall (?c2 - cell)
                (and
                    ; se sta a sx e ha una tile
                    (imply 
                        (and
                            (is_left ?c2 ?c)
                            (has_tile ?c2)
                        )
			            ; deve avere una tile appropriata: { 3, 5, 7, 9, b, d, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_5 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_9 ?c2)
                            (has_tile_b ?c2)
                            (has_tile_d ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                
                    ; se sta a dx e ha una tile
                    (imply
                        (and
                            (is_right ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 3, 6, 7, a, b, e, f }
                        (or
                            (has_tile_3 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )    
                    )
                
                    ; se sta sotto e ha una tile
                    (imply
                        (and
                            (is_below ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve una tile appropriata: { 9, a, b, c, d, e, f }
                        (or
                            (has_tile_9 ?c2)
                            (has_tile_a ?c2)
                            (has_tile_b ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )
                    
                    ; se sta sopra e ha una tile
                    (imply
                        (and
                            (is_above ?c2 ?c)
                            (has_tile ?c2)
                        )
                        ; deve essere una tile appropriata: { 5, 6, 7, c, d, e, f }
                        (or
                            (has_tile_5 ?c2)
                            (has_tile_6 ?c2)
                            (has_tile_7 ?c2)
                            (has_tile_c ?c2)
                            (has_tile_d ?c2)
                            (has_tile_e ?c2)
                            (has_tile_f ?c2)
                        )
                    )  
                )
            )
        )

        :effect (and
            ; c'e' la tile t su c
            (at ?t ?c)
            (has_tile ?c)
            (has_tile_f ?c)

            ; t e' usata
            (used ?t)

            ; per tutte le celle, se la cella e' a dx o sx o sotto o sopra allora per tutti gli ori se la cella e'
            ; connessa a quell'oro (o contiene l'oro) anche c vi e' connessa
            (forall (?c2 - cell)      
                
                (when
                    ; se la cella e' a sx, dx o sotto
                    (or
                        (is_left ?c2 ?c)
                        (is_right ?c2 ?c)
                        (is_below ?c2 ?c)
                        (is_above ?c2 ?c)
                    )

                    ; per tutti gli ori
                    (forall (?g - gold)
                        (when
                            ; se la cella c2 e' connessa a quell'oro o lo contiene
                            (or 
                                (connected ?c2 ?g)
                                (at ?g ?c2)
                            )
                            ; allora anche c e' connessa a quell'oro
                            (connected ?c ?g)
                        )
                    )
                )              
            )
        )
    )
)