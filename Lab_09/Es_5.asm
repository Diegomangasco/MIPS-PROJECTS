	.data 
str_orig: .asciiz "% nella citta' dolente, % nell'eterno dolore, % tra la perduta gente %" 
str_sost: .asciiz "per me si va" 
str_new: .space 200
	.text 
	.globl main 
	.ent main 
main:           
	la $a0, str_orig 
	la $a1, str_sost 
	la $a2, str_new 
	jal sostituisci
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	.end main
	
	.ent sostituisci
sostituisci:
	addi $v0, $0, 0
ciclo1:
	lb $t0, ($a0)
	beq $t0, 0x00, end
	beq $t0, '%', trovato
	sb $t0, ($a0)
	addi $v0, $v0, 1
torna:
	addi $a0, $a0, 1
	j ciclo1
trovato:
	la $t1, ($a1)
ciclo2:
	lb $t2, ($t1)
	beq $t2, 0x00, torna
	sb $t1, ($a2)
	addi $v0, $v0, 1
	addi $t1, $t1, 1
	j ciclo2
	
end:
	jr $ra
	.end sostituisci
	