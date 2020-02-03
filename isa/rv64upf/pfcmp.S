#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_PA_CMP_OP_S( 2, feq.s, 0x00, 1, 0xbd1eb852, 0xbd1eb852) # -1.36, -1.36
  TEST_PA_CMP_OP_S( 3, fle.s, 0x00, 1, 0xbd1eb852, 0xbd1eb852)
  TEST_PA_CMP_OP_S( 4, flt.s, 0x00, 0, 0xbd1eb852, 0xbd1eb852)

  TEST_PA_CMP_OP_S( 5, feq.s, 0x00, 0, 0xbd0a3d71, 0xbd1eb852) # -1.37, -1.36
  TEST_PA_CMP_OP_S( 6, fle.s, 0x00, 1, 0xbd0a3d71, 0xbd1eb852)
  TEST_PA_CMP_OP_S( 7, flt.s, 0x00, 1, 0xbd0a3d71, 0xbd1eb852)

  #Check if NaR is equal to NaR 
  TEST_PA_CMP_OP_S( 8, feq.s, 0x00, 0, NaRf,    0)
  TEST_PA_CMP_OP_S( 9, feq.s, 0x00, 1,    0,    0)
  TEST_PA_CMP_OP_S(10, feq.s, 0x00, 1, NaRf, NaRf)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
