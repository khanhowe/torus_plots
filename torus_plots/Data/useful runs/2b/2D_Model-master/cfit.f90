MODULE FITC   

   IMPLICIT NONE

   CONTAINS

   subroutine cfit(iz,in,t,c)
!* Version 2, March 24, 1997
!******************************************************************************
!*** This subroutine calculates rates of direct collisional ionization 
!*** for all ionization stages of all elements from H to Ni (Z=28)
!*** by use of the fits from G. S. Voronov, 1997, ADNDT, 65, 1
!*** Input parameters:  iz - atomic number 
!***                    in - number of electrons from 1 to iz 
!***                    t  - temperature, K
!*** Output parameter:  c  - rate coefficient, cm^3 s^(-1)
!******************************************************************************
      REAL              ::CF(5,28,28)
      DOUBLE PRECISION  ::t,te,u
      REAL              ::c
      INTEGER           ::I,z,iz,in
!      common/CF/CF(5,28,28)
      c=0.0
!      if(iz.lt.1.or.iz.gt.28)end
!      if(in.lt.1.or.in.gt.iz)end
      te=t*8.617385e-05
      u=cf(1,iz,in)/te
!      if(u.gt.80.0)end
      c=cf(3,iz,in)*(1.0+cf(2,iz,in)*sqrt(u))/(cf(4,iz,in)+u)*u**cf(5,iz,in)*exp(-u)
