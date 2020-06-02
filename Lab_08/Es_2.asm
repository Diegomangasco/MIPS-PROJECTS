	.data
Dato1:
	.word 5
	.text
	.globl main
main:
	la $t0, Dato1
	lw $t1, ($t0)
	addi $t2, $0, 0
	add $a0, $0, $t1
ciclo:
	bgt $t2, 2, end		#ciclo per trovare i tre successivi
	jal successivo
	addi $t2, $t2, 1
	move $a0, $v0
	j ciclo

	.ent successivo
successivo:
	div $t4, $a0, 2
	mfhi $t3
	mflo $v0
	bne $t3, $0, dispari
risultato:
	move $a0, $v0
	li $v0, 1
	syscall
	move $v0, $a0
	jr $ra
dispari:
	add $v0, $0, $a0
	mul $v0, $v0, 3
	addi $v0, $v0, 1
	j risultato
	.end successivo
	
end:
	li $v0, 10
	syscall
	.end main