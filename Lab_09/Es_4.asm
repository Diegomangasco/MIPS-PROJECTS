DIM = 5
	.data 
vet1: 
	.word 56, 12, 98, 129, 58 
vet2:    
	.word 1, 0, 245, 129, 12 
risultato: 
	.space DIM 
	.text 
	.globl main 
	.ent main 
main: 
	la $a0, vet1 
	la $a1, vet2 
	la $a2, risultato 
	li $a3, DIM 
	jal CalcolaDistanzaH 
	li $v0, 10
	syscall
	.end main
	
	.ent CalcolaDistanzaH
CalcolaDistanzaH:
	addi $t0, $0, 0
ciclo:
	beq $t0, $a3, end
	addi $t0, $t0, 1
	lw $t1, ($a0)
	lw $t2, ($a1)
	beq $t1, $t2, uguali
	addi $t3, $0, 0
	addi $t4, $0, 1
	addi $t7, $0, 0
cicloInt:
	beq $t3, 32, valuta
	addi $t3, $t3, 1
	and $t5, $t1, $t4
	and $t6, $t2, $t4
	beq $t5, $t6, zero
	addi $t7, $t7, 1
	srl $t1, 1
	srl $t2, 1
	j cicloInt
	
uguali:
	sw $0, ($a2)
	j nuovoCiclo
valuta:
	sw $t7, ($a2)
	j nuovoCiclo
zero:
	srl $t1, 1
	srl $t2, 1
	j cicloInt
nuovoCiclo:
	addi $a0, $a0, 4
	addi $a1, $a1, 4
	j ciclo
	
end
	jr $ra
	.end CalcolaDistanzaH