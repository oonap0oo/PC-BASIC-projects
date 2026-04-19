5 ' 3D Sphere with Back-Face Culling for hidden line removal  K Moerman 2026
10 DefInt K, N
20 PI = 4 * Atn(1): R = 190: N1 = 14: N2 = 20:  ROT2 = -PI / 8: Dim XP(N1), ZP(N1)
30 DA1 = 2 * PI / N1: DA2 = 2 * PI / N2: ASPX = 640 / 200 * 3 / 4: AF = 2 * PI / N2
35 For KG = 0 To 3
40 RS = AF * KG / 4
50 Screen 8, , KG: Cls '640x200 pixels
60 ROT2COS = Cos(ROT2): ROT2SIN = Sin(ROT2)
70 Circle (320, 100), R, 15
80 For A2 = 0 To 2 * PI + 2 * PI / N2 Step 2 * PI / N2
90 K1 = 0: FIRST = 0
100 For A1 = 0 To PI + PI / N1 Step PI / N1
110 Y = R * Sin(A1) * Sin(A2 + RS)
120 Z = R * Cos(A1)
130 X = R * Sin(A1) * Cos(A2 + RS)
140 ZR = ROT2COS * Z - ROT2SIN * Y: ZR = ZR / ASPX
150 YR = ROT2SIN * Z + ROT2COS * Y
160 If YR >= 0 Then GoSub 310
170 XP(K1) = X: ZP(K1) = ZR: K1 = K1 + 1
180 Next A1: Next A2
185 Next KG
190 For KG = 0 To 3
200 Screen 8, , , KG
210 PT = Timer + .5:
220 If Timer < PT Then GoTo 220
260 Next KG
270 GoTo 190
300 ' Subroutine for drawing
310 If FIRST = 0 Then GoTo 340
320 Line -(320 + X, 100 + ZR), 15
330 If A2 > 0 Then Line -(320 + XP(K1), 100 + ZP(K1)), 15
340 FIRST = 1: PReset (320 + X, 100 + ZR)
350 Return
