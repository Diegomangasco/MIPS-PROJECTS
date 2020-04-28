	.data
testo0: .asciiz "Inserisci un numero"
testo1: .asciiz "Il numero inserito è pari"
testo2: .asciiz "Il numero inserito è dispari"
	.text
	.globl main
main:
	li $v0, 4
	la $a0, testo0
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	and $t0, $t0, 1	#and con 1
	
	beq $t0, $0, Lab
	li $v0, 4
	la $a0, testo2
	syscall
	j Done
Lab: 
	li $v0, 4
	la $a0, testo1
	syscall
Done:
	li $v0, 10
	syscall
	.end main
	