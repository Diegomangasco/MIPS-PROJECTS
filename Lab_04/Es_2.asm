	.data
text:
	.asciiz "Inserisci un numero\n"
error:
	.asciiz "\nErrore nell'inserimento\n"
overflow:
	.asciiz "\nOverflow\n"
end:
	.asciiz "\nValore finale:\n"
	.text
	.globl main
main:
	addi $t0, $t0, 0	#accumulatore
	addi $t5, $0, 10
	li $v0, 4
	la $a0, text
	syscall

Lab:
	li $v0, 12
	syscall
	move $t4, $v0
	beq $t4, '\n', End	#\n
	sub $t4, $t4, '0'	#sottrazione
	bgt $t4, 9, Exc
	mult $t0, $t5
	mfhi $t3
	mflo $t2
	sra $t2, $t2, 31
	bne $t2, $t3, Overflow
	mflo $t2
	move $t0, $t2
	add $t6, $t0, $t4
	blt $t6, $t0, Overflow
	blt $t6, $t4 Overflow
	move $t0, $t4
	j Lab

Exc:
	li $v0, 4
	la $a0, error
	syscall
	j Lab
	
Overflow:
	li $v0, 4
	la $a0, overflow
	syscall
End:
	li $v0, 4
	la $a0, end
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 10
	syscall
	.end main
	
	
	