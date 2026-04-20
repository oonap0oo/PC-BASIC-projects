10 ' 3D Sphere with Back-Face Culling for hidden line removal  K Moerman 2026
20 DefInt K, N: PI = 4 * Atn(1): Key Off
30 R = 190: N1 = 12: N2 = 24: Dim XP(N1), ZP(N1)
40 DA1 = PI / N1: DA2 = 2 * PI / N2: ASPX = 640 / 200 * 3 / 4
50 ROT2 = -PI / 4: ROT2COS = Cos(ROT2): ROT2SIN = Sin(ROT2)
60 For KG = 0 To 3
70 ROT = DA2 * KG / 4 'horizontal rotation angle
80 Screen 8, , KG: Color 10: Cls '640x200 pixels, 4 pages
90 Locate 1, 6: Print "3D Sphere with hidden line removal"
100 Locate 2, 6: Print "Drawing page "; Str$(KG)
110 Circle (320, 100), R, 10
120 For A2 = 0 To 2 * PI Step DA2 'angle horizontal plane
130 K1 = 0: KFIRST = 0
140 For A1 = 0 To PI Step DA1 'angle vertical plane
150 Y = R * Sin(A1) * Sin(A2 + ROT) 'spherical coord. to carth.
160 Z = R * Cos(A1)
170 X = R * Sin(A1) * Cos(A2 + ROT)
180 ZR = ROT2COS * Z - ROT2SIN * Y: ZR = ZR / ASPX 'rotate verti. for viewing
190 YR = ROT2SIN * Z + ROT2COS * Y
200 If YR >= -R / 10 Then GoSub 330 'if lines are not hidden
210 XP(K1) = X: ZP(K1) = ZR: K1 = K1 + 1
220 Next A1: Next A2
230 Locate 2, 6: Print Space$(20): Next KG
240 ' Animation by cycling through pages
250 For KG = 0 To 3
260 Screen 8, , , KG: PT = Timer + .4
280 If InKey$ <> "" Then GoTo 380
290 If Timer < PT Then GoTo 280
300 Next KG: GoTo 250
320 ' Subroutine for drawing
330 If KFIRST = 0 Then GoTo 360
340 Line -(320 + X, 100 + ZR), 10
350 If A2 > 0 Then Line -(320 + XP(K1), 100 + ZP(K1)), 10
360 KFIRST = -1: PReset (320 + X, 100 + ZR)
370 Return
380 Screen 8, , 0, 0: End 'set correct page before exit
