10 ' Modular multiplication circle K Moerman 2026
20 PRINT "Modular multiplication circle"
30 INPUT "Value of m, number used for modular division, hit enter for 300"; M%
40 IF M% = 0 THEN M% = 300
50 INPUT "Value of p, number used for multiplication, hit enter for 77"; P%
60 IF P% = 0 THEN P% = 77
70 SCREEN 9: CLS: PI! = 3.1415: R% = 220: ASPECT! = 640 / 350 * 3 / 4
80 DIM X%(M% - 1), Y%(M% - 1)
90 FOR N% = 0 TO M% - 1
100 ALPHA! = PI! * (2 * N% / M% + .5)
110 X%(N%) = 320 - R% * COS(ALPHA!)
120 Y%(N%) = 175 - R% * SIN(ALPHA!) / ASPECT!
130 NEXT N%
140 KEY OFF
150 FOR N% = 0 TO M% - 1
160 ' write own MOD function x mod y = CInt((x / y - Int(x / y)) * y)
170 NP! = N% * P%: Q! = NP! / M%: K% = CINT((Q! - INT(Q!)) * M%)
180 LINE (X%(K%), Y%(K%))-(X%(N%), Y%(N%)), 15
190 NEXT N%
200 LOCATE 1,3:PRINT "Modular Multiplication Circle"
210 LOCATE 2,3:PRINT "m=";M%:LOCATE 3,3:PRINT "p=";P%

