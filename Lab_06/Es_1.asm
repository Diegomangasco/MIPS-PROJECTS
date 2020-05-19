	.data
var:
	.word 3141592653
	.text
	.globl main
main:
	lw $t0, var
	addi $t2, $0, 10
	add $t3, $0, $0
Divisione:
	div $t0, $t2
	addi $sp, $sp, -4
	addi $t3, $t3, 1
	mflo $t0
	mfhi $sp	#push
	bne $t0, $0, Divisione
	
Visualizzazione:
	move $a0, $sp	#pop
	addi $sp, $sp, 4
	addi $a0, $a0, 48
	li $v0, 11
	syscall
	addi $t3, $t3, -1
	beq $t3, $0, End	#se sono tornato al punto iniziale
	j Visualizzazione
	
End:
	li $v0, 10
	syscall
	.end main
	
	
	