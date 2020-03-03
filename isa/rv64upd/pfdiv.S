# See LICENSE for license details.

#*****************************************************************************
# fdiv.S
#-----------------------------------------------------------------------------
#
# Test f{div|sqrt}.d instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

#if __riscv_xlen == 32
    # Replace the functions with the 32-bit variants defined in test_macros.h
    #undef TEST_PA_OP2_D
    #define TEST_PA_OP2_D TEST_PA_OP2_D32

    #undef TEST_PA_OP1_D
    #define TEST_PA_OP1_D TEST_PA_OP1_D32
#endif

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_PA_OP2_D( 2,  fdiv.d, 0, 0x409F76FDB0E0FB0C, 0x46487ED4F2353C40, 0x456FC2A27C6C3740);#1.1557273520668288 = 3.14159265/2.71828182
  TEST_PA_OP2_D( 3,  fdiv.d, 0, 0xC001D2F079B596D5, 0x9B97000000000000, 0x64698CCCCCCCCCC0);#-0.9991093838555584 = -1234/1235.1
  TEST_PA_OP2_D( 4,  fdiv.d, 0, 0x46487ED4F2353C40, 0x46487ED4F2353C40, 0x4000000000000000);#3.14159265 = 3.14159265/1.0

  TEST_PA_OP1_D( 5,  fsqrt.d, 0,    0x4316FE245BD61EB4, 0x46487ED4F2353C40);#1.7724538498928541 = sqrt(3.14159265)
  TEST_PA_OP1_D( 6,  fsqrt.d, 0,    0x5A40000000000000, 0x6A71000000000000);#100 = sqrt(10000)

  TEST_PA_OP1_D( 7,  fsqrt.d, 0,               NaRd, 0xC000000000000000);#NaR = sqrt(-1.0)

  TEST_PA_OP1_D( 8,  fsqrt.d, 0,    0x4E89D133A59D3D32, 0x5D58000000000000);#13.076696830622021 = sqrt(171.0)

  TEST_PA_OP1_D( 9,  fsqrt.d, 0,    0x1948F1381C6FF316, 0x09594DFC70AA1050);#0.00040099251863345283320230749702 = sqrt(1.60795e-7)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
