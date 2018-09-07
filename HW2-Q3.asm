# Mike Baldwin
# Question 3

# Exit the program...
.macro	exitProg
	li $v0, 10
	syscall
.end_macro

# Print int with new line (either immediate or from a register)
.macro printIntEndl (%value)
	.data
		newline: .asciiz "\r\n"
	.text
		li $v0, 1
		add $a0, $zero, %value
		syscall
		li $v0, 4
		la $a0, newline
		syscall
.end_macro

.text
main:
	li $t0, 0					# i = 0
	li $t1, 1					# j = 1
	li $t2, 1					# k = 1
	loop:
		bgt $t0, 9, end			# if(t0 > 9) goto: end
		printIntEndl($t1)		# cout << j << endl
		move $t3, $t1			# temp = j
		add $t1, $t1, $t2		# j = j + k
		move $t2, $t3			# k = temp
		add $t0, $t0, 1			# i++
		j loop					# goto: loop
	end:
		exitProg
