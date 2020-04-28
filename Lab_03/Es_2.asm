	.data
testo0: .ascii "Inserisci due numeri\n"
Val0:	.byte 0
testo1: .ascii "Numero errato\n"
Val1:	.byte 0
	.text
	.globl main
main:
	li $v0, 4
	la $a0, testo0
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 5
	syscall
	move $t1, $v0
	
	bgt $t0, 256, StepEx
Step2:
	bgt $t1, 256, StepEx
	j Lab
StepEx:
	la $a0, testo1	#uno dei due numeri è troppo grande per essere rappresentato su un byte
	li $v0, 4
	syscall
	j Done
Lab:
	nor $t2, $t1, $0	#operazione richiesta
	and $t3, $t0, $t2
	nor $t3, $t3, $0
	xor $t0, $t0, $t1
	or $t0, $t0, $t3
	li $v0, 1
	move $a0, $t0
	syscall
Done:
	li $v0, 10
	syscall
	.end main
	
	