#####################################################################
#
# CSCB58 Winter 2024 Assembly Final Project
# University of Toronto, Scarborough
#
# Student: Keethan Jeyabalan, 1008195622, jeyaba20, keethan.jeyabalan@mail.utoronto.ca
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8 (update this as needed)
# - Unit height in pixels: 8 (update this as needed)
# - Display width in pixels: 512 (update this as needed)
# - Display height in pixels: 512 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestoneshave been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4 (choose the one the applies)
#
# Which approved features have been implemented for milestone 3?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# - yes, and please share this project github link as well!
#
# Any additional information that the TA needs to know:
# - (write here, if any)
#
#####################################################################
.include "draw_level.asm"
.include "draw_charmander.asm"

# Constants
.eqv  	DISPLAY_BASE 0x10008000
.eqv  	DISPLAY_SIZE 4096
.eqv  	SLEEP_TIME 40
.eqv	MAX_JUMP_HEIGHT 13

.eqv 	BACKGROUND 0xbfedff
.eqv 	DD_RED 0x300000
.eqv 	D_RED 0xb30000
.eqv 	L_RED 0xc83636
.eqv 	D_ORANGE 0xad4304
.eqv 	L_ORANGE 0xf85d00
.eqv 	YELLOW 0xf8e100
.eqv 	D_GREEN 0x02754f	

.data

# Data
CHARMANDER_XY: .word 0, 12, 0, 0 #[current x, current y, previous unit-coordinate, new unit coordinate]
CHARMANDER_DIRECTION_STATE: .word 1, 1, 0, 1   #[{0 if left, 1 if stationary, 2 if right}, {0 if falling, 1 if stationary, 2 if up}, {jump iteration}, {0 if no floor, 1 if on floor}]
SPRITE_ANIMATION: .word 0,0,1 #[movement iteration: 0-3 , jump: 0-1, direction facing: 0-1]

.text
.globl 	main

main:	
	la $s1, CHARMANDER_XY
	la $s2, CHARMANDER_DIRECTION_STATE
	la $s3, SPRITE_ANIMATION
	li $s7, DISPLAY_BASE
	
	jal draw_level
	
main_loop: 	
	lw $t0, 0($s1) 				
	lw $t1, 4($s1)
	
	sll $t0, $t0, 2 		#find x pixel coordinate
	sll $t1, $t1, 8 		#find y pixel coordinate
	addi $s0, $t0, DISPLAY_BASE 	#add coordinates to display base for top-left of sprite
	add $s0, $s0, $t1		
	sw $s0, 8($s1)			#store this coordinates before updating
	
key_fetch: 
	li $t9, 0xffff0000  
	lw $t8, 0($t9) 
	bne $t8, 1, vertical
	
key_action: 
	lw $t0, 0($s1) 			# load x coordinate	
	lw $t1, 4($s1)			# load y coordinate
	
	lw $t8, 4($t9)                  # checks input from keyboard
	beq $t8, 0x70, restart   	# checks if 'p' is pressed
	beq $t8, 0x61, key_left   	# checks if 'a' is pressed
	beq $t8, 0x64, key_right   	# checks if 'd' is pressed
	beq $t8, 0x77, key_up   	# checks if 'w' is pressed
	
	j vertical
	
restart:
	j main 
	
key_left:
	#if touching left boundary, skip
	beq $t0, 0, vertical
	
	#set previous y-coordinate to potential 1d marker and check for collisions
	addi $t1, $s0, -4
	
	# check all pixels to the left of sprite
	lw $t2, 0($t1)
	bne $t2, BACKGROUND, vertical
		
	lw $t2, 256($t1)
	bne $t2, BACKGROUND, vertical
		
	lw $t2, 512($t1)
	bne $t2, BACKGROUND, vertical
		
	lw $t2, 768($t1)
	bne $t2, BACKGROUND, vertical
		
	lw $t2, 1024($t1)
	bne $t2, BACKGROUND, vertical

	lw $t2, 1280($t1)
	bne $t2, BACKGROUND, vertical	
	
	lw $t2, 1536($t1)
	bne $t2, BACKGROUND, vertical

	lw $t2, 1792($t1)
	bne $t2, BACKGROUND, vertical	
	
	lw $t2, 2048($t1)
	bne $t2, BACKGROUND, vertical

	lw $t2, 2304($t1)
	bne $t2, BACKGROUND, vertical		
	
	addi $s0, $s0, -4	#update unit coordinate
	addi $t0, $t0, -1	#update charmander location
	sw $t0, 0($s1)	
	
	li $t0, 0
	sw $t0, 0($s2)		#update l/r to left
	sw $t0, 8($s3)
	
	j update_movement_iteration
	
