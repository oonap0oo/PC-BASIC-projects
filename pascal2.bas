10 ' Pascal's Triangle     K Moerman 2026
20 DEFINT A-Z: SCREEN 0: WIDTH 80, 25: KEY OFF: CLS
30 LOCATE 1, 3: PRINT "Pascal's triangle"
40 LOCATE 2, 3: PRINT "showing last digits"
50 COLOR 15,6: LOCATE 3, 3: PRINT "odd numbers are marked"
60 NROWS = 24: MCOL = 40
70 LOCATE 1, MCOL: PRINT "1":
80 LOCATE 2, MCOL - 1: PRINT "1": LOCATE 2, MCOL + 1: PRINT "1"
90 FOR ROW = 3 TO NROWS
100 FOR COL = MCOL - ROW + 1 TO MCOL + ROW - 1 STEP 2
110 A = SCREEN(ROW - 1, COL - 1): IF A = 32 THEN A = 0 ELSE A = A - 48
120 B = SCREEN(ROW - 1, COL + 1): IF B = 32 THEN B = 0 ELSE B = B - 48
130 C = (A + B) MOD 10 'only keep last digit
140 IF C MOD 2 = 0 THEN COLOR 15, 0 ELSE COLOR 15, 6 'mark odd numbers
150 LOCATE ROW, COL: PRINT RIGHT$(STR$(C), 1);
160 NEXT COL:NEXT ROW
170 COLOR 15, 0: WHILE INKEY$ = "": WEND
