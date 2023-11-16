.data

.balign 4
message1: .asciz "number 1: \n"

.balign 4
message2: .asciz "number 2: \n"

.balign 4
message3: .asciz "enter + for addition, - for substraction, * for multiplication / for division: \n"

.balign 4
message4: .asciz "do you want to continu: y/n\n"

.balign 4
scan_pattern: .asciz "%d"

.balign 4
scan_pattern_s: .asciz "%s"

.balign 4
num_1: .word 0

.balign 4
num_2: .word 0

.balign 4
num_3: .word 0

.balign 4
scan: .word 0

.balign 4
exit_message: .asciz "goodbye\n"

.balign 4
sum: .word 0

.balign 4
end: .word 0

.balign 4
output: .asciz "%d + %d = %d\n"

.balign 4
output_2: .asciz "%d - %d = %d\n"

.balign 4
output_3: .asciz "%d * %d = %d\n"

.balign 4
output_4: .asciz "%d / %d = %d\n"

.balign 4
return: .word 0

.balign 4
return_2: .word 0

.text
.global main
main:

	ldr r1, =return
	str lr, [r1]

	ldr r0, =message1
	bl printf

	ldr r0, =scan_pattern
	ldr r1, =num_1
	bl scanf

	ldr r0, =message3
	bl printf

	ldr r0, =scan_pattern_s
	ldr r1, =num_3
	bl scanf
	
	ldr r0, =message2
	bl printf

	ldr r0, =scan_pattern
	ldr r1, =num_2
	bl scanf

	
	ldr r3, =num_3
	ldr r3, [r3]

	cmp r3, #'+'
	beq sum_vals

	cmp r3, #'-'
	beq sub_vals

	cmp r3, #'*'
	beq mul_vals

	cmp r3, #'/'
	beq div_vals
question:	
	ldr r0, =message4
	bl printf

	ldr r0, =scan_pattern_s
	ldr r1, =num_3
	bl scanf

	ldr r3, =num_3
	ldr r3, [r3]
	cmp r3, #'y'
	beq main

	cmp r3, #'n'
	beq end_vals


end_vals:
	mov r0, #0
	mov r7, #1
	swi 0
sum_vals:
	ldr r2, =return_2
	str lr, [r2]

	ldr r0, =num_1
	ldr r0, [r0]
	ldr r1, =num_2
	ldr r1, [r1]

	add r0, r0, r1

	mov r3, r0
	ldr r0, =output
	ldr r1, =num_1
	ldr r1, [r1]
	ldr r2, =num_2
	ldr r2, [r2]
	bl printf

	b question
	ldr lr, =return_2
	ldr lr, [lr]
	bx lr
sub_vals:

	ldr r2, =return_2
	str lr, [r2]

	ldr r0, =num_1
	ldr r0, [r0]
	ldr r1, =num_2
	ldr r1, [r1]

	sub r0, r0, r1

	mov r3, r0
	ldr r0, =output_2
	ldr r1, =num_1
	ldr r1, [r1]
	ldr r2, =num_2
	ldr r2, [r2]
	bl printf

	b question
	ldr lr, =return_2
	ldr lr, [lr]

mul_vals:

	ldr r2, =return_2
	str lr, [r2]

	ldr r4, =num_1
	ldr r4, [r4]
	ldr r1, =num_2
	ldr r1, [r1]

	mul r0, r4, r1

	mov r3, r0
	ldr r0, =output_3
	ldr r1, =num_1
	ldr r1, [r1]
	ldr r2, =num_2
	ldr r2, [r2]
	bl printf

	b question
	ldr lr, =return_2
	ldr lr, [lr]


div_vals:

	ldr r2, =return_2
	str lr, [r2]

	ldr r4, =num_1
	ldr r4, [r4]
	ldr r1, =num_2
	ldr r1, [r1]

	sdiv r0, r4, r1

	mov r3, r0
	ldr r0, =output_4
	ldr r1, =num_1
	ldr r1, [r1]
	ldr r2, =num_2
	ldr r2, [r2]
	bl printf

	b question
	ldr lr, =return_2
	ldr lr, [lr]




.global printf
.global scanf