key_right:
	#if touching right boundary, skip
	beq $t0, 55, vertical
	
	#set previous y-coordinate to potential 1d marker and check for collisions
	addi $t1, $s0, 36
	
	# check all pixels to the right of sprite
	lw $t2, 0($t1)
	bne $t2, BACKGROUND, vertical
		
	lw $t2, 256($t1)
	bne $t2, BACKGROUND, vertical
		
	lw $t2, 512($t1)
	bne $t2, BACKGROUND, vertical
		
	lw $t2, 768($t1)
	bne $t2, BACKGROUND, vertical
		
	lw $t2, 1024($t1)
	bne $t2, BACKGROUND, vertical

	lw $t2, 1280($t1)
	bne $t2, BACKGROUND, vertical	
	
	lw $t2, 1536($t1)
	bne $t2, BACKGROUND, vertical

	lw $t2, 1792($t1)
	bne $t2, BACKGROUND, vertical	
	
	lw $t2, 2048($t1)
	bne $t2, BACKGROUND, vertical

	lw $t2, 2304($t1)
	bne $t2, BACKGROUND, vertical
	
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	sw $t0, 0($s1)
	
	li $t0, 2	#set horizontal state to right
	sw $t0, 0($s2)
	
	li $t0, 1	#set animation to right
	sw $t0, 8($s3)
	
	j update_movement_iteration
	
update_movement_iteration: 
	lw $t0, 0($s3)
	beq $t0, 3, reset_movement_iteration
	addi $t0, $t0, 1
	sw $t0, 0($s3)
	j vertical 

reset_movement_iteration:
	sw $zero, 0($s3)
	j vertical
	
key_up:
	#set vertical state to jump but need to check conditions
	li $t0, 2
	sw $t0, 4($s2)
	li $t0, 1
	sw $t0, 4($s3)
	
	j vertical
	
vertical:
	lw $t0, 4($s2)
	
below_collision:
	addi $t1, $s0, 2560
	
	#check all pixels below sprite
	lw $t2, 0($t1)				
	bne $t2, BACKGROUND, floor_below
	
	lw $t2, 4($t1)				
	bne $t2, BACKGROUND, floor_below
	
	lw $t2, 8($t1)				
	bne $t2, BACKGROUND, floor_below	
	
	lw $t2, 12($t1)				
	bne $t2, BACKGROUND, floor_below
	
	lw $t2, 16($t1)				
	bne $t2, BACKGROUND, floor_below
	
	lw $t2, 20($t1)				
	bne $t2, BACKGROUND, floor_below
	
	lw $t2, 24($t1)				
	bne $t2, BACKGROUND, floor_below
	
	lw $t2, 28($t1)				
	bne $t2, BACKGROUND, floor_below
	
	lw $t2, 32($t1)				
	bne $t2, BACKGROUND, floor_below
	
	li $t1, 0		#set below_floor status to no
	sw $t1, 12($s2)
	
	
	lw $t1, 8($s2)		#check if in middle of jump
	bne $t1, 0, is_jump_apex 
	
fall_state:
	#set fall state
	li $t0, 0
	sw $t0, 4($s2)
	
	#offset y coordinate 1 unit down 
	lw $t0, 4($s1)
	addi $t0, $t0, 1
	sw $t0, 4($s1)
	
	#offset player coordinate by one row
	addi $s0, $s0, 256
	
	j vertical_complete
	
floor_below:
	
	li $t0, 1
	sw $t0, 12($s2)
	#reset jump iteration
	sw $zero, 8($s2)
	
	lw $t0, 4($s2)
	beq $t0, 2, above_collision
	
	
	#if vertical state is not jump, then vertically stationary
	li $t1, 1
	sw $t1, 4($s2)
	
	j vertical_complete
 
is_jump_apex:
	bge $t1, MAX_JUMP_HEIGHT, fall_state
	
above_collision: 
	lw $t1, 4($s1)
	bgt $t1, 0, floor_above
	j above_collision_state
	
