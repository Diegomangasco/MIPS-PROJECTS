	.data
Text:
	.asciiz "anna"
ACapo: 
	.asciiz "\n"
	.text
	.globl main
main:
	la $t0, Text	#metto in $t0 l'indirizzo della parola
	add $t1, $0, $0		#counter
	li $v0, 4
	la $a0, ACapo
	syscall

ciclo:
	lb $a0, ($t0)
	beq $a0, $0, end
	jal convertitore
	add $a0, $v0, $0	#sposto in $a0, il valore di ritorno
	li $v0, 11			#print Character
	syscall
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	j ciclo
	
	.ent convertitore
convertitore:
	addi $v0, $a0, -32
	jr $ra
	.end convertitore
	
end:
	li $v0, 10
	syscall
	.end main