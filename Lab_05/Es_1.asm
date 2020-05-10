	.data
array:
	.space 80
	.text
	.globl main
main:
	addi $t0, $0, 1	#n0
	addi $t1, $0, 1	#n1
	addi $t2, $0, 0	#counter
	la $t3, array
Fib:
	bgt $t2, 1 Step
	j Exc
Step:
	add $t4, $t1, $0	#tmp
	add $t1, $t1, $t0	#n1+n0
	sw $t1, ($t3)		
	addi $t2, $t2, 1	#counter++
	addi $t3, $t3, 4	#array++
	move $t0, $t4		#n0 update 
	blt $t2, 20, Step
	j Done
Exc:					#first two numbers
	sw $t1, ($t3)
	addi $t3, $t3, 4	#array++
	addi $t2, $t2, 1	#counter++
	j Fib
Done:
	li $v0, 10
	syscall
	.end main
	
	
	