!      exit
!*********************************************
!      block data cifit
!      common/CF/CF(5,28,28)
      
      DATA(CF(I, 1, 1),I=1,5)/   13.6,0.,2.91E-08,0.2320,0.39/
      DATA(CF(I, 2, 2),I=1,5)/   24.6,0.,1.75E-08,0.1800,0.35/
      DATA(CF(I, 2, 1),I=1,5)/   54.4,1.,2.05E-09,0.2650,0.25/
      DATA(CF(I, 3, 3),I=1,5)/    5.4,0.,1.39E-07,0.4380,0.41/
      DATA(CF(I, 3, 2),I=1,5)/   75.6,1.,2.01E-09,0.2090,0.23/
      DATA(CF(I, 3, 1),I=1,5)/  122.4,1.,9.60E-10,0.5820,0.17/
      DATA(CF(I, 4, 4),I=1,5)/    9.3,0.,1.02E-07,0.3750,0.27/
      DATA(CF(I, 4, 3),I=1,5)/   18.2,1.,2.08E-08,0.4390,0.21/
      DATA(CF(I, 4, 2),I=1,5)/  153.9,0.,2.67E-09,0.6120,0.27/
      DATA(CF(I, 4, 1),I=1,5)/  217.7,1.,4.27E-10,0.6580,0.15/
      DATA(CF(I, 5, 5),I=1,5)/    8.3,0.,6.49E-08,0.2000,0.26/
      DATA(CF(I, 5, 4),I=1,5)/   25.2,1.,1.24E-08,0.2670,0.22/
      DATA(CF(I, 5, 3),I=1,5)/   37.9,1.,3.27E-09,0.2950,0.23/
      DATA(CF(I, 5, 2),I=1,5)/  259.4,1.,4.95E-10,0.4890,0.09/
      DATA(CF(I, 5, 1),I=1,5)/  340.2,1.,2.19E-10,0.6570,0.15/
      DATA(CF(I, 6, 6),I=1,5)/   11.3,0.,6.85E-08,0.1930,0.25/
      DATA(CF(I, 6, 5),I=1,5)/   24.4,1.,1.86E-08,0.2860,0.24/
      DATA(CF(I, 6, 4),I=1,5)/   47.9,1.,6.35E-09,0.4270,0.21/
      DATA(CF(I, 6, 3),I=1,5)/   64.5,1.,1.50E-09,0.4160,0.13/
      DATA(CF(I, 6, 2),I=1,5)/  392.1,1.,2.99E-10,0.6660,0.02/
      DATA(CF(I, 6, 1),I=1,5)/  490.0,1.,1.23E-10,0.6200,0.16/
      DATA(CF(I, 7, 7),I=1,5)/   14.5,0.,4.82E-08,0.0652,0.42/
      DATA(CF(I, 7, 6),I=1,5)/   29.6,0.,2.98E-08,0.3100,0.30/
      DATA(CF(I, 7, 5),I=1,5)/   47.5,1.,8.10E-09,0.3500,0.24/
      DATA(CF(I, 7, 4),I=1,5)/   77.5,1.,3.71E-09,0.5490,0.18/
      DATA(CF(I, 7, 3),I=1,5)/   97.9,0.,1.51E-09,0.0167,0.74/
      DATA(CF(I, 7, 2),I=1,5)/  552.1,0.,3.71E-10,0.5460,0.29/
      DATA(CF(I, 7, 1),I=1,5)/  667.0,1.,7.77E-11,0.6240,0.16/
      DATA(CF(I, 8, 8),I=1,5)/   13.6,0.,3.59E-08,0.0730,0.34/
      DATA(CF(I, 8, 7),I=1,5)/   35.1,1.,1.39E-08,0.2120,0.22/
      DATA(CF(I, 8, 6),I=1,5)/   54.9,1.,9.31E-09,0.2700,0.27/
      DATA(CF(I, 8, 5),I=1,5)/   77.4,0.,1.02E-08,0.6140,0.27/
      DATA(CF(I, 8, 4),I=1,5)/  113.9,1.,2.19E-09,0.6300,0.17/
      DATA(CF(I, 8, 3),I=1,5)/  138.1,0.,1.95E-09,0.3600,0.54/
      DATA(CF(I, 8, 2),I=1,5)/  739.3,0.,2.12E-10,0.3960,0.35/
      DATA(CF(I, 8, 1),I=1,5)/  871.4,1.,5.21E-11,0.6290,0.16/
      DATA(CF(I, 9, 9),I=1,5)/   17.4,1.,7.00E-08,0.1780,0.29/
      DATA(CF(I, 9, 8),I=1,5)/   35.0,0.,5.41E-08,0.5710,0.27/
      DATA(CF(I, 9, 7),I=1,5)/   62.7,1.,9.37E-09,0.3190,0.20/
      DATA(CF(I, 9, 6),I=1,5)/   87.1,1.,4.92E-09,0.3230,0.24/
      DATA(CF(I, 9, 5),I=1,5)/  114.2,0.,7.06E-09,0.6840,0.27/
      DATA(CF(I, 9, 4),I=1,5)/  157.2,1.,1.28E-09,0.6480,0.16/
      DATA(CF(I, 9, 3),I=1,5)/  185.2,1.,5.61E-10,0.7380,0.16/
      DATA(CF(I, 9, 2),I=1,5)/  953.9,0.,1.66E-10,0.5420,0.29/
      DATA(CF(I, 9, 1),I=1,5)/ 1103.1,1.,3.74E-11,0.6590,0.15/
      DATA(CF(I,10,10),I=1,5)/   21.6,1.,1.50E-08,0.0329,0.43/
      DATA(CF(I,10, 9),I=1,5)/   41.0,0.,1.98E-08,0.2950,0.20/
      DATA(CF(I,10, 8),I=1,5)/   63.5,1.,7.03E-09,0.0677,0.39/
      DATA(CF(I,10, 7),I=1,5)/   97.1,1.,4.24E-09,0.0482,0.58/
      DATA(CF(I,10, 6),I=1,5)/  126.2,1.,2.79E-09,0.3050,0.25/
      DATA(CF(I,10, 5),I=1,5)/  157.9,0.,3.45E-09,0.5810,0.28/
      DATA(CF(I,10, 4),I=1,5)/  207.3,1.,9.56E-10,0.7490,0.14/
      DATA(CF(I,10, 3),I=1,5)/  239.1,1.,4.73E-10,0.9920,0.04/
      DATA(CF(I,10, 2),I=1,5)/ 1196.0,1.,3.92E-11,0.2620,0.20/
      DATA(CF(I,10, 1),I=1,5)/ 1360.6,1.,2.77E-11,0.6610,0.13/
      DATA(CF(I,11,11),I=1,5)/    5.1,1.,1.01E-07,0.2750,0.23/
      DATA(CF(I,11,10),I=1,5)/   47.3,1.,7.35E-09,0.0560,0.35/
      DATA(CF(I,11, 9),I=1,5)/   71.6,1.,8.10E-09,0.1480,0.32/
      DATA(CF(I,11, 8),I=1,5)/   98.9,0.,1.14E-08,0.5530,0.28/
      DATA(CF(I,11, 7),I=1,5)/  138.4,1.,2.63E-09,0.2300,0.29/
      DATA(CF(I,11, 6),I=1,5)/  172.2,1.,1.85E-09,0.3630,0.22/
      DATA(CF(I,11, 5),I=1,5)/  208.5,0.,2.82E-09,0.6740,0.27/
      DATA(CF(I,11, 4),I=1,5)/  264.2,1.,6.72E-10,0.7520,0.14/
      DATA(CF(I,11, 3),I=1,5)/  299.9,1.,2.80E-10,0.7810,0.15/
      DATA(CF(I,11, 2),I=1,5)/ 1465.1,1.,4.63E-11,0.5580,0.16/
      DATA(CF(I,11, 1),I=1,5)/ 1648.7,1.,2.16E-11,0.7430,0.13/
      DATA(CF(I,12,12),I=1,5)/    7.6,0.,6.21E-07,0.5920,0.39/
      DATA(CF(I,12,11),I=1,5)/   15.2,0.,1.92E-08,0.0027,0.85/
      DATA(CF(I,12,10),I=1,5)/   80.1,1.,5.56E-09,0.1070,0.30/
      DATA(CF(I,12, 9),I=1,5)/  109.3,1.,4.35E-09,0.1590,0.31/
      DATA(CF(I,12, 8),I=1,5)/  141.3,0.,7.10E-09,0.6580,0.25/
      DATA(CF(I,12, 7),I=1,5)/  186.5,1.,1.70E-09,0.2420,0.28/
      DATA(CF(I,12, 6),I=1,5)/  224.9,1.,1.22E-09,0.3430,0.23/
      DATA(CF(I,12, 5),I=1,5)/  266.0,0.,2.20E-09,0.8970,0.22/
      DATA(CF(I,12, 4),I=1,5)/  328.2,1.,4.86E-10,0.7510,0.14/
      DATA(CF(I,12, 3),I=1,5)/  367.5,1.,2.35E-10,1.0300,0.10/
      DATA(CF(I,12, 2),I=1,5)/ 1761.8,1.,2.06E-11,0.1960,0.25/
      DATA(CF(I,12, 1),I=1,5)/ 1962.7,1.,1.75E-11,0.8350,0.11/
      DATA(CF(I,13,13),I=1,5)/    6.0,1.,2.28E-07,0.3870,0.25/
      DATA(CF(I,13,12),I=1,5)/   18.8,0.,1.18E-07,2.2100,0.25/
      DATA(CF(I,13,11),I=1,5)/   28.5,1.,4.40E-09,0.1060,0.24/
      DATA(CF(I,13,10),I=1,5)/  120.0,0.,1.75E-08,0.8720,0.22/
      DATA(CF(I,13, 9),I=1,5)/  153.8,1.,2.61E-09,0.1590,0.31/
      DATA(CF(I,13, 8),I=1,5)/  198.5,1.,1.85E-09,0.1520,0.36/
      DATA(CF(I,13, 7),I=1,5)/  241.4,1.,1.14E-09,0.2280,0.29/
      DATA(CF(I,13, 6),I=1,5)/  284.6,1.,8.00E-10,0.4170,0.16/
      DATA(CF(I,13, 5),I=1,5)/  390.2,1.,5.83E-10,0.4970,0.23/
      DATA(CF(I,13, 4),I=1,5)/  399.4,0.,4.93E-10,0.7060,0.16/
      DATA(CF(I,13, 3),I=1,5)/  442.0,1.,9.77E-11,0.2780,0.17/
      DATA(CF(I,13, 2),I=1,5)/ 2086.6,0.,3.94E-11,0.2860,0.36/
      DATA(CF(I,13, 1),I=1,5)/ 2304.1,1.,1.38E-11,0.8350,0.11/
      DATA(CF(I,14,14),I=1,5)/    8.2,1.,1.88E-07,0.3760,0.25/
      DATA(CF(I,14,13),I=1,5)/   16.4,1.,6.43E-08,0.6320,0.20/
      DATA(CF(I,14,12),I=1,5)/   33.5,1.,2.01E-08,0.4730,0.22/
      DATA(CF(I,14,11),I=1,5)/   54.0,1.,4.94E-09,0.1720,0.23/
      DATA(CF(I,14,10),I=1,5)/  166.8,1.,1.76E-09,0.1020,0.31/
      DATA(CF(I,14, 9),I=1,5)/  205.3,1.,1.74E-09,0.1800,0.29/
      DATA(CF(I,14, 8),I=1,5)/  246.5,1.,1.23E-09,0.5180,0.07/
      DATA(CF(I,14, 7),I=1,5)/  303.5,1.,8.27E-10,0.2390,0.28/
      DATA(CF(I,14, 6),I=1,5)/  351.1,1.,6.01E-10,0.3050,0.25/
      DATA(CF(I,14, 5),I=1,5)/  401.4,1.,4.65E-10,0.6660,0.04/
      DATA(CF(I,14, 4),I=1,5)/  476.4,1.,2.63E-10,0.6660,0.16/
      DATA(CF(I,14, 3),I=1,5)/  523.5,1.,1.18E-10,0.7340,0.16/
      DATA(CF(I,14, 2),I=1,5)/ 2437.7,0.,3.36E-11,0.3360,0.37/
      DATA(CF(I,14, 1),I=1,5)/ 2673.2,1.,1.19E-11,0.9890,0.08/
      DATA(CF(I,15,15),I=1,5)/   10.5,1.,1.99E-07,0.5350,0.24/
      DATA(CF(I,15,14),I=1,5)/   19.8,1.,5.88E-08,0.5370,0.21/
      DATA(CF(I,15,13),I=1,5)/   30.2,1.,2.96E-08,0.8650,0.16/
      DATA(CF(I,15,12),I=1,5)/   51.4,1.,1.01E-08,0.5460,0.20/
      DATA(CF(I,15,11),I=1,5)/   65.0,1.,2.36E-09,0.1920,0.17/
      DATA(CF(I,15,10),I=1,5)/  220.4,0.,6.66E-09,1.0000,0.18/
      DATA(CF(I,15, 9),I=1,5)/  263.2,1.,1.24E-09,0.2150,0.26/
      DATA(CF(I,15, 8),I=1,5)/  309.4,0.,2.27E-09,0.7340,0.23/
      DATA(CF(I,15, 7),I=1,5)/  371.7,1.,6.14E-10,0.2560,0.27/
      DATA(CF(I,15, 6),I=1,5)/  424.5,1.,4.69E-10,0.3420,0.23/
      DATA(CF(I,15, 5),I=1,5)/  479.6,0.,6.14E-10,0.3340,0.39/
      DATA(CF(I,15, 4),I=1,5)/  560.4,0.,3.22E-10,0.8500,0.12/
      DATA(CF(I,15, 3),I=1,5)/  611.9,1.,9.32E-11,0.7340,0.16/
      DATA(CF(I,15, 2),I=1,5)/ 2816.9,0.,3.79E-11,0.8050,0.22/
      DATA(CF(I,15, 1),I=1,5)/ 3069.9,1.,9.73E-12,0.9910,0.08/
      DATA(CF(I,16,16),I=1,5)/   10.4,1.,5.49E-08,0.1000,0.25/
      DATA(CF(I,16,15),I=1,5)/   23.3,1.,6.81E-08,0.6930,0.21/
      DATA(CF(I,16,14),I=1,5)/   34.8,1.,2.14E-08,0.3530,0.24/
      DATA(CF(I,16,13),I=1,5)/   47.3,1.,1.66E-08,1.0300,0.14/
      DATA(CF(I,16,12),I=1,5)/   72.6,1.,6.12E-09,0.5800,0.19/
      DATA(CF(I,16,11),I=1,5)/   88.1,1.,1.33E-09,0.0688,0.35/
      DATA(CF(I,16,10),I=1,5)/  280.9,0.,4.93E-09,1.1300,0.16/
      DATA(CF(I,16, 9),I=1,5)/  328.2,1.,8.73E-10,0.1930,0.28/
      DATA(CF(I,16, 8),I=1,5)/  379.1,0.,1.35E-09,0.4310,0.32/
      DATA(CF(I,16, 7),I=1,5)/  447.1,1.,4.59E-10,0.2420,0.28/
      DATA(CF(I,16, 6),I=1,5)/  504.8,1.,3.49E-10,0.3050,0.25/
      DATA(CF(I,16, 5),I=1,5)/  564.7,0.,5.23E-10,0.4280,0.35/
      DATA(CF(I,16, 4),I=1,5)/  651.6,0.,2.59E-10,0.8540,0.12/
      DATA(CF(I,16, 3),I=1,5)/  707.2,1.,7.50E-11,0.7340,0.16/
      DATA(CF(I,16, 2),I=1,5)/ 3223.9,0.,2.67E-11,0.5720,0.28/
      DATA(CF(I,16, 1),I=1,5)/ 3494.2,1.,6.32E-12,0.5850,0.17/
      DATA(CF(I,17,17),I=1,5)/   13.0,1.,1.69E-07,0.4300,0.24/
      DATA(CF(I,17,16),I=1,5)/   23.8,1.,6.96E-08,0.6700,0.20/
      DATA(CF(I,17,15),I=1,5)/   39.6,1.,3.40E-08,0.8650,0.18/
      DATA(CF(I,17,14),I=1,5)/   53.5,1.,1.10E-08,0.3280,0.25/
      DATA(CF(I,17,13),I=1,5)/   67.8,1.,1.11E-08,1.3700,0.10/
      DATA(CF(I,17,12),I=1,5)/   97.0,1.,3.17E-09,0.3300,0.24/
      DATA(CF(I,17,11),I=1,5)/  114.2,1.,1.01E-09,0.1960,0.16/
      DATA(CF(I,17,10),I=1,5)/  348.3,0.,2.11E-09,0.3130,0.37/
      DATA(CF(I,17, 9),I=1,5)/  400.1,1.,6.32E-10,0.1730,0.30/
      DATA(CF(I,17, 8),I=1,5)/  455.6,0.,9.48E-10,0.3440,0.36/
      DATA(CF(I,17, 7),I=1,5)/  529.3,1.,3.69E-10,0.2730,0.26/
      DATA(CF(I,17, 6),I=1,5)/  592.0,1.,2.85E-10,0.3430,0.23/
      DATA(CF(I,17, 5),I=1,5)/  656.7,0.,4.81E-10,0.6580,0.27/
      DATA(CF(I,17, 4),I=1,5)/  749.8,1.,1.31E-10,0.6230,0.16/
      DATA(CF(I,17, 3),I=1,5)/  809.4,1.,6.13E-11,0.7360,0.16/
      DATA(CF(I,17, 2),I=1,5)/ 3658.4,0.,1.90E-11,0.3790,0.36/
      DATA(CF(I,17, 1),I=1,5)/ 3946.3,1.,5.14E-12,0.5530,0.18/
      DATA(CF(I,18,18),I=1,5)/   15.8,1.,5.99E-08,0.1360,0.26/
      DATA(CF(I,18,17),I=1,5)/   27.6,1.,6.07E-08,0.5440,0.21/
      DATA(CF(I,18,16),I=1,5)/   40.9,1.,3.43E-08,0.8340,0.17/
      DATA(CF(I,18,15),I=1,5)/   52.3,0.,3.00E-08,1.0300,0.25/
      DATA(CF(I,18,14),I=1,5)/   75.0,1.,8.73E-09,0.3660,0.31/
      DATA(CF(I,18,13),I=1,5)/   91.0,1.,5.78E-09,0.3140,0.34/
      DATA(CF(I,18,12),I=1,5)/  124.3,1.,2.98E-09,0.7030,0.16/
      DATA(CF(I,18,11),I=1,5)/  143.5,1.,7.25E-10,0.2070,0.15/
      DATA(CF(I,18,10),I=1,5)/  422.4,1.,1.40E-09,0.6960,0.13/
      DATA(CF(I,18, 9),I=1,5)/  478.7,1.,4.78E-10,0.1640,0.31/
      DATA(CF(I,18, 8),I=1,5)/  539.0,0.,8.02E-10,0.4390,0.32/
      DATA(CF(I,18, 7),I=1,5)/  618.3,1.,2.88E-10,0.2590,0.27/
      DATA(CF(I,18, 6),I=1,5)/  686.1,1.,2.32E-10,0.3620,0.22/
      DATA(CF(I,18, 5),I=1,5)/  755.7,0.,3.33E-10,0.4120,0.36/
      DATA(CF(I,18, 4),I=1,5)/  854.8,1.,1.27E-10,0.9100,0.13/
      DATA(CF(I,18, 3),I=1,5)/  918.0,1.,5.21E-11,0.7810,0.15/
      DATA(CF(I,18, 2),I=1,5)/ 4120.7,0.,1.66E-11,0.4350,0.33/
      DATA(CF(I,18, 1),I=1,5)/ 4426.2,1.,4.32E-12,0.5540,0.18/
      DATA(CF(I,19,19),I=1,5)/    4.3,1.,2.02E-07,0.2720,0.31/
      DATA(CF(I,19,18),I=1,5)/   31.6,1.,4.01E-08,0.3710,0.22/
      DATA(CF(I,19,17),I=1,5)/   45.8,1.,1.50E-08,0.4330,0.21/
      DATA(CF(I,19,16),I=1,5)/   60.9,1.,1.94E-08,0.8890,0.16/
      DATA(CF(I,19,15),I=1,5)/   82.7,1.,6.95E-09,0.4940,0.18/
      DATA(CF(I,19,14),I=1,5)/   99.4,1.,4.11E-09,0.5400,0.17/
      DATA(CF(I,19,13),I=1,5)/  117.6,1.,2.23E-09,0.5190,0.16/
      DATA(CF(I,19,12),I=1,5)/  154.7,1.,2.15E-09,0.8280,0.14/
      DATA(CF(I,19,11),I=1,5)/  175.8,0.,1.61E-09,0.6420,0.13/
      DATA(CF(I,19,10),I=1,5)/  504.0,1.,1.07E-09,0.6950,0.13/
      DATA(CF(I,19, 9),I=1,5)/  564.7,1.,3.78E-10,0.1730,0.30/
      DATA(CF(I,19, 8),I=1,5)/  629.4,0.,6.24E-10,0.4180,0.33/
      DATA(CF(I,19, 7),I=1,5)/  714.6,1.,2.29E-10,0.2450,0.28/
      DATA(CF(I,19, 6),I=1,5)/  786.6,1.,1.86E-10,0.3440,0.23/
      DATA(CF(I,19, 5),I=1,5)/  861.1,0.,2.69E-10,0.3960,0.37/
      DATA(CF(I,19, 4),I=1,5)/  968.0,1.,1.06E-10,0.9120,0.13/
      DATA(CF(I,19, 3),I=1,5)/ 1053.4,1.,4.24E-11,0.7370,0.16/
      DATA(CF(I,19, 2),I=1,5)/ 4610.9,0.,1.38E-11,0.4160,0.34/
      DATA(CF(I,19, 1),I=1,5)/ 4934.1,1.,3.67E-12,0.5550,0.18/
      DATA(CF(I,20,20),I=1,5)/    6.1,0.,4.40E-07,0.8480,0.33/
      DATA(CF(I,20,19),I=1,5)/   11.9,0.,5.22E-08,0.1510,0.34/
      DATA(CF(I,20,18),I=1,5)/   50.9,1.,2.06E-08,0.4180,0.20/
      DATA(CF(I,20,17),I=1,5)/   67.3,1.,1.72E-08,0.6380,0.19/
      DATA(CF(I,20,16),I=1,5)/   84.5,1.,1.26E-08,1.0100,0.14/
      DATA(CF(I,20,15),I=1,5)/  108.8,1.,4.72E-09,0.5260,0.17/
      DATA(CF(I,20,14),I=1,5)/  127.2,1.,2.89E-09,0.5480,0.17/
      DATA(CF(I,20,13),I=1,5)/  147.2,1.,1.64E-09,0.5520,0.15/
      DATA(CF(I,20,12),I=1,5)/  188.3,1.,1.57E-09,0.7990,0.14/
      DATA(CF(I,20,11),I=1,5)/  211.3,1.,4.32E-10,0.2320,0.14/
      DATA(CF(I,20,10),I=1,5)/  591.9,0.,9.47E-10,0.3110,0.38/
      DATA(CF(I,20, 9),I=1,5)/  657.2,1.,2.98E-10,0.1630,0.31/
      DATA(CF(I,20, 8),I=1,5)/  726.6,0.,4.78E-10,0.3590,0.36/
      DATA(CF(I,20, 7),I=1,5)/  817.6,1.,1.86E-10,0.2440,0.28/
      DATA(CF(I,20, 6),I=1,5)/  894.5,1.,1.56E-10,0.3640,0.22/
      DATA(CF(I,20, 5),I=1,5)/  974.0,0.,2.16E-10,0.3570,0.39/
      DATA(CF(I,20, 4),I=1,5)/ 1087.0,1.,7.70E-11,0.6550,0.15/
      DATA(CF(I,20, 3),I=1,5)/ 1157.0,1.,3.58E-11,0.7360,0.16/
      DATA(CF(I,20, 2),I=1,5)/ 5128.9,0.,1.28E-11,0.5200,0.30/
      DATA(CF(I,20, 1),I=1,5)/ 5469.9,1.,3.08E-12,0.5280,0.19/
      DATA(CF(I,21,21),I=1,5)/    6.6,1.,3.16E-07,0.2040,0.28/
      DATA(CF(I,21,20),I=1,5)/   12.8,1.,8.61E-08,0.1810,0.25/
      DATA(CF(I,21,19),I=1,5)/   24.8,1.,5.08E-08,0.3570,0.24/
      DATA(CF(I,21,18),I=1,5)/   73.5,1.,1.00E-08,0.4530,0.15/
      DATA(CF(I,21,17),I=1,5)/   91.9,1.,6.76E-09,0.4600,0.15/
      DATA(CF(I,21,16),I=1,5)/  110.7,1.,5.27E-09,0.5610,0.17/
      DATA(CF(I,21,15),I=1,5)/  138.0,1.,3.40E-09,0.5600,0.16/
      DATA(CF(I,21,14),I=1,5)/  158.1,1.,2.18E-09,0.6120,0.15/
      DATA(CF(I,21,13),I=1,5)/  180.0,1.,1.26E-09,0.6100,0.14/
      DATA(CF(I,21,12),I=1,5)/  225.1,1.,1.24E-09,0.8520,0.13/
      DATA(CF(I,21,11),I=1,5)/  249.8,1.,3.62E-10,0.3490,0.05/
      DATA(CF(I,21,10),I=1,5)/  687.4,1.,5.52E-10,0.3750,0.28/
      DATA(CF(I,21, 9),I=1,5)/  756.7,1.,5.64E-10,0.8730,0.15/
      DATA(CF(I,21, 8),I=1,5)/  830.8,1.,4.50E-10,1.0500,0.13/
      DATA(CF(I,21, 7),I=1,5)/  927.5,1.,2.73E-10,0.8660,0.15/
      DATA(CF(I,21, 6),I=1,5)/ 1009.0,1.,1.56E-10,0.7150,0.17/
      DATA(CF(I,21, 5),I=1,5)/ 1094.0,0.,1.81E-10,1.1400,0.36/
      DATA(CF(I,21, 4),I=1,5)/ 1213.0,1.,4.29E-11,0.7840,0.15/
      DATA(CF(I,21, 3),I=1,5)/ 1288.0,0.,2.21E-11,0.0270,0.82/
      DATA(CF(I,21, 2),I=1,5)/ 5674.9,1.,4.51E-12,0.9180,0.04/
      DATA(CF(I,21, 1),I=1,5)/ 6033.8,0.,2.03E-12,0.0170,0.70/
      DATA(CF(I,22,22),I=1,5)/    6.8,1.,1.60E-07,0.3600,0.28/
      DATA(CF(I,22,21),I=1,5)/   13.6,0.,2.14E-07,0.8800,0.28/
      DATA(CF(I,22,20),I=1,5)/   27.5,1.,2.85E-08,0.2270,0.21/
      DATA(CF(I,22,19),I=1,5)/   43.3,1.,3.48E-08,0.3900,0.23/
      DATA(CF(I,22,18),I=1,5)/   99.3,1.,1.00E-08,0.5790,0.18/
      DATA(CF(I,22,17),I=1,5)/  119.5,1.,7.01E-09,0.6380,0.17/
      DATA(CF(I,22,16),I=1,5)/  140.8,1.,4.95E-09,0.7170,0.16/
      DATA(CF(I,22,15),I=1,5)/  170.4,1.,2.99E-09,0.6930,0.17/
      DATA(CF(I,22,14),I=1,5)/  192.1,1.,2.10E-09,0.7220,0.16/
      DATA(CF(I,22,13),I=1,5)/  215.9,1.,1.62E-09,0.7650,0.14/
      DATA(CF(I,22,12),I=1,5)/  265.0,1.,1.11E-09,0.8850,0.12/
      DATA(CF(I,22,11),I=1,5)/  291.5,0.,9.09E-10,0.9720,0.06/
      DATA(CF(I,22,10),I=1,5)/  787.8,1.,4.41E-10,0.3590,0.29/
      DATA(CF(I,22, 9),I=1,5)/  863.1,1.,4.39E-10,0.7810,0.17/
      DATA(CF(I,22, 8),I=1,5)/  941.9,1.,3.73E-10,1.0500,0.13/
      DATA(CF(I,22, 7),I=1,5)/ 1044.0,1.,2.28E-10,0.8580,0.15/
      DATA(CF(I,22, 6),I=1,5)/ 1131.0,1.,1.34E-10,0.7570,0.16/
      DATA(CF(I,22, 5),I=1,5)/ 1221.0,0.,1.55E-10,1.1500,0.36/
      DATA(CF(I,22, 4),I=1,5)/ 1346.0,1.,3.80E-11,0.8350,0.14/
      DATA(CF(I,22, 3),I=1,5)/ 1426.0,0.,1.89E-11,0.0280,0.82/
      DATA(CF(I,22, 2),I=1,5)/ 6249.1,1.,4.01E-12,0.9680,0.03/
      DATA(CF(I,22, 1),I=1,5)/ 6625.0,1.,1.62E-12,0.6570,0.14/
      DATA(CF(I,23,23),I=1,5)/    6.7,0.,8.82E-07,0.3590,0.32/
      DATA(CF(I,23,22),I=1,5)/   14.7,0.,3.11E-07,0.4320,0.29/
      DATA(CF(I,23,21),I=1,5)/   29.3,1.,3.50E-08,0.2470,0.25/
      DATA(CF(I,23,20),I=1,5)/   46.7,0.,5.32E-08,1.1100,0.16/
      DATA(CF(I,23,19),I=1,5)/   65.3,1.,8.98E-09,0.1400,0.37/
      DATA(CF(I,23,18),I=1,5)/  128.1,1.,5.87E-09,0.5170,0.17/
      DATA(CF(I,23,17),I=1,5)/  150.6,1.,5.11E-09,0.6790,0.16/
      DATA(CF(I,23,16),I=1,5)/  173.4,1.,3.71E-09,0.7610,0.15/
      DATA(CF(I,23,15),I=1,5)/  205.8,1.,2.24E-09,0.7110,0.17/
      DATA(CF(I,23,14),I=1,5)/  230.5,1.,1.65E-09,0.7640,0.15/
      DATA(CF(I,23,13),I=1,5)/  256.0,1.,1.26E-09,0.7620,0.14/
      DATA(CF(I,23,12),I=1,5)/  308.0,1.,8.86E-10,0.8860,0.12/
      DATA(CF(I,23,11),I=1,5)/  336.3,0.,3.89E-10,0.1420,0.39/
      DATA(CF(I,23,10),I=1,5)/  896.0,1.,3.80E-10,0.4090,0.27/
      DATA(CF(I,23, 9),I=1,5)/  976.0,0.,4.84E-10,0.1730,0.57/
      DATA(CF(I,23, 8),I=1,5)/ 1060.0,1.,2.49E-10,0.6500,0.14/
      DATA(CF(I,23, 7),I=1,5)/ 1168.0,0.,5.91E-10,1.6100,0.18/
      DATA(CF(I,23, 6),I=1,5)/ 1260.0,0.,5.02E-10,2.1200,0.15/
      DATA(CF(I,23, 5),I=1,5)/ 1355.0,1.,5.38E-11,0.1370,0.40/
      DATA(CF(I,23, 4),I=1,5)/ 1486.0,1.,5.56E-11,0.7080,0.10/
      DATA(CF(I,23, 3),I=1,5)/ 1571.0,0.,2.84E-11,0.0240,0.79/
      DATA(CF(I,23, 2),I=1,5)/ 6851.3,0.,2.54E-11,2.9200,0.09/
      DATA(CF(I,23, 1),I=1,5)/ 7246.1,0.,1.32E-11,3.5100,0.07/
      DATA(CF(I,24,24),I=1,5)/    6.8,1.,1.03E-07,0.2170,0.27/
      DATA(CF(I,24,23),I=1,5)/   16.5,0.,2.45E-07,0.3810,0.32/
      DATA(CF(I,24,22),I=1,5)/   31.0,0.,1.09E-07,0.5180,0.27/
      DATA(CF(I,24,21),I=1,5)/   49.1,1.,1.52E-08,0.1820,0.30/
      DATA(CF(I,24,20),I=1,5)/   69.5,0.,3.25E-08,1.3600,0.13/
      DATA(CF(I,24,19),I=1,5)/   90.6,1.,5.50E-09,0.1430,0.37/
      DATA(CF(I,24,18),I=1,5)/  160.2,1.,5.13E-09,0.6570,0.16/
      DATA(CF(I,24,17),I=1,5)/  184.7,1.,3.85E-09,0.7220,0.15/
      DATA(CF(I,24,16),I=1,5)/  209.3,1.,2.81E-09,0.7590,0.15/
      DATA(CF(I,24,15),I=1,5)/  244.4,1.,1.76E-09,0.7320,0.16/
      DATA(CF(I,24,14),I=1,5)/  271.0,1.,1.30E-09,0.7640,0.15/
      DATA(CF(I,24,13),I=1,5)/  298.0,1.,1.02E-09,0.8100,0.13/
      DATA(CF(I,24,12),I=1,5)/  354.8,1.,7.19E-10,0.8870,0.12/
      DATA(CF(I,24,11),I=1,5)/  384.2,1.,1.61E-10,0.1500,0.22/
      DATA(CF(I,24,10),I=1,5)/ 1011.0,1.,4.64E-10,0.9710,0.12/
      DATA(CF(I,24, 9),I=1,5)/ 1097.0,1.,3.31E-10,0.9240,0.14/
      DATA(CF(I,24, 8),I=1,5)/ 1185.0,1.,2.49E-10,0.9310,0.15/
      DATA(CF(I,24, 7),I=1,5)/ 1299.0,1.,1.68E-10,0.9100,0.14/
      DATA(CF(I,24, 6),I=1,5)/ 1396.0,1.,1.01E-10,0.8050,0.15/
      DATA(CF(I,24, 5),I=1,5)/ 1496.0,0.,1.17E-10,1.2100,0.35/
      DATA(CF(I,24, 4),I=1,5)/ 1634.0,1.,2.91E-11,0.8840,0.13/
      DATA(CF(I,24, 3),I=1,5)/ 1721.0,0.,1.45E-11,0.0350,0.80/
      DATA(CF(I,24, 2),I=1,5)/ 7482.0,1.,3.07E-12,0.9670,0.03/
      DATA(CF(I,24, 1),I=1,5)/ 7894.8,1.,1.46E-12,0.1830,0.39/
      DATA(CF(I,25,25),I=1,5)/    7.4,1.,8.56E-08,0.1320,0.26/
      DATA(CF(I,25,24),I=1,5)/   15.6,0.,1.18E-07,0.3590,0.19/
      DATA(CF(I,25,23),I=1,5)/   33.7,0.,8.54E-08,0.3970,0.32/
      DATA(CF(I,25,22),I=1,5)/   51.2,1.,1.80E-08,0.2720,0.18/
      DATA(CF(I,25,21),I=1,5)/   72.4,1.,8.22E-09,0.1610,0.32/
      DATA(CF(I,25,20),I=1,5)/   95.0,0.,2.15E-08,1.5400,0.11/
      DATA(CF(I,25,19),I=1,5)/  119.3,1.,3.65E-09,0.1470,0.37/
      DATA(CF(I,25,18),I=1,5)/  194.5,1.,3.91E-09,0.6990,0.15/
      DATA(CF(I,25,17),I=1,5)/  221.8,1.,2.92E-09,0.7190,0.15/
      DATA(CF(I,25,16),I=1,5)/  248.3,1.,2.23E-09,0.8060,0.14/
      DATA(CF(I,25,15),I=1,5)/  286.0,1.,1.39E-09,0.7350,0.16/
      DATA(CF(I,25,14),I=1,5)/  314.4,1.,1.04E-09,0.7610,0.15/
      DATA(CF(I,25,13),I=1,5)/  343.6,1.,8.28E-10,0.8090,0.13/
      DATA(CF(I,25,12),I=1,5)/  403.0,1.,5.60E-10,0.7870,0.14/
      DATA(CF(I,25,11),I=1,5)/  435.2,1.,1.52E-10,0.2990,0.08/
      DATA(CF(I,25,10),I=1,5)/ 1133.0,1.,4.03E-10,1.0400,0.11/
      DATA(CF(I,25, 9),I=1,5)/ 1244.0,1.,2.74E-10,0.9230,0.14/
      DATA(CF(I,25, 8),I=1,5)/ 1317.0,1.,2.18E-10,0.9900,0.14/
      DATA(CF(I,25, 7),I=1,5)/ 1437.0,1.,1.49E-10,0.9680,0.13/
      DATA(CF(I,25, 6),I=1,5)/ 1539.0,1.,8.70E-11,0.8020,0.15/
      DATA(CF(I,25, 5),I=1,5)/ 1644.0,0.,1.02E-10,1.2200,0.35/
      DATA(CF(I,25, 4),I=1,5)/ 1788.0,1.,2.54E-11,0.8830,0.13/
      DATA(CF(I,25, 3),I=1,5)/ 1880.0,0.,1.28E-11,0.0330,0.81/
      DATA(CF(I,25, 2),I=1,5)/ 8141.0,1.,2.77E-12,1.0100,0.02/
      DATA(CF(I,25, 1),I=1,5)/ 8571.9,1.,1.32E-12,0.2190,0.37/
      DATA(CF(I,26,26),I=1,5)/    7.9,0.,2.52E-07,0.7010,0.25/
      DATA(CF(I,26,25),I=1,5)/   16.2,1.,2.21E-08,0.0330,0.45/
      DATA(CF(I,26,24),I=1,5)/   30.6,0.,4.10E-08,0.3660,0.17/
      DATA(CF(I,26,23),I=1,5)/   54.8,0.,3.53E-08,0.2430,0.39/
      DATA(CF(I,26,22),I=1,5)/   75.0,1.,1.04E-08,0.2850,0.17/
      DATA(CF(I,26,21),I=1,5)/   99.0,1.,1.23E-08,0.4110,0.21/
      DATA(CF(I,26,20),I=1,5)/  125.0,1.,9.47E-09,0.4580,0.21/
      DATA(CF(I,26,19),I=1,5)/  151.1,1.,4.71E-09,0.2800,0.28/
      DATA(CF(I,26,18),I=1,5)/  233.6,1.,3.02E-09,0.6970,0.15/
      DATA(CF(I,26,17),I=1,5)/  262.1,1.,2.34E-09,0.7640,0.14/
      DATA(CF(I,26,16),I=1,5)/  290.0,1.,1.76E-09,0.8050,0.14/
      DATA(CF(I,26,15),I=1,5)/  331.0,1.,1.14E-09,0.7730,0.15/
      DATA(CF(I,26,14),I=1,5)/  361.0,1.,8.66E-10,0.8050,0.14/
      DATA(CF(I,26,13),I=1,5)/  392.0,1.,6.61E-10,0.7620,0.14/
      DATA(CF(I,26,12),I=1,5)/  457.0,1.,4.41E-10,0.6980,0.16/
      DATA(CF(I,26,11),I=1,5)/  489.3,1.,1.18E-10,0.2110,0.15/
      DATA(CF(I,26,10),I=1,5)/ 1262.0,1.,3.61E-10,1.1600,0.09/
      DATA(CF(I,26, 9),I=1,5)/ 1360.0,1.,2.45E-10,0.9780,0.13/
      DATA(CF(I,26, 8),I=1,5)/ 1470.0,1.,1.87E-10,0.9880,0.14/
      DATA(CF(I,26, 7),I=1,5)/ 1582.0,1.,1.33E-10,1.0300,0.12/
      DATA(CF(I,26, 6),I=1,5)/ 1690.0,1.,7.84E-11,0.8480,0.14/
      DATA(CF(I,26, 5),I=1,5)/ 1800.0,0.,8.90E-11,1.2000,0.35/
      DATA(CF(I,26, 4),I=1,5)/ 1960.0,1.,2.29E-11,0.9360,0.12/
      DATA(CF(I,26, 3),I=1,5)/ 2046.0,0.,1.12E-11,0.0340,0.81/
      DATA(CF(I,26, 2),I=1,5)/ 8828.0,1.,2.46E-12,1.0200,0.02/
      DATA(CF(I,26, 1),I=1,5)/ 9277.7,1.,9.79E-13,0.6640,0.14/
      DATA(CF(I,27,27),I=1,5)/    7.9,1.,8.89E-08,0.1270,0.24/
      DATA(CF(I,27,26),I=1,5)/   17.1,1.,5.65E-08,0.1940,0.23/
      DATA(CF(I,27,25),I=1,5)/   33.5,1.,3.06E-08,0.2010,0.22/
      DATA(CF(I,27,24),I=1,5)/   51.3,0.,2.27E-08,0.5740,0.10/
      DATA(CF(I,27,23),I=1,5)/   79.5,0.,1.93E-08,0.1950,0.42/
      DATA(CF(I,27,22),I=1,5)/  102.0,0.,1.27E-08,0.1260,0.47/
      DATA(CF(I,27,21),I=1,5)/  129.0,1.,3.58E-09,0.1940,0.29/
      DATA(CF(I,27,20),I=1,5)/  158.0,0.,1.17E-08,1.9800,0.07/
      DATA(CF(I,27,19),I=1,5)/  186.1,1.,1.78E-09,0.1120,0.42/
      DATA(CF(I,27,18),I=1,5)/  275.0,1.,2.41E-09,0.7390,0.14/
      DATA(CF(I,27,17),I=1,5)/  305.0,1.,1.86E-09,0.7620,0.14/
      DATA(CF(I,27,16),I=1,5)/  336.0,1.,1.41E-09,0.8040,0.14/
      DATA(CF(I,27,15),I=1,5)/  379.0,1.,9.54E-10,0.8130,0.14/
      DATA(CF(I,27,14),I=1,5)/  411.0,1.,7.12E-10,0.8030,0.14/
      DATA(CF(I,27,13),I=1,5)/  444.0,1.,5.34E-10,0.7180,0.15/
      DATA(CF(I,27,12),I=1,5)/  512.0,1.,3.62E-10,0.6580,0.17/
      DATA(CF(I,27,11),I=1,5)/  546.6,1.,1.05E-10,0.2520,0.12/
      DATA(CF(I,27,10),I=1,5)/ 1397.0,1.,3.10E-10,1.1700,0.09/
      DATA(CF(I,27, 9),I=1,5)/ 1486.0,1.,1.56E-10,0.5720,0.15/
      DATA(CF(I,27, 8),I=1,5)/ 1603.0,1.,1.32E-10,0.6820,0.13/
      DATA(CF(I,27, 7),I=1,5)/ 1735.0,1.,9.08E-11,0.5110,0.17/
      DATA(CF(I,27, 6),I=1,5)/ 1846.0,0.,3.45E-10,2.8400,0.11/
      DATA(CF(I,27, 5),I=1,5)/ 1962.0,1.,5.01E-11,0.7140,0.11/
      DATA(CF(I,27, 4),I=1,5)/ 2119.0,1.,1.92E-11,0.1170,0.42/
      DATA(CF(I,27, 3),I=1,5)/ 2219.0,1.,1.95E-11,1.2000,0.00/
      DATA(CF(I,27, 2),I=1,5)/ 9544.0,0.,1.68E-11,3.5200,0.05/
      DATA(CF(I,27, 1),I=1,5)/10012.1,1.,1.45E-12,0.6350,0.15/
      DATA(CF(I,28,28),I=1,5)/    7.6,0.,1.65E-07,0.4520,0.28/
      DATA(CF(I,28,27),I=1,5)/   18.2,0.,8.42E-08,0.6190,0.16/
      DATA(CF(I,28,26),I=1,5)/   35.3,1.,1.89E-08,0.2200,0.21/
      DATA(CF(I,28,25),I=1,5)/   54.9,1.,1.48E-08,0.2160,0.21/
      DATA(CF(I,28,24),I=1,5)/   76.0,0.,1.13E-08,0.5180,0.09/
      DATA(CF(I,28,23),I=1,5)/  108.0,0.,1.16E-08,0.1850,0.44/
      DATA(CF(I,28,22),I=1,5)/  133.0,0.,8.68E-09,0.1380,0.46/
      DATA(CF(I,28,21),I=1,5)/  162.0,1.,2.45E-09,0.1630,0.32/
      DATA(CF(I,28,20),I=1,5)/  193.0,0.,9.24E-09,2.2500,0.05/
      DATA(CF(I,28,19),I=1,5)/  225.0,0.,2.41E-09,0.0270,0.79/
      DATA(CF(I,28,18),I=1,5)/  321.0,1.,1.92E-09,0.7380,0.14/
      DATA(CF(I,28,17),I=1,5)/  352.0,1.,1.50E-09,0.7610,0.14/
      DATA(CF(I,28,16),I=1,5)/  384.0,1.,1.16E-09,0.8030,0.14/
      DATA(CF(I,28,15),I=1,5)/  430.0,1.,8.08E-10,0.8560,0.13/
      DATA(CF(I,28,14),I=1,5)/  464.0,1.,6.09E-10,0.8500,0.13/
      DATA(CF(I,28,13),I=1,5)/  499.0,1.,4.48E-10,0.7180,0.15/
      DATA(CF(I,28,12),I=1,5)/  571.3,1.,3.00E-10,0.6220,0.18/
      DATA(CF(I,28,11),I=1,5)/  607.0,1.,7.90E-11,0.1600,0.19/
      DATA(CF(I,28,10),I=1,5)/ 1541.0,1.,2.78E-10,1.2500,0.08/
      DATA(CF(I,28, 9),I=1,5)/ 1648.0,1.,1.92E-10,1.0400,0.12/
      DATA(CF(I,28, 8),I=1,5)/ 1756.0,1.,1.51E-10,1.1100,0.12/
      DATA(CF(I,28, 7),I=1,5)/ 1894.0,1.,1.05E-10,1.0900,0.11/
      DATA(CF(I,28, 6),I=1,5)/ 2011.0,1.,6.04E-11,0.8490,0.14/
      DATA(CF(I,28, 5),I=1,5)/ 2131.0,0.,6.91E-11,1.2100,0.35/
      DATA(CF(I,28, 4),I=1,5)/ 2295.0,1.,1.84E-11,0.9910,0.11/
      DATA(CF(I,28, 3),I=1,5)/ 2399.0,0.,9.03E-12,0.0420,0.79/
      DATA(CF(I,28, 2),I=1,5)/10290.0,1.,2.61E-12,0.5680,0.16/
      DATA(CF(I,28, 1),I=1,5)/10775.3,1.,1.39E-12,0.7290,0.13/
      end subroutine cfit

END MODULE FITC
