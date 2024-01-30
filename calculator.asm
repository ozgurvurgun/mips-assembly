# Assembly Calculator

.data

string1:       .asciiz "Birinci sayiyi giriniz: \n"
opMessage:     .asciiz "Islem tipini giriniz: \n"
string2:       .asciiz "Ikinci sayiyi giriniz: \n"
resultMessage: .asciiz "Sonuc: \n"
errorMessage:  .asciiz "Hatali operator girdiniz. Operatorler: +, -, *, / \n"
newLine:       .asciiz "\n"
carryMessage:  .asciiz "Bolme isleminden kalan sayi: \n"
operand1:      .word 1
operand2:      .word 1
operator:      .word 2
out:           .word 1  #sonuc icin bellek aloksayonu
remainder:     .word 1  #kalan icin bellek aloksayonu

.text

main:
	# operand-1 message:
	li $v0, 4
	la $a0, string1
	syscall 
	# Input operand-1
	li $v0, 5
	syscall 
	sw $v0, operand1  # operand-1 girdisi bellege kaydet

optype:
	# operator select message
	li $v0, 4
	la $a0, opMessage
	syscall 
	#get operator symbol
	la $a0, operator
	la $a1, 2
	li $v0, 8
	syscall 
	lw $t0, 0($a0)
	# Newline
	li $v0, 4
	la $a0, newLine
	syscall
	# operating control
	li $t1, '+'
	li $t2, '-'
	li $t3, '*'
	li $t4, '/'
	beq $t0, $t1, secondOp
	beq $t0, $t2, secondOp
	beq $t0, $t3, secondOp
	beq $t0, $t4, secondOp
	j Error

secondOp:
	# operand-2 message:
	li $v0, 4
	la $a0, string2
	syscall 
	# Input operand-2
	li $v0, 5
	syscall 
	sw $v0, operand2  # operand-2 girdisi bellege kaydet
	lw $s1, operand1
	lw $s2, operand2
	lw $s0, out
	lw $s4, remainder
	# decide on transaction type
	beq $t0, $t1, toplama
	beq $t0, $t2, cikarma
	beq $t0, $t3, carpma
	beq $t0, $t4, bolme

toplama:
	add $s0, $s1, $s2
	sw $s0, out
	j print

cikarma:
	sub $s0, $s1, $s2
	sw $s0, out
	j print

carpma:
	mult $s1, $s2
	mflo $s0
	sw $s0 out
	j print

bolme:
	div $s1, $s2
	mflo $s0  #bolum sonucu
	mfhi $s4  #kalan sayi sonucu
	sw $s4, remainder
	#kalani yazdir
	li $v0, 4
	la $a0, carryMessage
	syscall
	li $v0, 1
	la $a0, remainder
	syscall 
	# Newline
	li $v0, 4
	la $a0, newLine
	syscall
	sw $s0, out
	j print

print:
	li $v0, 4
	la $a0, resultMessage
	syscall
	li $v0, 1
	lw $a0, out
	syscall
	# Newline
	li $v0, 4
	la $a0, newLine
	syscall
	j main

Error:
	# error message
	li $v0, 4
	la $a0, errorMessage
	syscall
	j optype