	.data
Anni:
	.word 1945, 2008, 1800, 2006, 1748, 1600 
Risultato:
	.space 6
Lunghezza:
	.word 6
	.text
	.globl main
main:
	lw $a2, Lunghezza
	la $a0, Anni
	la $a1, Risultato
	jal bisestile
	li $v0, 10
	syscall
	.end bisestile
	
	.ent bisestile
bisestile:
	addi $t0, $0, 0
	addi $t3, $0, 0
	addi $t4, $0, 100
	addi $t5, $0, 400
	addi $t6, $0, 4
ciclo:
	beq $t3, $a2, end
	lw $t1, ($a0)
	div $t1, $t4
	mfhi $t2
	bne $t2, 0, dividiPerQuattro
	div $t1, $t5
	mfhi $t2
	bne $t2, 0, false
	addi $t0, $t0, 1
	sb $t0, ($a1)
	j nuovoCiclo
	
dividiPerQuattro:
	div $t1, $t6
	mfhi $t2
	bne $t2, 0, false
	addi $t0, $t0, 1
	sb $t0, ($a1)
	j nuovoCiclo
	
nuovoCiclo:
	addi $a0, $a0, 4
	addi $a1, $a1, 1
	add $t0, $0, $0
	addi $t3, $t3, 1
	j ciclo
	
false:
	sb $t0, ($a1)
	j nuovoCiclo
	
end:
	jr $ra
	.end bisestile