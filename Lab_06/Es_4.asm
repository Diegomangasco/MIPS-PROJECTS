	.data
DIM:
	.word 3
matrix:
	.word 1, 0, 0, 0, 2, 0, 0, 0, 3
	.text
	.globl main
main:
	lw $t1, DIM
	#Impostazioni controllo matrice diagonale
	la $t0, matrix
	addi $t2, $0, 1	#contatore di zeri
	addi $t3, $0, 1	#contatore valori
	mul $t5, $t1, $t1	#valore di DIM*DIM
Diagonale:
	bgt $t3, $t5, Finished
	addi $t0, $t0, 4	#prossima cella
	lw $t4, ($t0)
	addi $t3, $t3, 1	#contatore valori incrementato
	bgt $t2, $t1, Reimposta
	bne $t4, $0, Simmetrica
	addi $t2, $t2, 1
	j Diagonale
Reimposta:
	add $t2, $0, 1	#reimposto il contatore di zeri
	j Diagonale
	
	#Impostazioni controllo matrice simmetrica -> 1, 4, 5, 4, 2, 8, 5, 8, 3
	la $t0, matrix
	la $t2, matrix
	mul $t3, $t1, 4	#contatore passi (DIM*4)
	addi $t4, $0, 0	#colonna
	addi $t7, $0, 0	#riga
Simmetrica:
	bge $t4, $t1, Reimposta2
	add $t0, $t0, $t3
	lw $t5, ($t0)	#prendo il secondo 4
	lw $t6, 4($t2)		#prendo il primo 4
	bne $t5, $t6, Finished3
	addi $t2, $t2, 4	#per prendere il primo 5
	add $t0, $t0, $t3 	#porto il puntatore al secondo 4
	addi $t4, $t4, 1
	j Simmetrica
Reimposta2:
	addi $t7, $t7, 1
	bge $t7, $t1, Finished2
	la $t0, matrix
	sll $t0, $t0, $t7	#mi sposto sul primo 4
	addi $t4, $0, 0
	#$t2 è già a posto sul secondo 4
	j Simmetrica
	
Finished:
	li $v0, 1
	li $a0, 2
	syscall
	j End
Finished2:
	li $v0, 1
	li $a0, 1
	syscall
	j End
Finished3:
	li $v0, 1
	li $a0, 0
	syscall
	
End:
	li $v0, 10
	syscall
	.end main
	
	
	
	