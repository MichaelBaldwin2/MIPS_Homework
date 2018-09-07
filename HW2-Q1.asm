# Mike Baldwin
# Question 1

# Exit the program...
.macro	exitProg
	li $v0, 10
	syscall
.end_macro

# Print an integer (either immediate or from a register)
.macro	printInt (%value)
	li $v0, 1
	add $a0, $zero, %value
	syscall
.end_macro

.data
	A: .word 4
	B: .word 6
	C: .word 2

.text
main:
	lw $t0, A
	lw $t1, B
	lw $t2, C
	mul $t3, $t1, $t1	# B * B
	mul $t4, $t0, $t2	# A * C
	mul $t5, $t4, 4		# 4 * A * C
	sub $t6, $t3, $t5	# (B * B) - (4 * A * C)
	printInt($t6)
	exitProg
