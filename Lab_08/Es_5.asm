	.data
Matrix:
	.word 1, 2, 3, 1, 2, 3, 1, 2, 3
	.text
	.globl main
main:
	la $t0, Matrix
	lw $a0, ($t0)
	lw $a1, 4($t0)
	lw $a2, 8($t0)
	lw $a3, 12($t0)
	addi $sp, $sp, -20
	addi $t0, $t0, 16
	lw $t1, ($t0)
	sw $t1, ($sp)
	addi $t0, $t0, 4
	lw $t1, ($t0)
	sw $t1, 4($sp)
	addi $t0, $t0, 4
	lw $t1, ($t0)
	sw $t1, 8($sp)
	addi $t0, $t0, 4
	lw $t1, ($t0)
	sw $t1, 12($sp)
	addi $t0, $t0, 4
	lw $t1, ($t0)
	sw $t1, 16($sp)
	jal det3x3
	addi $sp, $sp, 20
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	.end main
	
	.ent det3x3
det3x3:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	move $t5, $a0
	move $t6, $a1
	move $t7, $a2
	move $t8, $a3
	addi $t1, $0, 0
	addi $t4, $0, 0
ciclo:
	bgt $t1, 2, salto
	beq $t1, 0, caso1
	beq $t1, 1, caso2
	addi $t1, $t1, 1
	move $a0, $t8
	lw $a1, 4($sp)
	lw $a2, 12($sp)
	lw $a3, 16($sp)
	jal det2x2
	mul $v0, $v0, $t7
	add $t4, $t4, $v0
	j ciclo
caso1:
	addi $t1, $t1, 1
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 16($sp)
	lw $a3, 20($sp)
	jal det2x2
	mul $v0, $v0, $t5
	add $t4, $t4, $v0
	j ciclo
caso2:
	addi $t1, $t1, 1
	move $a0, $t8
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	lw $a3, 20($sp)
	jal det2x2
	mul $v0, $v0, $t6
	sub $t4, $t4, $v0
	j ciclo
	
salto:
	move $v0, $t4
	lw $ra, ($sp)
	addi $sp, $sp, 4
	jr $ra
	.end det3x3
	
	.ent det2x2
det2x2:
	mul $t2, $a0, $a3
	mul $t3, $a1, $a2
	sub $v0, $t2, $t3
	jr $ra
	.end det2x2
