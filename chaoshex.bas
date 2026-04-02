10 REM Hexagon using chaos game for PC-BASIC
20 RANDOMIZE TIMER: ASPECT! = 350 / 630 * SQR(3) / 2: R! = .667
30 W% = 630: H% = W% * ASPECT!: BRD% = (350 - H%) / 2
40 SCREEN 9: CLS:KEY OFF
50 LOCATE 2, 2: PRINT "Hexagon"
60 LOCATE 3, 2: PRINT "Using chaos game"
70 DIM CX%(5), CY%(5): REM coord. of hexagon vertices
80 CX%(0) = W% / 4: CY%(0) = BRD%
90 CX%(1) = 3 * W% / 4: CY%(1) = BRD%
100 CX%(2) = W%: CY%(2) = H% / 2 + BRD%
110 CX%(3) = 0: CY%(3) = H% / 2 + BRD%
120 CX%(4) = W% / 4: CY%(4) = H% + BRD%
130 CX%(5) = 3 * W% / 4: CY%(5) = H% + BRD%
140 PX% = CX%(0): PY% = CY%(0)
150 COL% = 0: COL2% = 0
160 FOR K! = 1 TO 60000!
170 INDEX% = INT(RND * 6)
180 PX% = PX% + (CX%(INDEX%) - PX%) * R!
190 PY% = PY% + (CY%(INDEX%) - PY%) * R!
200 PSET (PX%, PY%), COL%
210 COL2% = COL%: COL% = 10 + INDEX%
220 NEXT K!
230 LOCATE 4, 2: PRINT "Drawing completed"
240 END
