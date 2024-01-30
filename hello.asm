#onceden tanimlanmis sistem cagrilari gelistirme ortaminda sunulur
.data 
helloString: .asciiz "Hello World"

.text

li $v0, 4
la $a0, helloString
syscall 