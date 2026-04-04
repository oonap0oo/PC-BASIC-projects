10 ' Fedora for PC-BASIC    K Moerman 2026
20 Screen 9: Cls: Key Off: A! = 1.5 * 3.14: B! = 3 * A!
30 For V% = 0 To 100 Step 2
40 Y! = V% / 50 - 1: YSQ! = Y! * Y!
50 For H% = 0 To 250 Step 2
60 X! = H% / 250 - 1: RSQ! = X! * X! + YSQ!
80 If RSQ! <= 1 Then GoSub 120
90 Next H%: Next V%
100 End
110 ' Subroutine for drawing
120 R! = Sqr(RSQ!)
130 Z% = 60 * Sin(A! * R!) + 28 * Sin(B! * R!)
140 YSCR% = Y! * 50 - Z% + 170
150 XSCR% = V% + H% + 5: GoSub 240
180 XSCR% = V% - H% + 505: GoSub 240
220 Return
230 ' Subroutine to plot a point
240 Line (XSCR%, YSCR%)-Step(0, 40), 0
250 PSet (XSCR%, YSCR%), 10
260 Return

