	.data
	.text
	.globl main
main:
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0
	add $t1, $t1, $t2
	sub $t2, $t1, $t2
	sub $t1, $t1, $t2
	li $v0, 10
	syscall
	.end main
	