RIGHE = 4 
COLONNE = 5                 
	.data 
matrice: .byte 0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62 
	.text 
	.globl main 
	.ent main 
main: 
	la $a0, matrice 
	li $a1, 12 
	li $a2, RIGHE 
	li $a3, COLONNE 
	jal contaVicini 
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	.end main 
	
	.ent contaVicini
contaVicini:
	mul $t0, $a2, $a3
	add $t5, $0, $a0
	div $a1, $t0 	#pos/(r*c) -> hi: colonna, lo: riga
	mfhi $t0
	mflo $t6
	add $t5, $t5, $t0	#mi sposto sulla n-esima colonna
	addi $t1, $0, 0
posizionamento:
	beq $t1, $t6, continua	#mi posiziono alla giusta riga
	add $t5, $t5, $a3	
	add $t1, $t1, 1
	j posizionamento
	addi $t5, $t5, -1
	addi $t4, $0, 0
	addi $t1, $0, 0
	addi $t2, $0, 0
ciclo:
	bne $t4, 3, return
	bne $t1, 3, cambioRiga
	lb $t3, ($t5)
	add $t2, $t2, $t3	#sommatore
	addi $t1, $t1, 1
	add $t5, $t5, 1
	j primoCiclo
cambioRiga:				#la seconda riga la gestisco a parte prima di passare alla terza
	addi $t4, $t4, 1
	addi $t5, $t5, -1
	add $t5, $t5, $a3
	addi $t5, $t5, -1
	lb $t3, ($t5)
	add $t2, $t2, $t3
	lb $t3, 2($t5)
	add $t2, $t2, $t3
	addi $t1, $0, 0
	addi $t5, $t5, $a3
	addi $t4, $t4, 1
	j ciclo
return:
	move $v0, $t2
	jr $ra
	
	
	