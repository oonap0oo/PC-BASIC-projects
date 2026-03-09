10 Rem Digital clock with 7 segment display, K Moerman
20 Rem display is drawn, no Fonts are used
30 XMAX% = 640: YMAX% = 350: Rem size of screen 9
40 XU% = 2: YU% = 90: Rem  location of upper left corner of display
50 GAP% = 10: SLENGTH% = 36: SWIDTH% = 9: Rem dimensions of segment and gap between segments
60 FGCOL% = 12: BGCOL% = 0: Rem forground and background colors
70 Dim LOGIC$(10), SEGMENT$(7)
80 On Timer(.5) GoSub 380: Timer Off: Rem update clock every .5s
90 Rem segment switching logic is kept in a array of strings
100 Rem the number to be displayed is the index
110 Rem seven 1 or 0 characters represent the on/off state of the segments
120 Rem the segments are arranged in the strings as folllows:
130 Rem    ---1---
140 Rem   |       |
150 Rem   2       3
160 Rem   |       |
170 Rem    ---4---
180 Rem   |       |
190 Rem   5       6
200 Rem   |       |
210 Rem    ---7---
220 LOGIC$(0) = "1110111": LOGIC$(1) = "0010010": LOGIC$(2) = "1011101"
230 LOGIC$(3) = "1011011": LOGIC$(4) = "0111010": LOGIC$(5) = "1101011"
240 LOGIC$(6) = "1101111": LOGIC$(7) = "1010010": LOGIC$(8) = "1111111"
250 LOGIC$(9) = "1111011"
260 Rem Information how to draw each of 7 segments, format: x,y,dx,dy
270 SEGMENT$(0) = "0010": SEGMENT$(1) = "0001": SEGMENT$(2) = "1001"
280 SEGMENT$(3) = "0110": SEGMENT$(4) = "0101": SEGMENT$(5) = "1101"
290 SEGMENT$(6) = "0210"
300 Screen 9: Color 15, BGCOL%: Cls
310 SPACING% = SLENGTH% + 2 * SWIDTH% + 4 * GAP%: Rem distance between two characters
320 TOGGLE% = 1: Rem variable defines on or off state of double points
330 Locate 3, 10: Print "Seven segment clock for PC-BASIC"
340 Timer On: Rem start timer events here
350 If InKey$ = "" Then GoTo 350
360 End
370 Rem sub for handling ON TIMER event, updating clock
380 POSITION% = 0
390 T$ = Time$: Rem get time in "hh:mm:ss" format
400 For L% = 1 To 8
410 CHAR$ = Mid$(T$, L%, 1)
420 If CHAR$ = ":" Then GoSub 470 Else GoSub 590
430 Next L%
440 TOGGLE% = -TOGGLE%: Rem toggle visibility of double points
450 Return
460 Rem sub for drawing double point
470 If TOGGLE% = 1 Then COL% = FGCOL% Else COL% = BGCOL%
480 X% = POSITION% + GAP% + XU%
490 Y% = SLENGTH% + GAP% + YU%
500 GoSub 560
510 Y% = SLENGTH% + GAP% * 5 + YU%
520 GoSub 560
530 POSITION% = POSITION% + SPACING% / 3
540 Return
550 Rem sub for drawing one point
560 Line (X% - SWIDTH%, Y% - SWIDTH%)-Step(2 * SWIDTH%, 2 * SWIDTH%), COL%, BF
570 Return
580 Rem sub for drawing number
590 If TOGGLE% = 0 Then GoTo 730: Rem redraw numbers only once a second, do update POSITION%
600 NUMBER% = Val(CHAR$): Rem a number has to be drawn
610 For K% = 0 To 6 ' loop through all 7 segments
620 If Mid$(LOGIC$(NUMBER%), K% + 1, 1) = "1" Then COL% = FGCOL% Else COL% = BGCOL%
630 X% = Val(Mid$(SEGMENT$(K%), 1, 1))
640 Y% = Val(Mid$(SEGMENT$(K%), 2, 1))
650 DX% = Val(Mid$(SEGMENT$(K%), 3, 1))
660 DY% = Val(Mid$(SEGMENT$(K%), 4, 1))
670 X% = 10 + (SLENGTH% + 2 * GAP%) * X% + GAP% * DX% + POSITION% + XU%
680 Y% = 10 + (SLENGTH% + 2 * GAP%) * Y% + GAP% * DY% + YU%
690 DX% = SWIDTH% + DX% * SLENGTH%
700 DY% = SWIDTH% + DY% * SLENGTH%
710 Line (X%, Y%)-(X% + DX%, Y% + DY%), COL%, BF
720 Next K%
730 POSITION% = POSITION% + SPACING%
740 Return
