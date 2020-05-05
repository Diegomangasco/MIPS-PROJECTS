	.data
text:
	.asciiz "Inserisci un numero\n"
error:
	.asciiz "\nErrore nell'inserimento\n"
	.text
	.globl main
main:
	li $v0, 4
	la $a0, text
	syscall

Lab:
	li $v0, 12
	syscall
	move $t0, $v0
	beq $t0, '\n', End	#\n
	sub $t0, $t0, '0'	#sottrazione
	bgt $t0, 9, Exc
	j Lab

Exc:
	li $v0, 4
	la $a0, error
	syscall
	j Lab

End:
	li $v0, 10
	syscall
	.end main
	
	
	