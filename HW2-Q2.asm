# Mike Baldwin
# Question 2

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
	A: .word 1
	B: .word 2
	C: .word 3

.text
main:
	lw $t0, A
	lw $t1, B
	lw $t2, C
	bne $t0, $t1, ifBranch	# if(a != b) goto: ifBranch
	move $t3, $zero			# else value = 0
	j end
	ifBranch:
		sub $t4, $t0, $t1	# (a - b)
		div $t3, $t2, $t4	# value = c / (a - b)
	end:
		printInt($t3)
		exitProg
