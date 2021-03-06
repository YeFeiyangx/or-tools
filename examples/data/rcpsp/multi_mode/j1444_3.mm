************************************************************************
file with basedata            : md172_.bas
initial value random generator: 193225359
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  16
horizon                       :  119
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     14      0       26        9       26
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          3          10  12  15
   3        3          3           5   7   8
   4        3          3           6   8  15
   5        3          2          11  15
   6        3          3           7   9  11
   7        3          1          13
   8        3          2          10  12
   9        3          1          12
  10        3          1          11
  11        3          2          13  14
  12        3          2          13  14
  13        3          1          16
  14        3          1          16
  15        3          1          16
  16        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     4       5    0    6   10
         2     7       0    5    4    9
         3     9       0    2    3    8
  3      1     4       6    0    3    4
         2     5       6    0    2    2
         3    10       4    0    2    1
  4      1     1       0    6    5   10
         2     7       4    0    4   10
         3     8       0    6    4    9
  5      1     3       1    0    4    8
         2     4       0    7    4    6
         3     9       0    4    4    4
  6      1     2       4    0    2    5
         2     3       0    5    2    5
         3     8       3    0    1    4
  7      1     1       4    0    7    9
         2     3       0   10    6    8
         3     4       0    6    5    7
  8      1     8       0    6    5    7
         2     9       0    5    4    6
         3    10       0    5    3    5
  9      1     2       0   10   10    7
         2     4       0   10    8    5
         3     7       0    9    4    4
 10      1     4       9    0    7    5
         2     8       8    0    5    4
         3     9       7    0    4    4
 11      1     6       5    0   10    8
         2     7       0   10    9    8
         3     9       0   10    9    6
 12      1     3       4    0    6   10
         2     6       3    0    6   10
         3     6       0    8    4   10
 13      1     4       0    9    9    2
         2     8       9    0    9    2
         3    10       4    0    9    2
 14      1     3       0    4    6    2
         2     6       0    3    5    1
         3    10       0    3    4    1
 15      1     5       4    0    5    7
         2     6       0    6    5    5
         3    10       0    6    5    3
 16      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   15   38   73   81
************************************************************************
