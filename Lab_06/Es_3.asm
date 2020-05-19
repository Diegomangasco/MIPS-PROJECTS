	.data
testo1:
	.asciiz "Inserisci un valore\n"
testo2:
	.asciiz "Risultati reali\n"
testo3:
	.asciiz "Risultati non reali\n"
	.text
	.globl main
main:
	addi $t0, $0, 0	#counter
Lettura:
	la $a0, testo1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	bne $t0, $0, B #se a è già stato riempito
	move $t1, $v0
	j Loop
B:
	bne $t0, 1, C #se b è già stato riempito
	move $t2, $v0
	j Loop
C:
	move $t3, $v0
	
Loop:
	addi $t0, $t0, 1	#counter++
	bne $t0, 3, Lettura
	
	mul $t2, $t2, $t2	#b^2
	mul $t1, $t1, $t3	#a*c
	sll $t1, $t1, 2		#4*a*c
	sub $t2, $t2, $t1	#calcolo del delta
	slt $t0, $t2, $0
	beq $t0, 1, Not	#delta minore di zero
	la $a0, testo2
	li $v0, 4
	syscall
	j End
	
Not:
	la $a0, testo3
	li $v0, 4
	syscall
	
End:
	li $v0, 10
	syscall
	.end main
	
	

	