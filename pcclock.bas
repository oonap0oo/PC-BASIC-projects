10 Rem Digital clock with 7 segment display, K Moerman
20 Rem display is drawn, no Fonts are used
30 XMAX% = 640: YMAX% = 350: Rem size of screen 9
40 XU% = 2: YU% = 90: Rem  location of upper left corner of display
50 GAP% = 10: SLENGTH% = 36: SWIDTH% = 8: Rem dimensions of segment and gap between segments
60 FGCOL% = 12: BGCOL% = 0: Rem forground and background colors
70 Dim LOGIC$(10), SEGMENT$(7)
80 On Timer(.5) GoSub 370: Timer Off: Rem update clock every .5s
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
325 Locate 3, 10: Print "Seven segment clock for PC-BASIC"
330 Timer On: Rem start timer events here
340 If InKey$ = "" Then GoTo 340
350 End
360 Rem sub for handling ON TIMER event, updating clock
370 POSITION% = 0
380 T$ = Time$: Rem get time in "hh:mm:ss" format
390 For L% = 1 To 8
400 CHAR$ = Mid$(T$, L%, 1)
410 If CHAR$ = ":" Then GoSub 460 Else GoSub 580
420 Next L%
430 TOGGLE% = -TOGGLE%: Rem toggle visibility of double points
440 Return
450 Rem sub for drawing double point
460 If TOGGLE% = 1 Then COL% = FGCOL% Else COL% = BGCOL%
470 X% = POSITION% + GAP% + XU%
480 Y% = SLENGTH% + GAP% + YU%
490 GoSub 550
500 Y% = SLENGTH% + GAP% * 5 + YU%
510 GoSub 550
520 POSITION% = POSITION% + SPACING% / 3
530 Return
540 Rem sub for drawing one point
550 Line (X% - SWIDTH%, Y% - SWIDTH%)-Step(2 * SWIDTH%, 2 * SWIDTH%), COL%, BF
560 Return
570 Rem sub for drawing number
580 NUMBER% = Val(CHAR$): Rem a number has to be drawn
590 For K% = 0 To 6 ' loop through all 7 segments
600 If Mid$(LOGIC$(NUMBER%), K% + 1, 1) = "1" Then COL% = FGCOL% Else COL% = BGCOL%
610 X% = Val(Mid$(SEGMENT$(K%), 1, 1))
620 Y% = Val(Mid$(SEGMENT$(K%), 2, 1))
630 DX% = Val(Mid$(SEGMENT$(K%), 3, 1))
640 DY% = Val(Mid$(SEGMENT$(K%), 4, 1))
650 X% = 10 + (SLENGTH% + 2 * GAP%) * X% + GAP% * DX% + POSITION% + XU%
660 Y% = 10 + (SLENGTH% + 2 * GAP%) * Y% + GAP% * DY% + YU%
670 DX% = SWIDTH% + DX% * SLENGTH%
680 DY% = SWIDTH% + DY% * SLENGTH%
690 Line (X%, Y%)-(X% + DX%, Y% + DY%), COL%, BF
700 Next K%
710 POSITION% = POSITION% + SPACING%
720 Return
