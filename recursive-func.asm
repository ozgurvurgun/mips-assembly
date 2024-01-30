#   HIGH LEVEL RECURSIVE FUNCTION   
#
#   recursiveFunc(baseNumber, expNumber)
#   {
#       if(expNumber == 0)
#           return 1;
#       else
#           return baseNumber * recursiveFunc(baseNumber, expNumber - 1);
#   }

.data
	string1: .asciiz "Taban sayisini giriniz: \n"
	string2: .asciiz "Kuvvet sayisini giriniz: \n"
	string3: .asciiz "Sonuc: \n"
.text

main:
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5
	syscall
	add $t0, $zero, $v0
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 5
	syscall
	add $t1, $zero, $v0
	add $a0, $zero, $t0    #procedure arguments
	add $a1, $zero, $t1    #procedure arguments
	jal recursiveFunction  #procedure call
	add $a0, $zero, $v0
	li $v0, 1
	syscall
	#Exit Program
	li $v0, 10
	syscall
	
recursiveFunction:
	bne $a1, $zero, recursion
	li $v0, 1
	jr $ra
	
recursion:
	addi $sp, $sp, -4
	sw   $ra, 0($sp)
	addi $a1, $a1, -1
	jal recursiveFunction
	mul $v0, $v0, $a0
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra