	.data
array_riga:
	.word 1, -2, 3, 4
array_colonna:
	.word 5, 6, 7, -8
res:
	.space 16
	.text
	.globl main
main:
	la $t0, array_riga
	la $t1, array_colonna
	la $t6, res
	add $t7, $0, $t1	#memorizzo il riferimento all'array_colonna
	add $t2, $0, $0 	#counter_riga
	add $t3, $0, $0 	#counter_colonna
	
	lw $t4, ($t0)
Riga:
	bgt $t3, 3, Update
	lw $t5, ($t1)
	mulo $t5, $t4, $t5
	sw $t5, ($t6)		#store
	addi $t1, $t1, 4	#array_colonna++
	addi $t6, $t6, 4	#res++
	addi $t3, $t3, 1	#counter_colonna++
	j Riga
Update:
	beq $t2, 3, End
	addi $t0, $t0, 4	#array_riga++ -> passo ad una nuova riga
	add $t1, $0, $t7	#riporto array_colonna al primo elemento
	addi $t2, $t2, 1	#counter_riga++
	add $t3, $0, $0		#counter_colonna = 0
	lw $t4, ($t0)		#lo faccio una sola volta per riga
	j Riga
End:
	li $v0, 10
	syscall
	.end main
	
	
	
	
	