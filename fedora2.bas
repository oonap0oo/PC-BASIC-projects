10 ' Fedora for PC-BASIC    K Moerman 2026
20 Screen 9: Cls: A! = 1.5 * 3.14: B! = 3 * A!
30 For V% = 0 To 50
40 Y! = V% / 25 - 1
50 For H% = 0 To 125
60 X! = H% / 125 - 1
70 RSQ! = X! * X! + Y! * Y!
80 If RSQ! < 1 Then GoSub 120
90 Next H%: Next V%
100 End
110 ' Subroutine for drawing
120 R! = Sqr(RSQ!): VV% = 2 * V%: HH% = 2 * H%
130 Z! = Sin(A! * R!) + .4 * Sin(B! * R!)
140 YSCR% = Y! * 60 - Z! * 70 + 170
150 XSCR% = VV% + HH% + 5
160 Line (XSCR%, YSCR%)-Step(1, 50), 0
170 PSet (XSCR%, YSCR%), 10
180 XSCR% = VV% - HH% + 505
200 Line (XSCR%, YSCR%)-Step(1, 50), 0
210 PSet (XSCR%, YSCR%), 10
300 Return


