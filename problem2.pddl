(define (problem problem2)
	(:domain progetto)
	(:objects
		c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 - cell
		t3_1 t3_2 t3_3 t3_4 - tile_3
		t5_1 t5_2 t5_3 t5_4 t5_5 t5_6 - tile_5
		t6_1 t6_2 t6_3 t6_4 t6_5 t6_6 - tile_6
		t7_1 t7_2 t7_3 t7_4 t7_5 - tile_7
		t9_1 t9_2 t9_3 t9_4 t9_5 t9_6 t9_7 - tile_9
		ta_1 ta_2 ta_3 ta_4 ta_5 ta_6 ta_7 - tile_a
		tb_1 tb_2 tb_3 tb_4 tb_5 - tile_b
		tc_1 tc_2 tc_3 tc_4 tc_5 - tile_c
		td_1 td_2 td_3 td_4 td_5 - tile_d
		te_1 te_2 te_3 te_4 te_5 - tile_e
		tf_1 tf_2 tf_3 - tile_f
		tk1 tk2 tk3 tk4 tk5 tk6 tk7 tk8 tk9 tk10 tk11 tk12 - token
	)
	(:init
		(is_above c1 c8)
		(is_above c2 c9)
		(is_above c3 c10)
		(is_above c4 c11)
		(is_above c5 c12)
		(is_above c6 c13)
		(is_above c7 c14)
		(is_above c8 c15)
		(is_above c9 c16)
		(is_above c10 c17)
		(is_above c11 c18)
		(is_above c12 c19)
		(is_above c13 c20)
		(is_above c14 c21)
		(is_above c15 c22)
		(is_above c16 c23)
		(is_above c17 c24)
		(is_above c18 c25)
		(is_above c19 c26)
		(is_above c20 c27)
		(is_above c21 c28)
		(is_above c22 c29)
		(is_above c23 c30)
		(is_above c24 c31)
		(is_above c25 c32)
		(is_above c26 c33)
		(is_above c27 c34)
		(is_above c28 c35)
		(is_above c29 c36)
		(is_above c30 c37)
		(is_above c31 c38)
		(is_above c32 c39)
		(is_above c33 c40)
		(is_above c34 c41)
		(is_above c35 c42)

		(is_right c2 c1)
		(is_right c3 c2)
		(is_right c4 c3)
		(is_right c5 c4)
		(is_right c6 c5)
		(is_right c7 c6)
		(is_right c9 c8)
		(is_right c10 c9)
		(is_right c11 c10)
		(is_right c12 c11)
		(is_right c13 c12)
		(is_right c14 c13)
		(is_right c16 c15)
		(is_right c17 c16)
		(is_right c18 c17)
		(is_right c19 c18)
		(is_right c20 c19)
		(is_right c21 c20)
		(is_right c23 c22)
		(is_right c24 c23)
		(is_right c25 c24)
		(is_right c26 c25)
		(is_right c27 c26)
		(is_right c28 c27)
		(is_right c30 c29)
		(is_right c31 c30)
		(is_right c32 c31)
		(is_right c33 c32)
		(is_right c34 c33)
		(is_right c35 c34)
		(is_right c37 c36)
		(is_right c38 c37)
		(is_right c39 c38)
		(is_right c40 c39)
		(is_right c41 c40)
		(is_right c42 c41)

		(has_silver c33)
		(has_silver c31)
		(has_silver c8)
		(has_silver c20)

		(cell_is_ok c33)
		(cell_is_ok c31)
		(cell_is_ok c8)
		(cell_is_ok c20)

		(= (total-cost) 0)
	)
	(:goal
		(and
			(has_tile c19)
			(has_tile c28)
			(has_tile c42)

			(cell_is_ok c33)
			(cell_is_ok c31)
			(cell_is_ok c8)
			(cell_is_ok c20)
		)
	)
	(:metric
		minimize (total-cost)
	)
)