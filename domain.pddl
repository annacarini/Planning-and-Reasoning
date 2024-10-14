(define (domain progetto)
    (:requirements :strips :typing :disjunctive-preconditions :negative-preconditions :action-costs :equality)

    (:types
        cell - object
        tile - object
        tile_3 tile_5 tile_6 tile_7 tile_9 tile_a tile_b tile_c tile_d tile_e tile_f - tile
        debt - object
    )

    (:predicates
        ; per creare la griglia
        (is_above ?c1 - cell ?c2 - cell)
        (is_right ?c1 - cell ?c2 - cell)

        (has_silver ?c - cell)

        ; per indicare quali tile sono gia' state usate
        (used ?t - tile)

        (has_debt ?d - debt)

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

    (:action place_tile_3
        :parameters (?c - cell ?t - tile_3 ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o a sx ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile a dx
            ; deve essere di tipo { 3, 6, 7, a, b, e, f }
                         
            (not (has_debt ?d))

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
                            (is_right ?c ?c2)
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

            (has_debt ?d)
            
            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

             

            ; segna che abbiamo messo (almeno) una tile
            (first_tile_positioned)

        )

    )

    


    ;############################################### TILE 5 ###############################################

    (:action place_tile_5
        :parameters (?c - cell ?t - tile_5 ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella a dx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }

            (not (has_debt ?d))

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
                            (is_above ?c ?c2)
                            (open_above ?c2)
                        )
                        
                        
                    )
                        
                        
                )

              
            )
        )

        :effect (and
            ; c'e' la tile t su c

            (has_debt ?d)
            
            (has_tile ?c)
            (open_below ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)

             

        
        )
    )



    ;############################################### TILE 6 ###############################################

    (:action place_tile_6
        :parameters (?c - cell ?t - tile_6 ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella a sx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }

            (not (has_debt ?d))

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
                            (is_right ?c ?c2)                     
                            (open_right ?c2)
                        )
                        (and
                            (is_above ?c ?c2)
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

            (has_debt ?d)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)

             

            
        )
    )



    ;############################################### TILE 7 ###############################################


    (:action place_tile_7
        :parameters (?c - cell ?t - tile_7 ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sotto ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            (not (has_debt ?d))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))
    
            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))

               
                    ; deve esserci almeno una cella c2 a sx o dx o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_right ?c ?c2)     
                            (open_right ?c2)                     
                        )
                        (and
                            (is_right ?c2 ?c)
                            (open_left ?c2)
                        )
                        (and
                            (is_above ?c ?c2)
                            (open_above ?c2)
                        )
                        
                        
                        
                    )
                        
                )
                    ; o a sx o dx o sotto ci deve essere un oro o una tile
                  
            )
        )

        :effect (and
            ; c'e' la tile t su c

            (has_debt ?d)
            
            (has_tile ?c)
            (open_below ?c)
            (open_left ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)

             

        
        )
    )


    
    ;############################################### TILE 9 ###############################################


    (:action place_tile_9
        :parameters (?c - cell ?t - tile_9 ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sopra
            ; deve essere: { 5, 6, 7, c, d, e, f }

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            (not (has_debt ?d))
            
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

            (has_debt ?d)
            
            (has_tile ?c)
            (open_above ?c)
            (open_right ?c)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)
            
        )
    )


    
    ;############################################### TILE A ###############################################

    (:action place_tile_a
        :parameters (?c - cell ?t - tile_a ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            (not (has_debt ?d))

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
                            (is_right ?c ?c2)
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

            (has_debt ?d)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)
        )
    )



    
    ;############################################### TILE B ###############################################


    (:action place_tile_b
        :parameters (?c - cell ?t - tile_b ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile a sx deve essere
            ; di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            (not (has_debt ?d))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))

            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
               
                    ; deve esserci almeno una cella c2 a sx o dx o sopra con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_right ?c ?c2)
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

            (has_debt ?d)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)

             
        
           
        )
    )



    
    ;############################################### TILE C ###############################################

    (:action place_tile_c
        :parameters (?c - cell ?t - tile_c ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile sotto deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile sopra
            ; deve essere: { 5, 6, 7, c, d, e, f }


            (not (has_debt ?d))

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
                            (is_above ?c ?c2)
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

            (has_debt ?d)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)

             
        
            
        )
    )


    
    ;############################################### TILE D ###############################################


    (:action place_tile_d
        :parameters (?c - cell ?t - tile_d ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a dx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            (not (has_debt ?d))

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
                            (is_above ?c ?c2)
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

            (has_debt ?d)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)

             
        
           
        )
    )


    
    ;############################################### TILE E ###############################################

    
    (:action place_tile_e
        :parameters (?c - cell ?t - tile_e ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile sotto deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere
            ; di tipo: { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }

            ; t non deve essere gia' stata utilizzata
            (not (used ?t))

            (not (has_debt ?d))
            
            ; non ci deve essere una tile su c
            (not (has_tile ?c))


            (or
                ; o non abbiamo ancora messo nessuna tile
                (not (first_tile_positioned))
            
                
                ; deve esserci almeno una cella a sx o sopra o sotto con un oro o una tile
                (exists (?c2 - cell)
                    
                    (or
                        (and
                            (is_right ?c ?c2)
                            (open_right ?c2)
                        )
                        (and
                            (is_above ?c2 ?c)
                            (open_below ?c2)
                        )
                        (and
                            (is_above ?c ?c2)
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

            (has_debt ?d)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)

             
        
            
        )
    )



    
    ;############################################### TILE F ###############################################


    (:action place_tile_f
        :parameters (?c - cell ?t - tile_f ?d - debt)
        
        :precondition (and
            ; non ci deve essere una tile, in una casella o a sx o dx o sotto o sopra ci deve essere o un oro o una tile,
            ; e se c'e' una tile a dx deve essere di tipo: { 3, 6, 7, a, b, e, f }, se c'e' una tile sotto
            ; deve essere di tipo { 9, a, b, c, d, e, f }, se c'e' una tile a sx deve essere di tipo:
            ; { 3, 5, 7, 9, b, d, f }, se c'e' una tile sopra deve essere: { 5, 6, 7, c, d, e, f }


            (not (has_debt ?d))

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
                            (is_right ?c ?c2)
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
                            (is_above ?c ?c2)
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

            (has_debt ?d)

            ; t e' usata
            (used ?t)

            ; segna che la cella e' ok
              

            (first_tile_positioned)

        )
    )


    ;############################################### ALTRO ###############################################


    (:action take_silver
        :parameters (?c - cell ?d1 ?d2 ?d3 - debt)
        
        :precondition (and
            (has_silver ?c)
            (has_tile ?c)
            (not (= ?d1 ?d2))
            (not (= ?d3 ?d2))
            (not (= ?d3 ?d1))
            (has_debt ?d1)
            (has_debt ?d2)
            (has_debt ?d3)
        )

        :effect (and
            ; hai preso l'argento e i token
            (not (has_silver ?c))
            (not (has_debt ?d1))
            (not (has_debt ?d2))
            (not (has_debt ?d3))
        )
    )

    (:action pay_debt
        :parameters (?d - debt)
        
        :precondition (and
            (has_debt ?d)
        )

        :effect (and
            (not (has_debt ?d))
            (increase (total-cost) 1)
        )
    )

)