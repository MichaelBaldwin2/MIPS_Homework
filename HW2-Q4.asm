# Mike Baldwin
# Question 4

# Exit the program...
.macro	exitProg
	li $v0, 10
	syscall
.end_macro

# Print int (imm or reg)
.macro printInt (%value)
	li $v0, 1
	add $a0, $zero, %value
	syscall
.end_macro

# Print a string (without newline)
.macro printString(%text)
	.data
		text: .asciiz %text
	.text
		li $v0, 4
		la $a0, text
		syscall
.end_macro

# Prints some prompt text from %prompt and then reads an integer into %v
.macro readIntWithPrompt (%prompt, %v)
	.data
		promptText: .asciiz %prompt
	.text
		li $v0, 4
		la $a0, promptText
		syscall
		li $v0, 5
		syscall
		move %v, $v0
.end_macro

# Compares two integers(%a, %b) and returns(%v) the smallest
.macro min (%a, %b, %v)
		blt %a, %b, ifBranch	# if(a < b) goto:branch
		move %v, %b				# else return b
		j end
	ifBranch:
		move %v, %a				# return a
	end:
.end_macro

# Compares two integers(%a, %b) and returns(%v) the largest
.macro max (%a, %b, %v)
	bgt %a, %b, ifBranch	# if(a > b) goto:branch
	move %v, %b				# else return b
	j end
	ifBranch:
		move %v, %a			# return a
	end:
.end_macro

.text
main:
	readIntWithPrompt("Please enter a integer: ", $t0)
	readIntWithPrompt("Please enter a integer: ", $t1)
	readIntWithPrompt("Please enter a integer: ", $t2)
	min($t0, $t1, $t3)
	min($t2, $t3, $t4)	# $t4 should now have the smallest
	max($t0, $t1, $t5)
	max($t2, $t5, $t6)	# $t6 should now have the largest
	printString("The minimum is ")
	printInt($t4)
	printString(" and the maximum is ")
	printInt($t6)
	exitProg
	