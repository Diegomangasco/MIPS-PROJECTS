	.data
Dato1:
	.word 5
	.text
	.globl main
main:
	la $t0, Dato1
	lw $t1, ($t0)
	add $a0, $0, $t1
	jal collatz
	addi $a0, $v0, 0
	li $v0, 1
	syscall
	j end
	
	.ent collatz
collatz:
	addi $t2, $0, 1		#counter
ciclo:
	beq $a0, 1, salto		#ciclo per trovare il numero di elementi
	addi $sp, $sp, -4
	sw $ra, ($sp)			#push dell'indirizzo di ritorno
	jal successivo
	lw $ra, ($sp)			#pop
	addi $sp, $sp, 4
	move $a0, $v0
	addi $t2, $t2, 1
	j ciclo
salto:
	move $v0, $t2
	jr $ra
	.end collatz

	.ent successivo
successivo:
	div $t4, $a0, 2
	mfhi $t3
	mflo $v0
	bne $t3, $0, dispari
	jr $ra
dispari:
	add $v0, $0, $a0
	mul $v0, $v0, 3
	addi $v0, $v0, 1
	jr $ra
	.end successivo
	
end:
	li $v0, 10
	syscall
	.end main