#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_PA_OP2_S( 2,  fmin.s, 0, 0x40000000, 0x4a000000, 0x40000000 ); #       1.0 = min(       2.5,        1.0 )
  TEST_PA_OP2_S( 3,  fmin.s, 0, 0x8b967333, 0x8b967333, 0x40cccccd ); #   -1235.1 = min(   -1235.1,        1.1 )
  TEST_PA_OP2_S( 4,  fmin.s, 0, 0x8b967333, 0x40cccccd, 0x8b967333 ); #   -1235.1 = min(       1.1,    -1235.1 )
  TEST_PA_OP2_S( 5,  fmin.s, 0, NaRf,             NaRf, 0x8b967333 ); #   -1235.1 = min(       NaR,    -1235.1 )
  TEST_PA_OP2_S( 6,  fmin.s, 0, 0x00aaf31e, 0x4c90fdaa, 0x00aaf31e ); #0.00000001 = min(3.14159265, 0.00000001 )
  TEST_PA_OP2_S( 7,  fmin.s, 0, 0xb8000000, 0xc0000000, 0xb8000000 ); #      -2.0 = min(      -1.0,       -2.0 )

  TEST_PA_OP2_S(12,  fmax.s, 0, 0x4a000000, 0x4a000000, 0x40000000 ); #       2.5 = max(       2.5,        1.0 )
  TEST_PA_OP2_S(13,  fmax.s, 0, 0x40cccccd, 0x8b967333, 0x40cccccd ); #       1.1 = max(   -1235.1,        1.1 )
  TEST_PA_OP2_S(14,  fmax.s, 0, 0x40cccccd, 0x40cccccd, 0x8b967333 ); #       1.1 = max(       1.1,    -1235.1 )
  TEST_PA_OP2_S(15,  fmax.s, 0, 0x8b967333,       NaRf, 0x8b967333 ); #   -1235.1 = max(       NaR,    -1235.1 )
  TEST_PA_OP2_S(16,  fmax.s, 0, 0x4c90fdaa, 0x4c90fdaa, 0x00aaf31e ); #3.14159265 = max(3.14159265, 0.00000001 )
  TEST_PA_OP2_S(17,  fmax.s, 0, 0xc0000000, 0xc0000000, 0xb8000000 ); #      -1.0 = max(      -1.0,       -2.0 )

  #NaR == NaR
  TEST_PA_OP2_S(18,  fmin.s, 0,       NaRf,       NaRf,       NaRf );
  TEST_PA_OP2_S(19,  fmax.s, 0,       NaRf,       NaRf,       NaRf );
  
  #0 == 0
  TEST_PA_OP2_S(20,  fmin.s, 0,          0,          0,          0 );
  TEST_PA_OP2_S(21,  fmax.s, 0,          0,          0,          0 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END