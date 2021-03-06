# See LICENSE for license details.

#*****************************************************************************
# fcvt.S
#-----------------------------------------------------------------------------
#
# Test fcvt.d.{wu|w|lu|l}, fcvt.s.d, and fcvt.d.s instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

#if __riscv_xlen == 32
    # Replace the function with the 32-bit variant defined in test_macros.h
    #undef TEST_INT_PA_OP_D
    #define TEST_INT_PA_OP_D TEST_INT_PA_OP_D32

    #undef TEST_FCVT_S_D
    #define TEST_FCVT_S_D TEST_PFCVT_S_D32
#endif

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_INT_PA_OP_D(2,  fcvt.d.w, 0x4400000000000000,  2);# 2.0
  TEST_INT_PA_OP_D(3,  fcvt.d.w, 0xBC00000000000000, -2);#-2.0

  TEST_INT_PA_OP_D(4, fcvt.d.wu, 0x4400000000000000,  2);# 2.0
  TEST_INT_PA_OP_D(5, fcvt.d.wu, 0X7BFFFFFFFE000000, -2);# 4294967294

#if __riscv_xlen >= 64
  TEST_INT_PA_OP_D(6,  fcvt.d.l, 0x4400000000000000,  2);# 2.0
  TEST_INT_PA_OP_D(7,  fcvt.d.l, 0xBC00000000000000, -2);#-2.0

  TEST_INT_PA_OP_D(8, fcvt.d.lu, 0x4400000000000000,  2);# 2.0
  TEST_INT_PA_OP_D(9, fcvt.d.lu, 0x7FC0000000000000, -2);# 1.8446744073709552e19
#endif

  TEST_PFCVT_S_D(10, 0xBE00000000000000, 0xBE00000000000000) #-1.5
  TEST_PFCVT_D_S(11, 0xBC000000, 0xBC000000)                 #-1.5

#if __riscv_xlen >= 64
  TEST_CASE(12, a0, 0x7FFD000000000000,
    la a1, test_data;
    ld a2, 0(a1);
    fmv.d.x f2, a2;
    fcvt.s.d f2, f2;
    fcvt.d.s f2, f2;
    fmv.x.d a0, f2;
  )
#endif

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

test_data:
  .dword 0x7FFCFFFFFFFF8004

RVTEST_DATA_END
