	.data
var: .word 0x3FFFFFF0 
	.text
	.globl main
main:
	lw $t1, var
	sll $t1, $t1, 1
	li $v0, 1
	move $a0, $t1
	syscall
	#move $t2, $t1
	#addi $t2, $t2, 40 va in overflow
	#and $t2, $0
	#addi $t2, $t2, 40
	#add $a0, $t1, $t2 va in overflow
	addiu $t1, $t1, 40
	move $a0, $t1
	syscall
	li $v0, 10
	syscall
	.end main