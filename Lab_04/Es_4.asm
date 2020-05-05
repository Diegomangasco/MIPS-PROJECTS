	.data
DIM:
	.byte 3
text:
	.asciiz "Inserisci un numero\n"
overflow:
	.asciiz "\nOverflow\n"
end:
	.asciiz "\nMedia:\n"
	.text
	.globl main
main:
	lb $t0, DIM
	addi $t1, $t1, 0
	addi $t3, $t3, 0
	addi $t4, $t4, 0
Lab:
	beq $t1, $t0, End
	li $v0, 4
	la $a0, text
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	move $t3, $t4
	add $t4, $t3, $t2
	blt $t4, $t3, Overflow
	blt $t4, $t2 Overflow
	addi $t1, $t1, 1
	j Lab	
	
Overflow:
	li $v0, 4
	la $a0, overflow
	syscall
End:
	li $v0, 4
	la $a0, end
	syscall
	div $t4, $t0
	mflo $t4
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 10
	syscall
	.end main