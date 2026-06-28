10 ' String art for PC-BASIC   K Moerman 2026
20 W% = 640: H% = 350: W2% = W% / 2: H2% = H% / 2
30 PI = 3.14159: RAD2DEG = 180 / PI
40 NPOINTS% = 40: ' number of points on circle
50 SHIFT = .5: ' displaces points on circle to shift center of figure
60 PHASE = PI / 4: ' rotation angle of figure
70 ASPECT = 4 / 3:  ' aspect ratio, should be 0 for QB64
80 ANGLESTEP = 2 * PI / (NPOINTS% - 1)
90 SCREEN 9: CLS: KEY OFF
100 FOR U% = 0 TO NPOINTS% - 1
110 N% = U%: GOSUB 220
120 X1 = X: Y1 = Y
130 FOR V% = 1 TO U% - 1
140 IF (U% + 2 * V%) MOD 3 <> 0 THEN GOTO 180
150 N% = V%: GOSUB 220
160 X2 = X: Y2 = Y
170 LINE (X1, Y1)-(X2, Y2), 10
180 NEXT V%
190 NEXT U%
200 END
210 ' subroutine calc angle point on circle from point number n and 2 parameters
220 A = ANGLESTEP * N%
230 A = A - SHIFT * SIN(A + PHASE)
240 X = W2% + ASPECT * H2% * COS(A)
250 Y = H2% + H2% * SIN(A)
260 RETURN
