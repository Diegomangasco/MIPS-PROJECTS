	.data 
ora_in: .byte 12, 47 
ora_out: .byte 18, 14 
X: .byte 1 
Y: .byte 40
	.text 
	.globl main 
main: 
	la $a0, ora_in # indirizzo di ora_in 
	la $a1, ora_out # indirizzo di ora_out 
	lbu $a2, X 
	lbu $a3, Y 
	jal costoParcheggio
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	.end main
	
	.ent costoParcheggio
costoParcheggio:
	lb $t0, ($a0)
	mul $t0, $t0, 60
	lb $t1, 4($a0)
	add $t0, $t0, $t1	#trasformo le ore in minuti
	lb $t2, ($a1)
	mul $t2, $t2, 60
	lb $t3, 4($a1)
	add $t2, $t2, $t3
	sub $t0, $t2, $t0	#ottengo i minuti di permanenza
	
	div $t0, $a3	#divido per i minuti corrispondenti al periodo
	mfhi $t1
	mflo $t2
	beq $t1, $0, nessunAggiunta	#se non ho resto, il parcheggio è stato di un multiplo di Y minuti
	mul $v0, $t2, $a2	#moltiplicazione per il costo
	add $v0, $v0, $a2	#aggiungo il costo per i minuti successivi al multiplo di Y
	jr $ra
nessunAggiunta:
	mul $v0, $t2, $a2	#eseguo solo la moltiplicazione per il costo
	jr $ra
	.end costoParcheggio