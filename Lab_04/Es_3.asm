	.data
gg:
	.byte 10
hh:
	.byte 5
mm:
	.byte 20
overflow:
	.asciiz "\nOverflow\n"
end:
	.asciiz "\nValore finale:\n"
	.text
	.globl main
main:
	lb $t0, gg
	lb $t1, hh
	lb $t2, mm
	li $t3, 24
	li $t4, 60
	
	mult $t0, $t3
	mfhi $t5
	mflo $t6
	sra $t6, $t6, 31
	bne $t5, $t6, Overflow
	mflo $t0
	
	mult $t1, $t4
	mfhi $t5
	mflo $t6
	sra $t6, $t6, 31
	bne $t5, $t6, Overflow
	mflo $t1
	
	add $t5, $t0, $t1
	blt $t5, $t0, Overflow
	blt $t5, $t1 Overflow
	
	add $t6, $t5, $t2
	blt $t6, $t5, Overflow
	blt $t6, $t2 Overflow
	j End
	
Overflow:
	li $v0, 4
	la $a0, overflow
	syscall
End:
	li $v0, 4
	la $a0, end
	syscall
	li $v0, 1
	move $a0, $t6
	syscall
	li $v0, 10
	syscall
	.end main
	
	