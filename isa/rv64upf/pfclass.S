
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_FCLASS_S( 2, 0 << 0, 0x40000000 ) #1
  TEST_FCLASS_S( 3, 1 << 0, 0xc0000000 ) #-1
  TEST_FCLASS_S( 4, 1 << 1, 0x80000000 ) #NaR
  TEST_FCLASS_S( 5, 1 << 2, 0x00000000 ) #0

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
