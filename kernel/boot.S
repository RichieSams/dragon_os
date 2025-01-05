#include "arch/el.h"

.section ".text.boot"

.globl _start
_start:
    // Set the stack pointers
    ldr	    x1, =__EL0_stack_core0
	ldr     x2, =__EL1_stack_core0
	ldr	    x3, =__EL2_stack_core0
	msr	    sp_el0, x1
	msr     sp_el1, x2
	mov	    sp, x3

/******************************************************************
 *  EL Transition to EL1
 *****************************************************************/
 el_transition:
    mrs     x0, CurrentEL
    lsr	    x0, x0, #2 // Shift off the first two bits. They're always zero
    cmp     x0, #3
    beq     _hang // The bootloader should start us already in EL2
    cmp     x0, #2
    beq     el2_ret
    b       _hang


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
 *  Initialize the system
 *****************************************************************/
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


/******************************************************************
 *  Start the kernel code
 *****************************************************************/
    // Start running the kernel
    b       kernel_main


/******************************************************************
 *  Misc
 *****************************************************************/

_hang:
    wfe
    b       _hang
