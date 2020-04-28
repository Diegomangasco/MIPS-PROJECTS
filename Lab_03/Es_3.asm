	.data
Val1:	.word 136
Val2:	.word 35
Val3:	.word 37
	.text
	.globl main
main:
	lw $t0, Val1
	lw $t1, Val2
	lw $t2, Val3
	
Step1:
	bgt $t0, $t1, Lab1	#if(a>b)
Step2:
	bgt $t0, $t2, Lab2	#if(a>c)
Step3:
	bgt $t1, $t2, Lab3	#if(b>c)
	j Done
Lab1: 
	add $t0, $t0, $t1	#swap
	sub $t1, $t0, $t1
	sub $t0, $t0, $t1
	j Step2
Lab2: 
	add $t0, $t0, $t2
	sub $t2, $t0, $t2
	sub $t0, $t0, $t2
	j Step3
Lab3: 
	add $t1, $t1, $t2
	sub $t2, $t1, $t2
	sub $t1, $t1, $t2
Done:
	li $v0, 1
	move $a0, $t0
	syscall
	move $a0, $t1
	syscall
	move $a0, $t2
	syscall
	li $v0, 10
	syscall
	.end main
	
	
	