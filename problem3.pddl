(define (problem problem3)
	(:domain progetto)
	(:objects
		c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 - cell
		t3_1 t3_2 t3_3 - tile_3
		t5_1 t5_2 - tile_5
		t6_1 t6_2 - tile_6
		t7_1 - tile_7
		t9_1 - tile_9
		ta_1 ta_2 - tile_a
		tb_1 - tile_b
		tc_1 tc_2 tc_3 - tile_c
		te_1 - tile_e
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

		(has_tile c2)
		(open_left c2)
		(open_above c2)
		(open_below c2)
		(open_right c2)

		(has_silver c11)
		(has_silver c5)
		(has_silver c13)

		(has_debt d1)
		(has_debt d2)
		(has_debt d3)

		(= (total-cost) 0)
	)
	(:goal
		(and
			(has_tile c2)
			(has_tile c19)
			(not (has_debt d1))
			(not (has_debt d2))
			(not (has_debt d3))
		)
	)
	(:metric
		minimize (total-cost)
	)
)