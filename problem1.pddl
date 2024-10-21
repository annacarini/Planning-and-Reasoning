(define (problem problem1)
	(:domain progetto)
	(:objects
		c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 - cell
		t3_1 t3_2 t3_3 - tile_3
		t5_1 - tile_5
		t6_1 t6_2 - tile_6
		t9_1 t9_2 - tile_9
		ta_1 - tile_a
		tc_1 tc_2 tc_3 - tile_c
		td_1 - tile_d
		tf_1 - tile_f
		d1 d2 d3 - debt
	)
	(:init
		(is_above c1 c6)
		(is_above c2 c7)
		(is_above c3 c8)
		(is_above c4 c9)
		(is_above c5 c10)
		(is_above c6 c11)
		(is_above c7 c12)
		(is_above c8 c13)
		(is_above c9 c14)
		(is_above c10 c15)
		(is_above c11 c16)
		(is_above c12 c17)
		(is_above c13 c18)
		(is_above c14 c19)
		(is_above c15 c20)
		(is_above c16 c21)
		(is_above c17 c22)
		(is_above c18 c23)
		(is_above c19 c24)
		(is_above c20 c25)

		(is_right c2 c1)
		(is_right c3 c2)
		(is_right c4 c3)
		(is_right c5 c4)
		(is_right c7 c6)
		(is_right c8 c7)
		(is_right c9 c8)
		(is_right c10 c9)
		(is_right c12 c11)
		(is_right c13 c12)
		(is_right c14 c13)
		(is_right c15 c14)
		(is_right c17 c16)
		(is_right c18 c17)
		(is_right c19 c18)
		(is_right c20 c19)
		(is_right c22 c21)
		(is_right c23 c22)
		(is_right c24 c23)
		(is_right c25 c24)

		(has_tile c10)
		(open_left c10)
		(open_above c10)
		(open_below c10)
		(open_right c10)

		(has_silver c3)
		(has_silver c11)
		(has_silver c24)

		(has_debt d1)
		(has_debt d2)
		(has_debt d3)

		(= (total-cost) 0)
	)
	(:goal
		(and
			(has_tile c10)
			(has_tile c2)
			(has_tile c18)
			(not (has_debt d1))
			(not (has_debt d2))
			(not (has_debt d3))
		)
	)
	(:metric
		minimize (total-cost)
	)
)