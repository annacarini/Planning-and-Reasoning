(define (problem problem5)
	(:domain progetto)
	(:objects
		c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 - cell
		t3_1 t3_2 t3_3 t3_4 t3_5 - tile_3
		t5_1 t5_2 t5_3 t5_4 - tile_5
		t6_1 t6_2 t6_3 t6_4 t6_5 t6_6 t6_7 - tile_6
		t7_1 t7_2 t7_3 t7_4 t7_5 t7_6 - tile_7
		t9_1 t9_2 t9_3 t9_4 t9_5 t9_6 - tile_9
		ta_1 ta_2 ta_3 ta_4 - tile_a
		tb_1 tb_2 tb_3 tb_4 tb_5 - tile_b
		tc_1 tc_2 tc_3 tc_4 tc_5 tc_6 - tile_c
		td_1 td_2 td_3 td_4 td_5 - tile_d
		te_1 te_2 te_3 te_4 te_5 te_6 te_7 - tile_e
		tf_1 tf_2 tf_3 tf_4 - tile_f
	)
	(:init
		(is_above c1 c7)
		(is_above c2 c8)
		(is_above c3 c9)
		(is_above c4 c10)
		(is_above c5 c11)
		(is_above c6 c12)
		(is_above c7 c13)
		(is_above c8 c14)
		(is_above c9 c15)
		(is_above c10 c16)
		(is_above c11 c17)
		(is_above c12 c18)
		(is_above c13 c19)
		(is_above c14 c20)
		(is_above c15 c21)
		(is_above c16 c22)
		(is_above c17 c23)
		(is_above c18 c24)
		(is_above c19 c25)
		(is_above c20 c26)
		(is_above c21 c27)
		(is_above c22 c28)
		(is_above c23 c29)
		(is_above c24 c30)
		(is_above c25 c31)
		(is_above c26 c32)
		(is_above c27 c33)
		(is_above c28 c34)
		(is_above c29 c35)
		(is_above c30 c36)
		(is_above c31 c37)
		(is_above c32 c38)
		(is_above c33 c39)
		(is_above c34 c40)
		(is_above c35 c41)
		(is_above c36 c42)
		(is_above c37 c43)
		(is_above c38 c44)
		(is_above c39 c45)
		(is_above c40 c46)
		(is_above c41 c47)
		(is_above c42 c48)
		(is_above c43 c49)
		(is_above c44 c50)
		(is_above c45 c51)
		(is_above c46 c52)
		(is_above c47 c53)
		(is_above c48 c54)
		(is_above c49 c55)
		(is_above c50 c56)
		(is_above c51 c57)
		(is_above c52 c58)
		(is_above c53 c59)
		(is_above c54 c60)
		(is_above c55 c61)
		(is_above c56 c62)
		(is_above c57 c63)
		(is_above c58 c64)
		(is_above c59 c65)
		(is_above c60 c66)
		(is_above c61 c67)
		(is_above c62 c68)
		(is_above c63 c69)
		(is_above c64 c70)
		(is_above c65 c71)
		(is_above c66 c72)

		(is_right c2 c1)
		(is_right c3 c2)
		(is_right c4 c3)
		(is_right c5 c4)
		(is_right c6 c5)
		(is_right c8 c7)
		(is_right c9 c8)
		(is_right c10 c9)
		(is_right c11 c10)
		(is_right c12 c11)
		(is_right c14 c13)
		(is_right c15 c14)
		(is_right c16 c15)
		(is_right c17 c16)
		(is_right c18 c17)
		(is_right c20 c19)
		(is_right c21 c20)
		(is_right c22 c21)
		(is_right c23 c22)
		(is_right c24 c23)
		(is_right c26 c25)
		(is_right c27 c26)
		(is_right c28 c27)
		(is_right c29 c28)
		(is_right c30 c29)
		(is_right c32 c31)
		(is_right c33 c32)
		(is_right c34 c33)
		(is_right c35 c34)
		(is_right c36 c35)
		(is_right c38 c37)
		(is_right c39 c38)
		(is_right c40 c39)
		(is_right c41 c40)
		(is_right c42 c41)
		(is_right c44 c43)
		(is_right c45 c44)
		(is_right c46 c45)
		(is_right c47 c46)
		(is_right c48 c47)
		(is_right c50 c49)
		(is_right c51 c50)
		(is_right c52 c51)
		(is_right c53 c52)
		(is_right c54 c53)
		(is_right c56 c55)
		(is_right c57 c56)
		(is_right c58 c57)
		(is_right c59 c58)
		(is_right c60 c59)
		(is_right c62 c61)
		(is_right c63 c62)
		(is_right c64 c63)
		(is_right c65 c64)
		(is_right c66 c65)
		(is_right c68 c67)
		(is_right c69 c68)
		(is_right c70 c69)
		(is_right c71 c70)
		(is_right c72 c71)


		(= (total-cost) 0)
	)
	(:goal
		(and
			(has_tile c14)
			(has_tile c40)
			(has_tile c66)
		)
	)
	(:metric
		minimize (total-cost)
	)
)