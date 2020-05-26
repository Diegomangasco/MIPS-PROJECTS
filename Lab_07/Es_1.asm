	.data
Lato:
	.word 8
Asterisco:
	.asciiz "*"
ACapo:
	.asciiz "\n"
	.text
	.globl main
main:
	lw $t0, Lato
	move $a1, $t0	#passo il lato
	jal triangolo
	jal quadrato
	j end
	
triangolo:
	addi $t1, $0, 0
	add $t2, $a1 , 0
	la $a0, Asterisco
cicloEst:
	beq $t1, $t2, saltoAlMain	#se ho finito il triangolo torno
	addi $t3, $t1, 1	#quanti asterischi stampare
	addi $t4, $0, 0
	addi $t1, $t1, 1
	li $v0, 4
	la $a0, ACapo
	syscall
	la $a0, Asterisco
cicloInt:
	beq $t4, $t3, cicloEst
	li $v0, 4	#print String
	syscall
	addi $t4, $t4, 1
	j cicloInt
	
quadrato:
	addi $t1, $0, 0
	add $t2, $a1, 0
cicloEst2:
	beq $t1, $t2, saltoAlMain
	addi $t1, $t1, 1
	addi $t4, $0,0
	li $v0, 4
	la $a0, ACapo
	syscall
	la $a0, Asterisco
cicloInt2:
	beq $t4, $t2, cicloEst2
	li $v0, 4
	syscall
	addi $t4, $t4, 1
	j cicloInt2
	
saltoAlMain:
	jr $ra
	
end:
	li $v0, 10
	syscall
	.end main

	
	
	
	
	