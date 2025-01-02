#include "arch/el.h"

.section ".text.boot"

.globl _start
_start:
/******************************************************************
 *  Initilize MPID/MPIDR registers for all Cores
 *****************************************************************/
	mrs	    x0, midr_el1
	mrs	    x1, mpidr_el1
	msr	    vpidr_el2, x0
	msr	    vmpidr_el2, x1

/******************************************************************
 *  Disable coprocessor traps for all Cores
 *****************************************************************/
	mov	    x0, #0x33ff
	msr	    cptr_el2, x0						// Disable coprocessor traps to EL2
	msr	    hstr_el2, xzr						// Disable coprocessor traps to EL2
	mov	    x0, #3 << 20
	msr	    cpacr_el1, x0						// Enable FP/SIMD at EL1

/******************************************************************
 *  Enable CNTP for EL1
 *****************************************************************/
	mrs	    x0, cnthctl_el2
	orr	    x0, x0, #3
	msr	    cnthctl_el2, x0
	msr	    cntvoff_el2, xzr

/******************************************************************
 *  Initialize HCR_EL2 so EL1 is 64 bits for all Cores
 *****************************************************************/
	ldr	    x0, =HCR_AARCH64
	msr	    hcr_el2, x0

/******************************************************************
 *  Initialize SCTLR_EL1 for all Cores
 *****************************************************************/
	ldr	    x0, =(SCTLR_RES0 | SCTLR_RES1 | SCTLR_EE_LITTLE_ENDIAN | SCTLR_EOE_LITTLE_ENDIAN | SCTLR_I_CACHE_DISABLED | SCTLR_D_CACHE_DISABLED | SCTLR_MMU_DISABLED)
	msr	    sctlr_el1, x0

/******************************************************************
 *  Core specific initialization
 *****************************************************************/
    mrs     x0, mpidr_el1
    and     x0, x0, #0x3    // Get the core id

    cbz     x0, core_0_init
    // Let the other cores sleep
	b       _hang


core_0_init:
    // Set the stack pointers
    ldr	    x1, =__EL0_stack_core0
	ldr     x2, =__EL1_stack_core0
	ldr	    x3, =__EL2_stack_core0
	msr	    sp_el0, x1
	msr     sp_el1, x2
	mov	    sp, x3
    b       el_transition


/******************************************************************
 *  EL Transition to EL1
 *****************************************************************/
 el_transition:
    mrs     x0, CurrentEL
    lsr	    x0, x0, #2 // Shift off the first two bits. They're always zero
    cmp     x0, #3
    beq     el3_ret
    cmp     x0, #2
    beq     el2_ret
    b       _hang


 el3_ret:

/******************************************************************
 *  Initialize SCR_EL3 for all Cores
 *****************************************************************/
    ldr     x0, =(SCR_RES1 | SCR_AARCH64 | SCR_NON_SECURE)
    msr     scr_el3, x0

/******************************************************************
 *  Drop to EL2
 *****************************************************************/
    ldr     x0, =(SPSR_PROC_STATE_MASKED | SPSR_SERROR_MASKED | SPSR_IRQ_MASKED | SPSR_FIQ_MASKED | SPSR_EL2 | SPSR_SP_DEDICATED)
    msr     spsr_el3, x0
    adr     x0, el2_ret        
    msr     elr_el3, x0

    eret 


el2_ret:

/******************************************************************
 *  Drop to EL1
 *****************************************************************/
    ldr     x0, =(SPSR_PROC_STATE_MASKED | SPSR_SERROR_MASKED | SPSR_IRQ_MASKED | SPSR_FIQ_MASKED | SPSR_EL1 | SPSR_SP_DEDICATED)
    msr     spsr_el2, x0
    adr     x0, el1_ret        
    msr     elr_el2, x0

    eret



el1_ret:

/******************************************************************
 *  Start the kernel code
 *****************************************************************/
    mrs     x0, mpidr_el1
    and     x0, x0, #0x3    // Get the core id

    cbz     x0, __main_core_start
	cmp     x0, #1
	beq     __worker_core_start
	cmp     x0, #2
	beq     __worker_core_start
	cmp     x0, #3
	beq     __worker_core_start
	b       _hang   // We should never get here


__main_core_start:
    // Clear bss section to zero
	adr     x0, __bss_start
    adr     x1, __bss_end
    // Check for empty bss
    cmp     x0, x1
    beq     1f
__bss_zero_loop:
    str     xzr, [x0], #8
    cmp     x1, x0
    bhi     __bss_zero_loop
1:
    bl      system_init

    // Wake up the worker cores
    // ldr     x0, _start
    // ldr     x1, #CPU1_RESUME_ADDR
    // str     x0, [x1]
    // ldr     x1, #CPU2_RESUME_ADDR
    // str     x0, [x1]
    // ldr     x1, #CPU2_RESUME_ADDR
    // str     x0, [x1]
    // sev

    // Start running the kernel
    bl      kernel_main
    b       _hang


__worker_core_start:
    bl      kernel_main
    b       _hang


_hang:
    wfe
    b       _hang
