(define (problem problem0)
	(:domain progetto)
	(:objects
		c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - cell
		t3_1 t3_2 t3_3 t3_4 t3_5 - tile_3
		t7_1 - tile_7
		ta_1 - tile_a
		tc_1 tc_2 - tile_c
		tk1 tk2 tk3 tk4 tk5 tk6 - token
	)
	(:init
		(is_above c1 c5)
		(is_above c2 c6)
		(is_above c3 c7)
		(is_above c4 c8)
		(is_above c5 c9)
		(is_above c6 c10)
		(is_above c7 c11)
		(is_above c8 c12)

		(is_right c2 c1)
		(is_right c3 c2)
		(is_right c4 c3)
		(is_right c6 c5)
		(is_right c7 c6)
		(is_right c8 c7)
		(is_right c10 c9)
		(is_right c11 c10)
		(is_right c12 c11)

		(has_silver c6)
		(has_silver c7)

		(= (total-cost) 0)
	)
	(:goal
		(and
			(has_tile c1)
			(has_tile c4)
			(has_tile c9)
			(has_tile c11)

			(or
				(has_silver c6)
				(has_tile c6)
			)
			(or
				(has_silver c7)
				(has_tile c7)
			)
		)
	)
	(:metric
		minimize (total-cost)
	)
)