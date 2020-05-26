	.data
Vettore:
	.word 13, 33, 52, 1, 50
Text:
	.asciiz "Il valore massimo è: "
	.text
	.globl main
main:
	la $a0, Vettore
	li $a1, 5
	jal massimo
	add $t0, $v0, $0	#salvo in $t0 il valore di ritorno
	li $v0, 4
	la $a0, Text
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall
	.end main
	
	.ent massimo
massimo:
	addi $t1, $0, 0	#counter
	addi $v0, $0, 0	#max = 0
ciclo:
	bge $t1, $a1, salto
	lw $t2, ($a0)
	addi $t1, $t1, 1	#counter++
	addi $a0, $a0, 4
	blt $t2, $v0, ciclo	#se $t2 è più piccolo del max
	add $v0, $t2, $0
	j ciclo
salto:
	jr $ra
	.end massimo
	