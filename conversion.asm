# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0
#
# Gama Aristondo

.text
conv:
    
    li $s0, 0  # variable z
    li $t0, 0  # variable i
    li $t1, 5  # for loop upper limit
    li $t2, 2  # multiplier in loop
    li $t3, 3  # if statement variable

conv_loop:
    
    bge $t0, $t1, conv_end
    mult $t2, $a0
    mflo $t4
    add $s0, $s0, $t4
    sub $s0, $s0, $a1
    bge $a0, $t3, if_branch

conv_loop2:

    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j conv_loop

if_branch:

    addi $a1, $a1, -1
    j conv_loop2

conv_end:

    move $v0, $s0
    jr $ra

main:

	li $t0, 5
    move $a0, $t0
    li $t1, 7
    move $a1, $t1

    jal conv

    move $t2, $v0

    li $v0, 1
    move $a0, $t2
    syscall

exit:
	li $v0, 10
    syscall
