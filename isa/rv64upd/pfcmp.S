#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

#if __riscv_xlen == 32
    # Bypass the tests as using the 32 bit varient is currently not possible
    #undef TEST_PA_CMP_OP_D
    #define TEST_PA_CMP_OP_D TEST_PA_CMP_OP_D32
#endif

  TEST_PA_CMP_OP_D( 2, feq.d, 0x00, 1, 0xBE8F5C28F5C28F40, 0xBE8F5C28F5C28F40) # -1.36, -1.36
  TEST_PA_CMP_OP_D( 3, fle.d, 0x00, 1, 0xBE8F5C28F5C28F40, 0xBE8F5C28F5C28F40)
  TEST_PA_CMP_OP_D( 4, flt.d, 0x00, 0, 0xBE8F5C28F5C28F40, 0xBE8F5C28F5C28F40)

  TEST_PA_CMP_OP_D( 5, feq.d, 0x00, 0, 0xBE851EB851EB8500, 0xBE8F5C28F5C28F40) # -1.37, -1.36
  TEST_PA_CMP_OP_D( 6, fle.d, 0x00, 1, 0xBE851EB851EB8500, 0xBE8F5C28F5C28F40)
  TEST_PA_CMP_OP_D( 7, flt.d, 0x00, 1, 0xBE851EB851EB8500, 0xBE8F5C28F5C28F40)

  #Check if NaR is equal to NaR 
  TEST_PA_CMP_OP_D( 8, feq.d, 0x00, 0, NaRd,    0)
  TEST_PA_CMP_OP_D( 9, feq.d, 0x00, 1,    0,    0)
  TEST_PA_CMP_OP_D(10, feq.d, 0x00, 1, NaRd, NaRd)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
