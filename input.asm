#onceden tanimlanmis sistem cagrilari gelistirme ortaminda sunulur
.data 
message: .asciiz "enter a number: \n"

.text

li $v0, 4
la $a0, message
syscall 

li $v0, 5
syscall 

add $t3, $zero, $v0