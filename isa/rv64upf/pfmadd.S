#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_PA_OP3_S( 2,  fmadd.s, 0, 0x4e000000, 0x40000000, 0x4a000000, 0x40000000); #    3.5 = (1.0  *    2.5) +  1.0       
  TEST_PA_OP3_S( 3,  fmadd.s, 0, 0x746a199a, 0xc0000000, 0x8b967333, 0x40cccccd); # 1236.2 = (-1.0 * 1235.1) +  1.1
  TEST_PA_OP3_S( 4,  fmadd.s, 0, 0xa4000000, 0x48000000, 0xae000000, 0xb8000000); #  -12.0 = (2.0  *   -5.0) + -2.0    

  TEST_PA_OP3_S( 5, fnmadd.s, 0, 0xb2000000, 0x40000000, 0x4a000000, 0x40000000); #   -3.5 = -((1.0  *    2.5) +  1.0)    
  TEST_PA_OP3_S( 6, fnmadd.s, 0, 0x8b95e666, 0xc0000000, 0x8b967333, 0x40cccccd); #-1236.2 = -((-1.0 * 1235.1) +  1.1)   
  TEST_PA_OP3_S( 7, fnmadd.s, 0, 0x5c000000, 0x48000000, 0xae000000, 0xb8000000); #   12.0 = -((2.0  *   -5.0) + -2.0)    

  TEST_PA_OP3_S( 8,  fmsub.s, 0, 0x44000000, 0x40000000, 0x4a000000, 0x40000000); #    1.5 = (1.0  *    2.5) -  1.0    
  TEST_PA_OP3_S( 9,  fmsub.s, 0, 0x74690000, 0xc0000000, 0x8b967333, 0x40cccccd); #   1234 = (-1.0 * 1235.1) -  1.1
  TEST_PA_OP3_S(10,  fmsub.s, 0, 0xa8000000, 0x48000000, 0xae000000, 0xb8000000); #   -8.0 = (2.0  *   -5.0) - -2.0  

  TEST_PA_OP3_S(11, fnmsub.s, 0, 0xbc000000, 0x40000000, 0x4a000000, 0x40000000); #   -1.5 = -((1.0  *    2.5) -  1.0)    
  TEST_PA_OP3_S(12, fnmsub.s, 0, 0x8b970000, 0xc0000000, 0x8b967333, 0x40cccccd); #  -1234 = -((-1.0 * 1235.1) -  1.1)
  TEST_PA_OP3_S(13, fnmsub.s, 0, 0x58000000, 0x48000000, 0xae000000, 0xb8000000); #    8.0 = -((2.0  *   -5.0) - -2.0)  

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END