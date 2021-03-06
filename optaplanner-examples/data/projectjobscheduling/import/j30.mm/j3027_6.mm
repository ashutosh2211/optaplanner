************************************************************************
file with basedata            : mf27_.bas
initial value random generator: 1586319806
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  32
horizon                       :  251
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     30      0       25        3       25
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          2           6   7
   3        3          2           8  16
   4        3          3           5  14  15
   5        3          3           9  22  26
   6        3          1          18
   7        3          3          10  12  26
   8        3          2          20  27
   9        3          3          13  23  25
  10        3          3          11  19  28
  11        3          2          15  16
  12        3          2          17  23
  13        3          2          28  31
  14        3          3          17  19  24
  15        3          1          21
  16        3          1          17
  17        3          1          31
  18        3          2          21  23
  19        3          1          25
  20        3          2          22  24
  21        3          2          22  25
  22        3          1          30
  23        3          3          27  28  31
  24        3          2          26  29
  25        3          2          27  29
  26        3          1          30
  27        3          1          30
  28        3          1          29
  29        3          1          32
  30        3          1          32
  31        3          1          32
  32        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     4       3    0    0    4
         2     8       0    6    4    0
         3    10       0    4    4    0
  3      1     6       7    0    7    0
         2     7       6    0    6    0
         3     7       7    0    5    0
  4      1     3       0    9    0    6
         2     8       0    6    3    0
         3    10       0    4    0    3
  5      1     1       7    0    9    0
         2     3       4    0    0    3
         3     9       3    0    0    3
  6      1     3       0    5    0    7
         2     6       0    5    5    0
         3     9       6    0    0    5
  7      1     1       0    4    9    0
         2     5       0    1    0    4
         3     8       7    0    7    0
  8      1     2       0    5    0    8
         2     5       7    0    5    0
         3    10       6    0    0    8
  9      1     3       3    0    0    9
         2     4       0    4    5    0
         3    10       0    1    0    8
 10      1     1       4    0    3    0
         2     3       0    2    2    0
         3     5       3    0    2    0
 11      1     1       9    0    4    0
         2     2       0    6    3    0
         3     8       8    0    0    4
 12      1     4       0    7    0    9
         2     6       1    0    5    0
         3     6       0    6    0    9
 13      1     6       8    0    9    0
         2     6       7    0    0    7
         3     8       0    9   10    0
 14      1     4       3    0    0    9
         2     7       0    6    0    7
         3     9       0    4    0    4
 15      1     4       0   10    6    0
         2     6       0    9    0    5
         3    10       9    0    0    4
 16      1     1       6    0    7    0
         2     4       5    0    0    9
         3     8       0    7    3    0
 17      1     2       9    0    0    8
         2     3       0    4    0    2
         3     7       5    0    7    0
 18      1     3       0    9    8    0
         2     7       9    0    8    0
         3     8       0    5    8    0
 19      1     4       7    0    7    0
         2     9       6    0    3    0
         3    10       3    0    0    6
 20      1     2       0    4    6    0
         2     2       8    0    0    2
         3     4       7    0    6    0
 21      1     6       6    0    0    6
         2     7       0    4    9    0
         3     9       0    3    7    0
 22      1     6       6    0    0    5
         2     7       0    1    0    3
         3     8       3    0    0    1
 23      1     2       7    0    9    0
         2     7       0    2    9    0
         3     8       2    0    8    0
 24      1     4       0    6    0    6
         2     4       0    6    5    0
         3    10       0    3    1    0
 25      1     3       0    8   10    0
         2     3       0    6    0    6
         3    10       0    2    0    6
 26      1     3       6    0    0    5
         2     7       4    0    9    0
         3     8       0    8    8    0
 27      1     3       0    5    0    7
         2     4       0    5    7    0
         3     8       3    0    0    7
 28      1     6       3    0    3    0
         2     7       0    3    3    0
         3     9       0    2    0    8
 29      1     4       0    4    0    7
         2     8       0    4    0    6
         3     8       3    0    7    0
 30      1     2       7    0   10    0
         2     4       0    6    5    0
         3     8       0    2    5    0
 31      1     1       6    0    9    0
         2     5       6    0    0    7
         3     9       0    8    0    3
 32      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   26   29  188  157
************************************************************************
