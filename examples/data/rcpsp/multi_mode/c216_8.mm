************************************************************************
file with basedata            : c216_.bas
initial value random generator: 1621794210
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  18
horizon                       :  126
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     16      0       20        9       20
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          3           6   8   9
   3        3          2           5  10
   4        3          3           7   9  10
   5        3          3           6   7   9
   6        3          3          11  13  14
   7        3          3           8  11  13
   8        3          3          12  14  17
   9        3          2          12  17
  10        3          3          12  13  14
  11        3          2          16  17
  12        3          2          15  16
  13        3          2          15  16
  14        3          1          15
  15        3          1          18
  16        3          1          18
  17        3          1          18
  18        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     2       7    4    1    0
         2     8       6    2    0    8
         3     9       6    2    0    5
  3      1     1       8    9    0    7
         2     7       4    8    7    0
         3     8       4    7    6    0
  4      1     2       3    4    7    0
         2     6       2    2    2    0
         3     9       2    1    0    1
  5      1     2       6    2    1    0
         2     5       6    1    0    8
         3     8       5    1    0    8
  6      1     6       9    9   10    0
         2     8       9    7    0    3
         3    10       7    3    6    0
  7      1     2       8    9    1    0
         2     4       7    8    0   10
         3     9       4    8    0   10
  8      1     6       9    5    3    0
         2     6       9    4    0    9
         3     7       9    2    3    0
  9      1     5       8    6    0    7
         2     5      10    7    0    6
         3     5       8    6   10    0
 10      1     3       8    5    5    0
         2     4       8    4    0    6
         3     9       6    4    5    0
 11      1     2       4    9    7    0
         2     3       4    8    6    0
         3     3       2    8    0    9
 12      1     2       7    3    9    0
         2     7       6    2    5    0
         3     9       2    2    2    0
 13      1     5       7    8    0    4
         2     9       2    8    0    3
         3     9       2    7    0    4
 14      1     2       9    5    2    0
         2     6       6    5    2    0
         3     9       3    4    0    1
 15      1     3       2    7    7    0
         2     6       2    7    6    0
         3     8       1    6    6    0
 16      1     6       9    7    9    0
         2     7       8    4    4    0
         3     8       7    4    3    0
 17      1     1       4    8    0    7
         2     2       3    6    0    7
         3     6       3    4    0    6
 18      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   22   19   28   27
************************************************************************
