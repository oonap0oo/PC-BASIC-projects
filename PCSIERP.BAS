10 Rem Sierpinski triangle for PC-BASIC K Moerman 2026
20 Randomize Timer
30 XMAX% = 640: YMAX% = 350: BORDER% = 10
40 Screen 9: Cls
50 Locate 2, 3: Print "Sierpinski triangle"
60 Dim CX%(2), CY%(2): Rem coord. of triangle vertices
70 CX%(0) = XMAX% / 2: CY%(0) = BORDER%
80 CX%(2) = BORDER%: CY%(2) = YMAX% - BORDER%
90 CX%(1) = XMAX% - BORDER%: CY%(1) = YMAX% - BORDER%
100 PX% = CX%(0): PY% = CY%(0)
110 COL% = 0: COL2% = 0: COL3% = 0
120 For K! = 1 To 60000!
130 INDEX% = Int(Rnd * 3)
140 PX% = (PX% + CX%(INDEX%)) / 2
150 PY% = (PY% + CY%(INDEX%)) / 2
160 PSet (PX%, PY%), COL3%
170 COL3% = COL2%: COL2% = COL%: COL% = 13 + INDEX%
180 Next K!
190 Locate 3, 3: Print "Drawing completed"
200 End
