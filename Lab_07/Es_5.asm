	.data
N:
	.word 6
K:
	.word 3
	.text
	.globl main
main:
	la $t0, N
	lw $a0, ($t0)
	la $t0, K
	lw $a1, ($t0)
	jal combina
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	.end main
	
	.ent combina
combina:
	sub $t1, $a0, $a1	#n-k
	addi $t1, $t1, 1	#n-k+1
	add $t2, $a0, $0
ciclo:
	beq $a0, $t1, divisione
	addi $a0, $a0, -1	#n-1
	mul $t2, $t2, $a0	#n(n-1)
	j ciclo
divisione:
	add $a0, $0, $t2	#passo il numeratore
	addi $sp, $sp, -4
	sw $ra, ($sp)	#salvo $ra nello stack
	jal divisione2
	lw $ra, ($sp)
	addi $sp, $sp, 4
	jr $ra
	.end combina
	
	.ent divisione2
divisione2:
	add $t1, $a1, $0
ciclo2:
	beq $a1, 1, torna
	addi $a1, $a1, -1	#k-1
	mul $t1, $t1, $a1	#k(k-1)
	j ciclo2
torna:
	div $v0, $a0, $t1
	jr $ra
	.end divisione2
	