floor_above:
	subi $t1, $s0, 256
	
	#check all pixels above sprite
	lw $t2, 0($t1)				
	bne $t2, BACKGROUND, above_collision_state

	lw $t2, 4($t1)				
	bne $t2, BACKGROUND, above_collision_state
	
	lw $t2, 8($t1)				
	bne $t2, BACKGROUND, above_collision_state	
	
	lw $t2, 12($t1)				
	bne $t2, BACKGROUND, above_collision_state

	lw $t2, 16($t1)				
	bne $t2, BACKGROUND, above_collision_state
	
	lw $t2, 20($t1)				
	bne $t2, BACKGROUND, above_collision_state
	
	lw $t2, 24($t1)				
	bne $t2, BACKGROUND, above_collision_state

	lw $t2, 28($t1)				
	bne $t2, BACKGROUND, above_collision_state
	
	lw $t2, 32($t1)				
	bne $t2, BACKGROUND, above_collision_state
shift_up:
	li $t0, 2
	sw $t0, 4($s2)
	li $t0, 1
	sw $t0, 4($s3)
	
	subi $s0, $s0, 256
	
	lw $t0, 4($s1)
	subi $t0, $t0, 1
	sw $t0, 4($s1)
	
	lw $t0, 8($s2)
	addi $t0, $t0, 1
	sw $t0, 8($s2)
	
	j vertical_complete
	
above_collision_state:
	sw $zero, 8($s2)
	lw $t0, 12($s2)
	beq $t0, 0, fall_state
	
	li $t0, 1 
	sw $t0, 4($s2) 
vertical_complete:

	lw $t0, 0($s2)
	lw $t1, 4($s2)

	bne $t0, 1, redraw_charmander
	bne $t1, 1, redraw_charmander
	
	j loop_end
	
redraw_charmander:
	
	sw $s0, 12($s1)	#storing our new unit co-ordinate
	lw $s0, 8($s1) 	#fetching our old one for deletion
	
	jal erase_charmander
	
	lw $s0, 12($s1)	#fetch new unit co-ordinate again
	
	lw $t0, 8($s3)	#load sprite direction
	lw $t1, 0($s3) 	#load movement iteration
	lw $t2, 4($s3)  #check if start of jump or not 
	lw $t3, 4($s2)  #check if midair or not
	
	face_left: 
		beq $t0, 1, face_right			#check if facing right
		beq $t2, 1, face_left_jump		#check if start of jump
		bne $t3, 1, left_static_iteration	#check if midair
		beq $t1, 0, left_static_iteration	#check iterations 0-3
		beq $t1, 1, left_left_iteration
		beq $t1, 2, left_static_iteration
		beq $t1, 3, left_right_iteration
		
		face_left_jump:
			li $t2, 0
			sw $t2, 4($s3)
			
			jal set_charmander_colors
			
			jal charmander_left_jump
			
			j loop_end
		
		left_static_iteration:
			jal set_charmander_colors
		
			jal charmander_left_static
			
			j loop_end
		
		left_left_iteration:
			jal set_charmander_colors
		
			jal charmander_left_left
			
			j loop_end
			
		left_right_iteration:
			jal set_charmander_colors
		
			jal charmander_left_right
			
			j loop_end
			
	face_right:
		beq $t2, 1, face_right_jump
		bne $t3, 1, right_static_iteration
		beq $t1, 0, right_static_iteration	
		beq $t1, 1, right_left_iteration
		beq $t1, 2, right_static_iteration
		beq $t1, 3, right_right_iteration
		
		face_right_jump:
			li $t2, 0
			sw $t2, 4($s3)
			
			jal set_charmander_colors
			
			jal charmander_right_jump
			
			j loop_end
	
		right_static_iteration:
			jal set_charmander_colors
		
			jal charmander_right_static
			
			j loop_end
			
		right_left_iteration:
			jal set_charmander_colors
		
			jal charmander_right_left
			
			j loop_end
			
		right_right_iteration:
			jal set_charmander_colors
		
			jal charmander_right_right
			
			j loop_end   
			
loop_end:
	li $t0, 1
	sw $t0, 0($s2)
	sw $t0, 4($s2)
	
	li $v0, 32 
	li $a0, SLEEP_TIME   			
	syscall

	j main_loop




	

	
	
	    
	      
	
	
	







