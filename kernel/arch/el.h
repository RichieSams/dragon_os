#pragma once

/******************************************************************
 * SCTLR_EL1, System Control Register (EL1), Page 2654 of AArch64-Reference-Manual.
 *****************************************************************/
#define SCTLR_RES0                      ((0 << 31) | (0 << 30) | (0 << 27) | (0 << 21) | (0 << 17) | (0 << 13) | (0 << 10) | (0 << 6))
#define SCTLR_RES1                      ((1 << 29) | (1 << 28) | (1 << 23) | (1 << 22) | (1 << 20) | (1 << 11))
#define SCTLR_EE_LITTLE_ENDIAN          (0 << 25)
#define SCTLR_EE_BIG_ENDIAN             (1 << 25)
#define SCTLR_EOE_LITTLE_ENDIAN         (0 << 24)
#define SCTLR_EOE_BIG_ENDIAN            (0 << 24)
#define SCTLR_WRITE_MEM_EXECUTABLE      (0 << 19)
#define SCTLR_WRITE_MEM_NOT_EXECUTABLE  (1 << 19)
#define SCTLR_TRAP_WFE_ENABLED          (0 << 18)
#define SCTLR_TRAP_WFE_DISABLED         (1 << 18)
#define SCTLR_TRAP_WFI_ENABLED          (0 << 16)
#define SCTLR_TRAP_WFI_DISABLED         (1 << 16)
#define SCTLR_TRAP_UTC_ENABLED          (0 << 15)
#define SCTLR_TRAP_UTC_DISABLED         (1 << 15)
#define SCTLR_TRAP_DZE_ENABLED          (0 << 14)
#define SCTLR_TRAP_DZE_DISABLED         (1 << 14)
#define SCTLR_I_CACHE_DISABLED          (0 << 12)
#define SCTLR_I_CACHE_ENABLED           (1 << 12)
#define SCTLR_TRAP_UMA_ENABLED          (0 << 9)
#define SCTLR_TRAP_UMA_DISABLED         (1 << 9)
#define SCTLR_SETEND_ENABLED            (0 << 8)
#define SCTLR_SETEND_DISABLED           (1 << 8)
#define SCTLR_IT_ENABLED                (0 << 7)
#define SCTLR_IT_UNDEFINED              (1 << 7)
#define SCTLR_MEM_BAR_AARCH32_DISABLED  (0 << 5)
#define SCTLR_MEM_BAR_AARCH32_ENABLED   (1 << 5)
#define SCTLR_SP_ALIGN_CHK_EL0_DISABLED (0 << 4)
#define SCTLR_SP_ALIGN_CHK_EL0_ENABLED  (1 << 4)
#define SCTLR_SP_ALIGN_CHK_EL1_DISABLED (0 << 3)
#define SCTLR_SP_ALIGN_CHK_EL1_ENABLED  (1 << 3)
#define SCTLR_D_CACHE_DISABLED          (0 << 2)
#define SCTLR_D_CACHE_ENABLED           (1 << 2)
#define SCTLR_ALIGN_CHK_DISABLED        (0 << 1)
#define SCTLR_ALIGN_CHK_ENABLED         (1 << 1)
#define SCTLR_MMU_DISABLED              (0 << 0)
#define SCTLR_MMU_ENABLED               (1 << 0)

/******************************************************************
 * HCR_EL2, Hypervisor Configuration Register (EL2), Page 2487 of AArch64-Reference-Manual.
 *****************************************************************/
#define HCR_AARCH64 (1 << 31)

/******************************************************************
 * SCR_EL3, Secure Configuration Register (EL3), Page 2648 of AArch64-Reference-Manual.
 *****************************************************************/
#define SCR_RES1       (3 << 4)
#define SCR_AARCH64    (1 << 10)
#define SCR_NON_SECURE (1 << 0)

#define SCR_VAL

/******************************************************************
 * SPSR_EL3 / SPSR_EL2, Saved Program Status Register (EL3) Page 389 of AArch64-Reference-Manual.
 *****************************************************************/
#define SPSR_PROC_STATE_MASKED   (1 << 9)
#define SPSR_PROC_STATE_UNMASKED (0 << 9)
#define SPSR_SERROR_MASKED       (1 << 8)
#define SPSR_SERROR_UNMASKED     (0 << 8)
#define SPSR_IRQ_MASKED          (1 << 7)
#define SPSR_IRQ_UNMASKED        (0 << 7)
#define SPSR_FIQ_MASKED          (1 << 6)
#define SPSR_FIQ_UNMASKED        (0 << 6)
#define SPSR_EL0                 (0 << 2)
#define SPSR_EL1                 (1 << 2)
#define SPSR_EL2                 (1 << 3)
#define SPSR_SP_EL0              (0 << 0)
#define SPSR_SP_DEDICATED        (1 << 0)
