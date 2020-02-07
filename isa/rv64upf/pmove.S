#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_CASE(2, a1, 1, csrwi fcsr, 1; li a0, 0x1234; fssr a1, a0)
  TEST_CASE(3, a0, 0x34, frsr a0)
  TEST_CASE(4, a0, 0x14, frflags a0)
  TEST_CASE(5, a0, 0x01, csrrwi a0, frm, 2)
  TEST_CASE(6, a0, 0x54, frsr a0)
  TEST_CASE(7, a0, 0x14, csrrci a0, fflags, 4)
  TEST_CASE(8, a0, 0x50, frsr a0)

  TEST_PFSGNJS(10, fsgnj.s,  0x12345678, 0x12345678, 0x12345678)
  TEST_PFSGNJS(11, fsgnj.s,  0xedcba988, 0x12345678, 0xedcba988)
  TEST_PFSGNJS(12, fsgnj.s,  0x12345678, 0xedcba988, 0x12345678)
  TEST_PFSGNJS(13, fsgnj.s,  0xedcba988, 0xedcba988, 0xedcba988)

  TEST_PFSGNJS(20, fsgnjn.s, 0xedcba988, 0x12345678, 0x12345678)
  TEST_PFSGNJS(21, fsgnjn.s, 0x12345678, 0x12345678, 0xedcba988)
  TEST_PFSGNJS(22, fsgnjn.s, 0xedcba988, 0xedcba988, 0x12345678)
  TEST_PFSGNJS(23, fsgnjn.s, 0x12345678, 0xedcba988, 0xedcba988)

  TEST_PFSGNJS(30, fsgnjx.s, 0x12345678, 0x12345678, 0x12345678)
  TEST_PFSGNJS(31, fsgnjx.s, 0xedcba988, 0x12345678, 0xedcba988)
  TEST_PFSGNJS(32, fsgnjx.s, 0xedcba988, 0xedcba988, 0x12345678)
  TEST_PFSGNJS(33, fsgnjx.s, 0x12345678, 0xedcba988, 0xedcba988)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
