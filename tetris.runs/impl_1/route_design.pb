
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
sPartially locked IO Bus is found. Following components of the IO Bus BTN[4:0] are not locked:  BTN[4] BTN[3] BTN[1]2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
sPartially locked IO Bus is found. Following components of the IO Bus LED[3:0] are not locked:  LED[3] LED[2] LED[1]2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
oPartially locked IO Bus is found. Following components of the IO Bus SW[3:0] are not locked:  SW[3] SW[2] SW[0]2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
{Partially locked IO Bus is found. Following components of the IO Bus VGA_BLUE[3:0] are not locked:  VGA_BLUE[1] VGA_BLUE[0]2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
�Partially locked IO Bus is found. Following components of the IO Bus VGA_GREEN[3:0] are not locked:  VGA_GREEN[2] VGA_GREEN[1] VGA_GREEN[0]2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
�Partially locked IO Bus is found. Following components of the IO Bus VGA_RED[3:0] are not locked:  VGA_RED[3] VGA_RED[2] VGA_RED[1]2default:defaultZ23-20h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 6 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
C
.Phase 1 Build RT Design | Checksum: 14fb40b5b
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:22 . Memory (MB): peak = 1201.605 ; gain = 0.0002default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
B
-Phase 2.1 Create Timer | Checksum: 14fb40b5b
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:22 . Memory (MB): peak = 1201.605 ; gain = 0.0002default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 14fb40b5b
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:22 . Memory (MB): peak = 1201.605 ; gain = 0.0002default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 14fb40b5b
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:22 . Memory (MB): peak = 1201.605 ; gain = 0.0002default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.4 Update Timing | Checksum: 1919efa53
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:28 ; elapsed = 00:00:24 . Memory (MB): peak = 1201.605 ; gain = 0.0002default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=8.386  | TNS=0.000  | WHS=-0.150 | THS=-18.135|
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 167b6f582
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:29 ; elapsed = 00:00:24 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
C
.Phase 3 Initial Routing | Checksum: 247952f78
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:30 ; elapsed = 00:00:25 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.1.1 Update Timing | Checksum: 20b3a9235
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:32 ; elapsed = 00:00:26 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=8.310  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 1af6223f8
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:32 ; elapsed = 00:00:26 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.2.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.2.1 Update Timing | Checksum: 12a9fceb1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:26 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=8.036  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.2 Global Iteration 1 | Checksum: 12a9fceb1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:26 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 12a9fceb1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:26 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 12a9fceb1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:26 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 12a9fceb1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:26 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 12a9fceb1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:26 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 6.1.1 Update Timing | Checksum: 19dd5953e
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:27 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=8.130  | TNS=0.000  | WHS=0.064  | THS=0.000  |
2default:defaultZ35-416h px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 139d0f8c1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:27 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
A
,Phase 6 Post Hold Fix | Checksum: 139d0f8c1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:27 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 1b6967633
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:27 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 1b6967633
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:33 ; elapsed = 00:00:27 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 1ce73b308
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:34 ; elapsed = 00:00:27 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=8.130  | TNS=0.000  | WHS=0.064  | THS=0.000  |
2default:defaultZ35-57h px� 
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px� 
G
2Phase 10 Post Router Timing | Checksum: 1ce73b308
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:34 ; elapsed = 00:00:27 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
=
Router Completed Successfully
16*routeZ35-16h px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:34 ; elapsed = 00:00:27 . Memory (MB): peak = 1201.988 ; gain = 0.3832default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
712default:default2
132default:default2
212default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:372default:default2
00:00:292default:default2
1201.9882default:default2
0.3832default:defaultZ17-268h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:022default:default2 
00:00:00.7512default:default2
1201.9882default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2x
dC:/Users/tamura/OneDrive/kenkyu/FPGA_tetris/Jikken2_FPGA/tetris/tetris.runs/impl_1/tetris_routed.dcp2default:defaultZ17-1381h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
hC:/Users/tamura/OneDrive/kenkyu/FPGA_tetris/Jikken2_FPGA/tetris/tetris.runs/impl_1/tetris_drc_routed.rpthC:/Users/tamura/OneDrive/kenkyu/FPGA_tetris/Jikken2_FPGA/tetris/tetris.runs/impl_1/tetris_drc_routed.rpt2default:default8Z2-168h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
tC:/Users/tamura/OneDrive/kenkyu/FPGA_tetris/Jikken2_FPGA/tetris/tetris.runs/impl_1/tetris_methodology_drc_routed.rpttC:/Users/tamura/OneDrive/kenkyu/FPGA_tetris/Jikken2_FPGA/tetris/tetris.runs/impl_1/tetris_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
Command: %s
53*	vivadotcl2~
jreport_power -file tetris_power_routed.rpt -pb tetris_power_summary_routed.pb -rpx tetris_power_routed.rpx2default:defaultZ4-113h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
�Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
812default:default2
142default:default2
212default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 


End Record