	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	find_substr
	.type	find_substr, @function
find_substr:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	li	a5,-1
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	j	.L2
.L10:
	sw	zero,-28(s0)
	j	.L3
.L7:
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	lbu	a4,0(a5)
	lw	a5,-28(s0)
	lw	a3,-40(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	bne	a4,a5,.L12
	lw	a5,-48(s0)
	addi	a5,a5,-1
	lw	a4,-28(s0)
	bne	a4,a5,.L6
	lw	a5,-24(s0)
	sw	a5,-20(s0)
	j	.L5
.L6:
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L3:
	lw	a4,-28(s0)
	lw	a5,-48(s0)
	blt	a4,a5,.L7
	j	.L5
.L12:
	nop
.L5:
	lw	a4,-20(s0)
	li	a5,-1
	bne	a4,a5,.L13
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L2:
	lw	a4,-24(s0)
	lw	a5,-44(s0)
	blt	a4,a5,.L10
	j	.L9
.L13:
	nop
.L9:
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	find_substr, .-find_substr
	.section	.rodata
	.align	2
.LC0:
	.string	"bcds"
	.align	2
.LC1:
	.string	"1qab9a0bcabcds13"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a3,4
	li	a2,16
	lui	a5,%hi(.LC0)
	addi	a1,a5,%lo(.LC0)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	find_substr
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
