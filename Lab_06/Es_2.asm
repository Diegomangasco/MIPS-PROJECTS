	.data
testo1:
		.asciiz "Inserisci un carattere\n"
testo2:
		.asciiz "Parola non palindroma\n"
testo3:
		.asciiz "Parola palindroma\n"
	.text
	.globl main
main:
	la $a0, testo1
	li $v0, 4
	syscall
	add $t0, $0, $sp	#salvataggio del puntatore allo stack
	
Stringa:
	li $v0, 12
	syscall
	beq $v0, '\n', Control
	sw $v0, ($sp)		#salvo il carattere nello stack (push)
	addi $sp, $sp, -4	#amplio lo stack
	j Stringa
	
Control:
	addi $sp, $sp, 4	#escludo il \n
	lw $t1, ($t0)	#pop
	lw $t2, ($sp)	#pop
	and $t3, $t1, $t2
	bne $t3, $t1, Not	#parola non palindroma
	bne $t3, $t2, Not
	addi $sp, $sp, 4
	addi $t0, $t0, -4
	bge $sp, $t0, Yes
	j Control
	
Not:
	la $a0, testo2
	li $v0, 4
	syscall
	j End
	
Yes:
	la $a0, testo3
	li $v0, 4
	syscall
	j End
	
End:
	li $v0, 10
	syscall
	.end main
	
	
	
	
	