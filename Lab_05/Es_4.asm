	.data
riga:
	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
res:
	.space 100
	.text
	.globl main
main:
	la $t0, riga
	la $t1, riga
	la $t2, res
	add $t3, $0, $t1	#memorizzo il riferimento alla colonna
	add $t4, $0, $0		#counter_riga = 0
	add $t5, $0, $0		#counter_colonna = 0

	lw $t6, ($t0)
Riga:
	bgt $t5, 9, Update
	lw $t7, ($t1)
	mulou $t7, $t7, $t6
	sw $t7,($t2)
	addi $t2, $t2, 4	#res++
	addi $t1, $t1, 4	#colonna++
	addi $t5, $t5, 1	#counter_colonna++
	j Riga
Update:
	beq $t4, 9, End
	add $t1, $0, $t3	#ripristino la colonna
	addi $t4, $t4, 1	#counter_riga++
	add $t5, $0, $0		#counter_colonna = 0
	addi $t0, $t0, 4	#riga++
	lw $t6, ($t0)		#lo faccio una volta per riga
	j Riga
End:
	li $v0, 10
	syscall
	.end main
	