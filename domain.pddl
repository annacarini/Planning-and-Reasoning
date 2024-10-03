(define (domain progetto)
    (:requirements :strips :typing :disjunctive-preconditions :negative-preconditions :action-costs)

    (:types
        cell - object
        tile - object
        tile_3 tile_5 tile_6 tile_7 tile_9 tile_a tile_b tile_c tile_d tile_e tile_f - tile
        token - object
    )

    (:predicates
        ; per creare la griglia
        (is_above ?c1 - cell ?c2 - cell)
        (is_below ?c1 - cell ?c2 - cell)
        (is_right ?c1 - cell ?c2 - cell)
        (is_left ?c1 - cell ?c2 - cell)

        (has_silver ?c - cell)

        ; una cella e' ok se non ha mai avuto un argento, o aveva un argento che non e' stato preso,
        ; o aveva un argento che e' stato preso ma sulla cella e' stata messa una tile.
        ; tutte le celle partono "ok". poi se prendi un argento da una cella, viene messa a "non ok" fino
        ; a che non ci metti una tile, a meno che non ci fosse gia' la tile
        (cell_is_ok ?c - cell)
        

        ; per indicare quali tile sono gia' state usate
        (used ?t - tile)

        (has_token ?tk - token)

        ; per ridurre la complessita' delle precondizioni - senza questo predicato non funziona
        (has_tile ?c - cell)

        (open_left ?c - cell)
        (open_right ?c - cell)
        (open_above ?c - cell)
        (open_below ?c - cell)


        ; per indicare se abbiamo messo la prima tile
        (first_tile_positioned)

    )

    (:functions
        (total-cost)
    )


    ;############################################### TILE 3 ###############################################

    ; place not on silver

    (:action place_tile_3
        :parameters (?c - cell ?t - tile_3)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o a sx ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile a dx
            ; deve essere di tipo { 3, 6, 7, a, b, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            
            ; deve esserci almeno una cella c2 a dx o a sx con un oro o una tile
            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

                ; oppure c'e' una cella o a dx o a sx che ha una tile, e se ci sono celle a dx o sx con tile
                ; devono essere tile appropriate
            
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        
                    )
                        
                        
                )
                    ; se una cella c2 e' a dx o a sx e ha una tile, deve essere appropriata
                
            )

        )

        :effect (and
        
            (has_tile ?c)
            (open_right ?c)
            (open_left ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (increase (total-cost) 30)

            ; segna che abbiamo messo (almeno) una tile
            (first_tile_positioned)

        )

    )

    ; place has token 

    (:action place_tile_3_with_token
        :parameters (?c - cell ?t - tile_3 ?tk)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o a sx ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile a dx
            ; deve essere di tipo { 3, 6, 7, a, b, e, f }
                         
            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            (has_token ?tk)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            
            ; deve esserci almeno una cella c2 a dx o a sx con un oro o una tile
            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

                ; oppure c'e' una cella o a dx o a sx che ha una tile, e se ci sono celle a dx o sx con tile
                ; devono essere tile appropriate
            
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        
                    )
                        
                        
                )
                    ; se una cella c2 e' a dx o a sx e ha una tile, deve essere appropriata
                
            )

        )

        :effect (and
        
            (has_tile ?c)
            (open_right ?c)
            (open_left ?c)

            (not (has_token ?tk))
            
            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (increase (total-cost) 0)

            ; segna che abbiamo messo (almeno) una tile
            (first_tile_positioned)

        )

    )

    


    ;############################################### TILE 5 ###############################################

    (:action place_tile_5
        :parameters (?c - cell ?t - tile_5)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella a dx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))
            
            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            ; non ci deve essere una tile su c
            (not (has_tile ?c))


            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

               
                    ; deve esserci almeno una cella c2 a dx o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)  
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                    )
                        
                        
                )

              
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_below ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 10)

        
        )
    )


    (:action place_tile_5_with_token
        :parameters (?c - cell ?t - tile_5 ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella a dx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            (has_token ?tk)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))


            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

               
                    ; deve esserci almeno una cella c2 a dx o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)  
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                    )
                        
                        
                )

              
            )
        )

        :effect (and
            ; c'e' la tile t su c

            (not (has_token ?tk))
            
            (has_tile ?c)
            (open_below ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)

        
        )
    )



    ;############################################### TILE 6 ###############################################

    (:action place_tile_6
        :parameters (?c - cell ?t - tile_6)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella a sx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

                
                    ; deve esserci almeno una cella c2 a sx o sotto con un oro o una tile
                (exists (?c2 - cell)
                
                    (or
                        (and
                            (is_left ?c2 ?c)                     
                            (open_right ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                    )
                        
                )
                   
                
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_below ?c)
            (open_left ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 10)

            
        )
    )

    (:action place_tile_6_with_token
        :parameters (?c - cell ?t - tile_6 ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella a sx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            (has_token ?tk)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

                
                    ; deve esserci almeno una cella c2 a sx o sotto con un oro o una tile
                (exists (?c2 - cell)
                
                    (or
                        (and
                            (is_left ?c2 ?c)                     
                            (open_right ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                    )
                        
                )
                   
                
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_below ?c)
            (open_left ?c)

            (not (has_token ?tk))

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)

            
        )
    )



    ;############################################### TILE 7 ###############################################

    (:action place_tile_7
        :parameters (?c - cell ?t - tile_7)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))
            
            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            ; non ci deve essere una tile su c
            (not (has_tile ?c))
    
            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

               
                    ; deve esserci almeno una cella c2 a sx o dx o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)     
                            (open_right ?c2)                     
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                        
                    )
                        
                )
                    ; o a sx o dx o sotto ci deve essere un oro o una tile
                  
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_below ?c)
            (open_left ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 40)

        
        )
    )


    (:action place_tile_7_with_token
        :parameters (?c - cell ?t - tile_7 ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            (has_token ?tk)
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
    
            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

               
                    ; deve esserci almeno una cella c2 a sx o dx o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)     
                            (open_right ?c2)                     
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                        
                    )
                        
                )
                    ; o a sx o dx o sotto ci deve essere un oro o una tile
                  
            )
        )

        :effect (and
            ; c'e' la tile t su c

            (not (has_token ?tk))
            
            (has_tile ?c)
            (open_below ?c)
            (open_left ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)

        
        )
    )


    
    ;############################################### TILE 9 ###############################################

    (:action place_tile_9
        :parameters (?c - cell ?t - tile_9)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sopra
            ; deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

                
                    ; deve esserci almeno una cella c2 a dx o sopra con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or

                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        
                    )
                    
                )
                    ; o a dx o sopra ci deve essere un oro o una tile
                   
                
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_above ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 10)
        
            
        )
    )


    (:action place_tile_9_with_token
        :parameters (?c - cell ?t - tile_9 ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sopra
            ; deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            (has_token ?tk)
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
            

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

                
                    ; deve esserci almeno una cella c2 a dx o sopra con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or

                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        
                    )
                    
                )
                    ; o a dx o sopra ci deve essere un oro o una tile
                   
                
            )
        )

        :effect (and
            ; c'e' la tile t su c

            (not (has_token ?tk))
            
            (has_tile ?c)
            (open_above ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)
        
            
        )
    )


    
    ;############################################### TILE A ###############################################

    (:action place_tile_a
        :parameters (?c - cell ?t - tile_a)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

                
                    ; deve esserci almeno una cella c2 a sx o sopra con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        
                    )
                        
                )
                    ; o a sx o sopra ci deve essere un oro o una tile
                    
                
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_above ?c)
            (open_left ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 10)

            
        )
    )

    (:action place_tile_a_with_token
        :parameters (?c - cell ?t - tile_a ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            (has_token ?tk)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

                
                    ; deve esserci almeno una cella c2 a sx o sopra con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        
                    )
                        
                )
                    ; o a sx o sopra ci deve essere un oro o una tile
                    
                
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_above ?c)
            (open_left ?c)

            (not (has_token ?tk))

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)

            
        )
    )



    
    ;############################################### TILE B ###############################################

    (:action place_tile_b
        :parameters (?c - cell ?t - tile_b)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile a sx deve essere
            ; di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
               
                    ; deve esserci almeno una cella c2 a sx o dx o sopra con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        
                            
                    )
                        
                )
                    ; o a sx o dx o sopra ci deve essere un oro o una tile
                   
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_left ?c)
            (open_right ?c)
            (open_above ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 40)
        
           
        )
    )

    (:action place_tile_b_with_token
        :parameters (?c - cell ?t - tile_b ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile a sx deve essere
            ; di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            (has_token ?tk)
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
               
                    ; deve esserci almeno una cella c2 a sx o dx o sopra con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        
                            
                    )
                        
                )
                    ; o a sx o dx o sopra ci deve essere un oro o una tile
                   
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_left ?c)
            (open_right ?c)
            (open_above ?c)

            (not (has_token ?tk))

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)
        
           
        )
    )



    
    ;############################################### TILE C ###############################################

    (:action place_tile_c
        :parameters (?c - cell ?t - tile_c)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile sotto deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile sopra
            ; deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
               
                    ; deve esserci almeno una cella sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                    )
                        
                )
                    ; su ogni cella o sotto o sopra ci deve essere un oro o una tile appropriata
                    
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_above ?c)
            (open_below ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 30)
        
            
        )
    )

    (:action place_tile_c_with_token
        :parameters (?c - cell ?t - tile_c ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile sotto deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile sopra
            ; deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            (has_token ?tk)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
               
                    ; deve esserci almeno una cella sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                    )
                        
                )
                    ; su ogni cella o sotto o sopra ci deve essere un oro o una tile appropriata
                    
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_above ?c)
            (open_below ?c)

            (not (has_token ?tk))

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)
        
            
        )
    )


    
    ;############################################### TILE D ###############################################

    (:action place_tile_d
        :parameters (?c - cell ?t - tile_d)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
                
                    ; deve esserci almeno una cella a dx o sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                    )
                            
                )
                    ; o a dx o sotto o sopra ci deve essere un oro o una tile
                    
                       
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_below ?c)
            (open_above ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 40)
        
           
        )
    )


    (:action place_tile_d_with_token
        :parameters (?c - cell ?t - tile_d ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            (has_token ?tk)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
                
                    ; deve esserci almeno una cella a dx o sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                    )
                            
                )
                    ; o a dx o sotto o sopra ci deve essere un oro o una tile
                    
                       
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_below ?c)
            (open_above ?c)
            (open_right ?c)

            (not (has_token ?tk))

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)
        
           
        )
    )


    
    ;############################################### TILE E ###############################################

    

    (:action place_tile_e
        :parameters (?c - cell ?t - tile_e)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile sotto deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere
            ; di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))


            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
                
                ; deve esserci almeno una cella a sx o sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                        
                    )
                            
                )

                    ; o a sx o dx o sotto o sopra ci deve essere un oro o una tile
                   
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_left ?c)
            (open_above ?c)
            (open_below ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 40)
        
            
        )
    )

    (:action place_tile_e_with_token
        :parameters (?c - cell ?t - tile_e ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile sotto deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere
            ; di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            (has_token ?tk)
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))


            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
                
                ; deve esserci almeno una cella a sx o sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                        
                    )
                            
                )

                    ; o a sx o dx o sotto o sopra ci deve essere un oro o una tile
                   
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_left ?c)
            (open_above ?c)
            (open_below ?c)

            (not (has_token ?tk))

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)
        
            
        )
    )



    
    ;############################################### TILE F ###############################################

    (:action place_tile_f
        :parameters (?c - cell ?t - tile_f)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ; t deve essere una tile_f
            
            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))


            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
                
                    ; deve esserci almeno una cella a sx o dx o sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                    )
                            
                )
                ; o a sx o dx o sotto o sopra ci deve essere un oro o una tile
                   
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_above ?c)
            (open_below ?c)
            (open_left ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 75)
        
        
        )
    )

    (:action place_tile_f_with_token
        :parameters (?c - cell ?t - tile_f ?tk - token)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ;(not (silvers_validated))
            ;(not (has_silver ?c))

            (has_token ?tk)

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))


            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
                
                    ; deve esserci almeno una cella a sx o dx o sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                
                    (or
                        (and
                            (is_left ?c2 ?c)
                            (open_right ?c2)
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_below ?c2 ?c)
                            (open_above ?c2)
                        )
                        
                        
                    )
                            
                )
                ; o a sx o dx o sotto o sopra ci deve essere un oro o una tile
                   
            )
        )

        :effect (and
            ; c'e' la tile t su c
            
            (has_tile ?c)
            (open_above ?c)
            (open_below ?c)
            (open_left ?c)
            (open_right ?c)

            (not (has_token ?tk))

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
            (cell_is_ok ?c)

            (first_tile_positioned)

            (increase (total-cost) 0)
        
        
        )
    )


    ;############################################### ALTRO ###############################################


    (:action take_silver_no_tile
        :parameters (?c - cell ?tk1 ?tk2 ?tk3 - token)
        
        :precondition (and
            (not (has_tile ?c))
            (has_silver ?c)
            (not (has_token ?tk1))
            (not (has_token ?tk2))
            (not (has_token ?tk3))
        )

        :effect (and
            ; hai preso l'argento e i token
            (not (has_silver ?c))
            (has_token ?tk1)
            (has_token ?tk2)
            (has_token ?tk3)

            ; visto che non c'e' gia' una tile su questa cella, metti che la cella non e' ok
            (not (cell_is_ok ?c))

            (increase (total-cost) 0)    
        )
    )

    (:action take_silver_tile_already_there
        :parameters (?c - cell ?tk1 ?tk2 ?tk3 - token)
        
        :precondition (and
            (has_silver ?c)
            (has_tile ?c)
            (not (has_token ?tk1))
            (not (has_token ?tk2))
            (not (has_token ?tk3))
        )

        :effect (and
            ; hai preso l'argento e i token
            (not (has_silver ?c))
            (has_token ?tk1)
            (has_token ?tk2)
            (has_token ?tk3)

            (increase (total-cost) 0)    
        )
    )
)