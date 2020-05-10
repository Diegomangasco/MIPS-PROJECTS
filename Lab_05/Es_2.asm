	.data
op1:
	.word 2043
op2:
	.word 5
res:
	.space word
testo:
	.asciiz "Inserisci un numero:\n"
	.text
	.globl main
main:
	li $v0, 4
	la $a0, testo
	syscall
	li $v0, 5	#read choise
	syscall
	move $t0, $v0
	lw $t1, op1
	lw $t2, op2
	la $t3, res
#Switch case
	beq $t0, 0, Add
	beq $t0, 1, Sub
	beq $t0, 2, Mul
Div:
	div $t1, $t2
	mflo $t4
	sw $t4, ($t3)
	j End
Add:
	add $t4, $t1, $t2
	sw $t4, ($t3)
	j End
Sub:
	sub $t4, $t1, $t2
	sw $t4, ($t3)
	j End
Mul:
	mul $t4, $t1, $t2
	sw $t4, ($t3)
End:
	li $v0, 10
	syscall
	.end main