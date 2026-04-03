10 Rem Hexagon using chaos game for PC-BASIC K Moerman 2026
20 Randomize Timer: ASPECT! = 4 / 3 * 350 / 630 * Sqr(3) / 2: R! = .667
30 H% = 350: W% = H% / ASPECT!: BRD% = (630 - W%) / 2
40 Screen 9: Cls: Key Off
50 Locate 2, 2: Print "Hexagon"
60 Locate 3, 2: Print "Using chaos game"
70 Dim CX%(5), CY%(5): Rem coord. of hexagon vertices
80 CX%(0) = W% / 4 + BRD%: CY%(0) = 0
90 CX%(1) = 3 * W% / 4 + BRD%: CY%(1) = 0
100 CX%(2) = W% + BRD%: CY%(2) = H% / 2
110 CX%(3) = BRD%: CY%(3) = H% / 2
120 CX%(4) = W% / 4 + BRD%: CY%(4) = H%
130 CX%(5) = 3 * W% / 4 + BRD%: CY%(5) = H%
140 PX% = CX%(0) + BRD%: PY% = CY%(0)
150 COL% = 0: COL2% = 0
160 For K! = 1 To 60000!
170 INDEX% = Int(Rnd * 6)
180 PX% = PX% + (CX%(INDEX%) - PX%) * R!
190 PY% = PY% + (CY%(INDEX%) - PY%) * R!
200 PSet (PX%, PY%), COL%
210 COL2% = COL%: COL% = 10 + INDEX%
220 Next K!
230 Locate 4, 2: Print "Drawing completed"
240 End
