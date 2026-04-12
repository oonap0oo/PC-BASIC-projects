5 ' Simplified Bubble Universe for interpreted PC-BASIC K Moerman 2026
10 Dim ATRB%(63): Randomize Timer
20 T! = Rnd * 10: X! = 0: Y! = 0: R! = 2 * 3.1415 / 40
30 Screen 9: Cls: Window (-2! * 4 / 3, -2!)-(2! * 4 / 3, 2!): Key Off
40 For N% = 0 To 63: ATRB%(N%) = N%: Next N%: GoSub 300 ' array w color attr.
100 For S% = 0 To 100 ' outer loop draws shape each iteration
110 A! = R! * S% + T!
120 For P% = 0 To 200 ' inner loop draws point each iteration
130 B! = S% + Y!: C! = A! + X!
140 X! = Sin(B!) + Sin(C!): Y! = Cos(B!) + Cos(C!)
150 If P% > 10 Then PSet (X!, Y!), (S% Mod 15) + 1
160 Next P%: Next S%
200 While InKey$ = "" ' loop changes color attributes with delay
210 GoSub 300: D! = Timer + .7: While D! > Timer: Wend
220 Wend: End
290 ' subroutine to change color attributes keeping background black
300 M% = Rnd * 48: BKG% = ATRB%(M%): ATRB%(M%) = 0
310 Palette Using ATRB%(M%): ATRB%(M%) = BKG%
320 Return
