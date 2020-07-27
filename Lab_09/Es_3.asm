NUM = 5 
DIM = NUM * 4 
SCONTO = 30 
ARROTONDA = 1 
	.data 
prezzi: .word 39, 1880, 2394, 1000, 1590 
scontati: .space DIM 
	.text 
	.globl main 
	.ent main 
main: 
	la $a0, prezzi 
	la $a1, scontati 
	li $a2, NUM 
	li $a3, SCONTO 
	li $t0, ARROTONDA 
	subu $sp, 4         
	sw $t0, ($sp) 
	jal calcola_sconto 
	addi $sp, $sp, 4
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	.end main
	
	.ent calcola_sconto
calcola_sconto:
	lw $t0, ($sp)
	addi $t1, $0, 0
	addi $t4, $0, 100
	addi $v0, $0, 0
ciclo:
	beq $t1, $a2, end
	addi $t1, $t1, 1	#counter++
	lw $t2, ($a0)
	addi $a0, $a0, 4
	mul $t3, $a3, $t2
	div $t3, $t4
	mfhi $t5
	mflo $t6
	div $t7, $t4, 2
	blt $t7, $t5, controlloArr
continua:
	sw $t6, ($a1)
	addi $a1, $a1, 4
	add $v0, $v0, $t6
	j ciclo
	
controlloArr:
	beq $t0, 1, aggiungi
	j continua
aggiungi:
	addi $t6, $t6, 1
	j continua
end:
	jr $ra
	.end calcola_sconto
	
	

	
	