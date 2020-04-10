.data
DIM = 5
vett: .space DIM
.text
.globl main
.ent main
main: 
		la $t2,vett
		and $t3,$0,$0
lab1:	li $v0,12
		syscall
		sb $v0,($t2)
		addi $t2,$t2,1
		addi $t3,$t3,1
		bne $t3,5,lab1
lab2:
		addi $t3,$t3,-1
		addi $t2,$t2,-1
		lb $a0,($t2)
		li $v0,11
		syscall
		bne $t3,0,lab2
		
		li $v0,10
		syscall
.end main
		