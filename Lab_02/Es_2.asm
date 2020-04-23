	.data
var1:	.byte 'm'
var2:	.byte 'i'
var3:	.byte 'p'
var4:	.byte 's'
var5:	.byte 0
	.text
	.globl main
main:
	lb $t0, var1
	lb $t1, var2
	lb $t2, var3
	lb $t3, var4
	addi $t0, $t0, -32
	addi $t1, $t1, -32
	addi $t2, $t2, -32
	addi $t3, $t3, -32
	li $v0,4
	la $a0, var5
	syscall
	li $v0, 10
	syscall
	.end main