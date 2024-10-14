(define (problem problem7)
	(:domain progetto)
	(:objects
		c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 - cell
		t3_1 t3_2 t3_3 t3_4 - tile_3
		t6_1 - tile_6
		t9_1 - tile_9
		ta_1 - tile_a
		tb_1 - tile_b
		tc_1 - tile_c
		tf_1 - tile_f
		d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - debt
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

		(has_silver c15)
		(has_silver c23)

		(= (total-cost) 0)
	)
	(:goal
		(and
			(has_tile c7)
			(has_tile c19)
			(not (has_debt d1))
			(not (has_debt d2))
			(not (has_debt d3))
			(not (has_debt d4))
			(not (has_debt d5))
			(not (has_debt d6))
			(not (has_debt d7))
			(not (has_debt d8))
			(not (has_debt d9))
			(not (has_debt d10))
		)
	)
	(:metric
		minimize (total-cost)
	)
)