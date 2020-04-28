	.data
Var:	.half 7
	.text
	.globl main
main:
	lh $t0, Var
	add $t1, $0, $0	#count = 0
	add $t2, $0, $0	#i = 0
Lab:
	bgt $t2, 16, Next
	andi $t3, $t0, 1	#and tra $t0 e 1
	beq $t3, 1, Count
Step:
	srl $t0, $t0, 1		#prossimo bit
	addi $t2, $t2, 1	#i++
	j Lab
Count:
	addi $t1, $t1, 1	#count++
	j Step
Next:
	move $a0, $t1
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	.end main
	