	.data
Vettore:
	.word 5, 2, 4, 3
	.text
	.globl main
main:
	la $t0, Vettore
	lw $a0, ($t0)
	lw $a1, 4($t0)
	lw $a2, 8($t0)
	lw $a3, 12($t0)
	jal det2x2
	add $a0, $0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	.end main
	
	.ent det2x2
det2x2:
	mul $t1, $a0, $a3
	mul $t2, $a1, $a2
	sub $v0, $t1, $t2
	jr $ra
	.end det2x2