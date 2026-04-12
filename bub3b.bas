5 ' Simpified Bubble Universe for interpreted PC-BASIC K Moermzn 2026
10 DIM ATRB%(63): RANDOMIZE TIMER
20 T! = RND * 10: X! = 0: Y! = 0: R! = 2 * 3.1415 / 40
30 SCREEN 9: CLS: WINDOW (-2! * 4 / 3, -2!)-(2! * 4 / 3, 2!): KEY OFF
40 FOR N% = 0 TO 63: ATRB%(N%) = N%: NEXT N%: GOSUB 300 ' array w color attr.
100 FOR S% = 0 TO 100 ' outer loop draws shape each iteration
110 A! = R! * S% + T!
120 FOR P% = 0 TO 200 ' inner loop draws point each iteration
130 B! = S% + Y!: C! = A! + X!
140 X! = SIN(B!) + SIN(C!): Y! = COS(B!) + COS(C!)
150 IF P%>10 THEN PSET (X!, Y!), (S% MOD 15) + 1
160 NEXT P%: NEXT S%
200 WHILE INKEY$ = "" ' loop changes color attributes with delay
210 GOSUB 300: D! = TIMER + .7: WHILE D! > TIMER: WEND
220 WEND: END
290 ' subroutine to change color attributes keeping background black
300 M% = RND * 48: BKG% = ATRB%(M%): ATRB%(M%) = 0
310 PALETTE USING ATRB%(M%): ATRB%(M%) = BKG%
320 RETURN
