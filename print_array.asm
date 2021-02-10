# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0
# Gama Aristondo

.data
	array: .word 1 2 3 4 5 6 7 8 9 10
    string: .asciiz "The contents of the array are:\n"
    newline: .asciiz "\n"

.text
printA:
    
    li $t0, 0  # variable i in the for loop
    move $t4, $a0  #$t4 will hold address since a0 is needed to print number and string

printA_loop:

    slt $t1, $t0, $a1
    beq $t1, $zero, printA_exit
    sll $t1, $t0, 2
    add $t4, $t4, $t1
    lw $t2, 0($t4)

    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    addi $t0, $t0, 1

printA_exit:

    jr $ra

main:

    la $a0, array
	li $a1, 10
    jal printA

exit:
	li $v0, 10
    syscall
