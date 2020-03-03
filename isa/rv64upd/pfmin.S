#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

#if __riscv_xlen == 32
    # Replace the function with the 32-bit variant defined in test_macros.h
    #undef TEST_PA_OP2_D
    #define TEST_PA_OP2_D TEST_PA_OP2_D32
#endif

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_PA_OP2_D( 2,  fmin.d, 0, 0x4000000000000000, 0x4500000000000000, 0x4000000000000000); #        1.0 = min(       2.5,        1.0)
  TEST_PA_OP2_D( 3,  fmin.d, 0, 0x9B96733333333340, 0x9B96733333333340, 0x4066666666666680); #    -1235.1 = min(   -1235.1,        1.1)
  TEST_PA_OP2_D( 4,  fmin.d, 0, 0x9B96733333333340, 0x4066666666666680, 0x9B96733333333340); #    -1235.1 = min(       1.1,    -1235.1)
  TEST_PA_OP2_D( 5,  fmin.d, 0,               NaRd,               NaRd, 0x9B96733333333340); #        NaR = min(       NaR,    -1235.1)
  TEST_PA_OP2_D( 6,  fmin.d, 0, 0x06ABCC77118461D0, 0x46487ED4F2353C40, 0x06ABCC77118461D0); # 0.00000001 = min(3.14159265, 0.00000001)
  TEST_PA_OP2_D( 7,  fmin.d, 0, 0xBC00000000000000, 0xC000000000000000, 0xBC00000000000000); #       -2.0 = min(      -1.0,       -2.0)

  TEST_PA_OP2_D(12,  fmax.d, 0, 0x4500000000000000, 0x4500000000000000, 0x4000000000000000); #        2.5 = max(       2.5,        1.0)
  TEST_PA_OP2_D(13,  fmax.d, 0, 0x4066666666666680, 0x9B96733333333340, 0x4066666666666680); #        1.1 = max(   -1235.1,        1.1)
  TEST_PA_OP2_D(14,  fmax.d, 0, 0x4066666666666680, 0x4066666666666680, 0x9B96733333333340); #        1.1 = max(       1.1,    -1235.1)
  TEST_PA_OP2_D(15,  fmax.d, 0, 0x9B96733333333340,               NaRd, 0x9B96733333333340); #    -1235.1 = max(       NaR,    -1235.1)
  TEST_PA_OP2_D(16,  fmax.d, 0, 0x46487ED4F2353C40, 0x46487ED4F2353C40, 0x06ABCC77118461D0); # 3.14159265 = max(3.14159265, 0.00000001)
  TEST_PA_OP2_D(17,  fmax.d, 0, 0xC000000000000000, 0xC000000000000000, 0xBC00000000000000); #       -1.0 = max(      -1.0,       -2.0)

  #NaR == NaR
  TEST_PA_OP2_D(18,  fmin.d, 0, NaRd, NaRd, NaRd);
  TEST_PA_OP2_D(19,  fmax.d, 0, NaRd, NaRd, NaRd);
  
  #0 == 0
  TEST_PA_OP2_D(20,  fmin.d, 0,    0,    0,    0);
  TEST_PA_OP2_D(21,  fmax.d, 0,    0,    0,    0);

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
