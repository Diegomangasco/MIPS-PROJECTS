	.data
matrix:
	.word 	154, 123, 109, 86, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0
	.text
	.globl main
main:
	la $t0, matrix
	li $t1, 0	#counter_riga
	li $t2, 0	#counter_colonna
	li $t3, 0	#sommatore
Riga:
	beq $t2, 4, Store
	lw $t4, ($t0)
	add $t3, $t3, $t4
	addi $t0, $t0, 4	#t0++
	addi $t2, $t2, 1	#counter_colonna++
	j Riga
Store:					#memorizzo valori sulla colonna
	sw $t3, ($t0)
	addi $t0, $t0, 4	#$t0++
	addi $t1, $t1, 1	#counter_riga++
	li $t2, 0			#counter_colonna = 0
	li $t3, 0			#sommatore = 0
	beq $t1, 3, StoreRow
	j Riga
	
StoreRow:
	la $t0, matrix
	add $t5, $0, $t0
	li $t1, 0	#counter_riga
	li $t2, 0	#counter_colonna
	li $t3, 0	#sommatore
Colonna:
	beq $t1, 3, Store2
	lw $t4, ($t0)
	add $t3, $t3, $t4
	addi $t1, $t1, 1	#counter_riga++
	addi $t0, $t0, 24	#$t0+24
	j Colonna
Store2:
	sw $t3, ($t0)
	la $t0, 4($t5)
	addi $t2, $t2, 1	#counter_colonna++
	li $t1, 0
	beq $t2, 6, End
	j Colonna
	
End:
	li $v0, 10
	syscall
	.end main
	

	