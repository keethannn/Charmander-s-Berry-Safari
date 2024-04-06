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
.include "draw_level_1.asm"
.include "draw_level_2.asm"
.include "draw_level_3.asm"
.include "draw_pokeballs.asm"
.include "draw_charmander.asm"

# Constants
.eqv  	DISPLAY_BASE 0x10008000
.eqv  	DISPLAY_SIZE 4096
.eqv  	SLEEP_TIME 40
.eqv	MAX_JUMP_HEIGHT 13

.eqv 	BLUE_BACKGROUND 0xbfedff
.eqv    ORANGE_BACKGROUND 0xff8100
.eqv 	PURPLE_BACKGROUND 0x6d00b3
.eqv 	DD_RED 0x300000
.eqv 	D_RED 0xb30000
.eqv 	L_RED 0xc83636
.eqv 	D_ORANGE 0xad4304
.eqv 	L_ORANGE 0xf85d00
.eqv 	YELLOW 0xf8e100
.eqv 	D_GREEN 0x02754f	

.data

# Data
CHARMANDER_XY: .word 0, 0, 0, 0 #[current x, current y, previous unit-coordinate, new unit coordinate]
CHARMANDER_DIRECTION_STATE: .word 1, 1, 0, 1   #[{0 if left, 1 if stationary, 2 if right}, {0 if falling, 1 if stationary, 2 if up}, {jump iteration}, {0 if no floor, 1 if on floor}]
SPRITE_ANIMATION: .word 0,0,1 #[movement iteration: 0-3 , jump: 0-1, direction facing: 0-1]
GAME_STATE: .word 0, 4, 0, 0, 0, 0 #[level: 0-3, lives: 0-3, spawn-x:0-55, spawn-y:10-63, background:color-code, berry color: color-code]

.text
.globl 	main

main:	
	la $s1, CHARMANDER_XY
	la $s2, CHARMANDER_DIRECTION_STATE
	la $s3, SPRITE_ANIMATION
	la $s4, GAME_STATE
	li $s7, DISPLAY_BASE
	
	jal decrease_lives
	
load_next_level:
	la $t0, GAME_STATE
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	 
	beq $t1, 1, level1
	beq $t1, 2, level2
	beq $t1, 3, level3
	beq $t1, 4, you_win
	
	j main_loop
	
level1:
	jal draw_level_1
	li $t0, 0
	sw $t0, 0($s1)
	sw $t0, 8($s4)
	li $t0, 34
	sw $t0, 4($s1)
	sw $t0, 12($s4)
	li $t0, 1
	sw $t0, 8($s3)
	li $t0, 0x9b731b
	sw $t0, 20($s4)
	li $t0, BLUE_BACKGROUND
	sw $t0, 16($s4) 
	
	j main_loop
	
level2:
	jal draw_level_2
	li $t0, 0
	sw $t0, 0($s1)
	sw $t0, 8($s4)
	li $t0, 12
	sw $t0, 4($s1)
	sw $t0, 12($s4)
	li $t0, 1
	sw $t0, 8($s3)
	li $t0, 0x780f32
	sw $t0, 20($s4)
	li $t0, ORANGE_BACKGROUND
	sw $t0, 16($s4) 
	
	j main_loop
level3:
	jal draw_level_3
	li $t0, 54
	sw $t0, 0($s1)
	sw $t0, 8($s4)
	li $t0, 37
	sw $t0, 4($s1)
	sw $t0, 12($s4)
	li $t0, 0
	sw $t0, 8($s3)
	li $t0, 0x21111c
	sw $t0, 20($s4)
	li $t0, PURPLE_BACKGROUND
	sw $t0, 16($s4)
	
	j main_loop
you_win:
	j respawn
	
decrease_lives:
	lw $t0, 4($s4)
	addi $t0, $t0, -1
	sw $t0, 4($s4)
	
	beq $t0, 3, draw_3_pokeballs
	beq $t0, 2, draw_2_pokeballs
	beq $t0, 1, draw_1_pokeball
	beq $t0, 0, game_over	
	
game_over:
	li $t0, 4
	sw $t0, 4($s4)
	
	j decrease_lives
	
main_loop: 	
	lw $t0, 0($s1) 				
	lw $t1, 4($s1)
	
	li $t2, 4
	mult $t0, $t2 		#find x pixel coordinate
	mflo $t0
	li $t2, 256
	mult $t1, $t2
	mflo $t1 		#find y pixel coordinate
	addi $s0, $t0, DISPLAY_BASE 	#add coordinates to display base for top-left of sprite
	add $s0, $s0, $t1		
	sw $s0, 8($s1)			#store this coordinate before updating
	
check_if_in_liquid:
	lw $t1, 4($s1)
	bge $t1, 45, fall_in_liquid
	
check_if_touching_berry:
	addi $t1, $s0, -4	#check pixels to the left of player
	lw $t0, 20($s4)
	
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level
			
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level
	
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level
	
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	beq $t2, $t0, load_next_level
	lw $t2, 40($t1)
	beq $t2, $t0, load_next_level
	
	j key_action
	
fall_in_liquid:
	
	jal decrease_lives
	
	jal die_charmander

	li $v0, 32 
	li $a0, 500 			
	syscall
		
	j respawn

respawn: 
	jal erase_charmander

	lw $t0, 8($s4) 				
	lw $t1, 12($s4)
	
	sw $t0, 0($s1)
	sw $t1, 4($s1)
	
	j main_loop
	
key_action: 
	li $t9, 0xffff0000  
	lw $t8, 0($t9) 
	bne $t8, 1, gravity_collision_check 
	lw $t0, 0($s1) 			# load x coordinate	
	lw $t1, 4($s1)			# load y coordinate
	
	lw $t8, 4($t9)                  # checks input from keyboard
	beq $t8, 0x61, key_left   	# checks if 'a' is pressed
	beq $t8, 0x64, key_right   	# checks if 'd' is pressed
	beq $t8, 0x77, key_up   	# checks if 'w' is pressed
	beq $t8, 0x70, restart   	# checks if 'p' is pressed
	
	
	j gravity_collision_check
	
restart:
	j main 
	
key_left:
	#if touching left boundary, skip
	beq $t0, 0, gravity_collision_check
	
	#set previous y-coordinate to potential 1d marker and check for collisions
	addi $t1, $s0, -4
	
	lw $t3, 16($s4)
	
	# check all pixels to the left of sprite
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check
	
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check	
	
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check		
	
	addi $s0, $s0, -4	#update unit coordinate
	addi $t0, $t0, -1	#update charmander location
	sw $t0, 0($s1)	
	
	li $t0, 0
	sw $t0, 0($s2)		#update l/r to left
	sw $t0, 8($s3)
	
	j update_movement_iteration
	
key_right:
	#if touching right boundary, skip
	beq $t0, 55, gravity_collision_check
	
	#set previous y-coordinate to potential 1d marker and check for collisions
	addi $t1, $s0, 36
	
	lw $t3, 16($s4)
	
	# check all pixels to the right of sprite
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check	
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check	
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check	
		
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check	

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check		
	
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check	

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check		
	
	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check	

	addi $t1, $t1, 256
	lw $t2, 0($t1)
	bne $t2, $t3, gravity_collision_check	
	
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
	j gravity_collision_check 

reset_movement_iteration:
	sw $zero, 0($s3)
	j gravity_collision_check
	
key_up:
	#set vertical state to jump but need to check conditions
	li $t0, 2
	sw $t0, 4($s2)
	#set animation state to start of jump
	li $t0, 1
	sw $t0, 4($s3)
	
gravity_collision_check:
	lw $t0, 4($s2)
	
below_collision:
	addi $t1, $s0, 2560
	
	lw $t3 16($s4)
	
	#check all pixels below sprite
	lw $t2, 0($t1)				
	bne $t2, $t3, floor_below
	
	lw $t2, 4($t1)				
	bne $t2, $t3, floor_below
	
	lw $t2, 8($t1)				
	bne $t2, $t3, floor_below
	
	lw $t2, 12($t1)				
	bne $t2, $t3, floor_below
	
	lw $t2, 16($t1)				
	bne $t2, $t3, floor_below
	
	lw $t2, 20($t1)				
	bne $t2, $t3, floor_below
	
	lw $t2, 24($t1)				
	bne $t2, $t3, floor_below
	
	lw $t2, 28($t1)				
	bne $t2, $t3, floor_below
	
	lw $t2, 32($t1)				
	bne $t2, $t3, floor_below
	
	li $t1, 0		#set below_floor status to no
	sw $t1, 12($s2)

	lw $t1, 8($s2)		#check if in middle of jump
	bne $t1, 0, is_jump_apex
	j fall_state 
	
is_jump_apex:
	blt $t1, MAX_JUMP_HEIGHT, floor_above
	
fall_state:
	#set fall state
	li $t0, 0
	sw $t0, 4($s2)

shift_down:	
	#offset y coordinate 1 unit down 
	lw $t0, 4($s1)
	addi $t0, $t0, 1
	sw $t0, 4($s1)
	
	#offset player coordinate by one row
	addi $s0, $s0, 256
	
	j gravity_collision_complete
	
floor_below:
	
	li $t0, 1
	sw $t0, 12($s2)
	#reset jump iteration
	sw $zero, 8($s2)
	
	lw $t0, 4($s2)
	beq $t0, 2, floor_above
	
	
	#if vertical state is not jump, then vertically stationary
	li $t1, 1
	sw $t1, 4($s2)
	
	j gravity_collision_complete

	
floor_above:
	subi $t1, $s0, 256
	
	lw $t3, 16($s4)
	
	#check all pixels above sprite
	lw $t2, 0($t1)				
	bne $t2, $t3, above_collision_state

	lw $t2, 4($t1)				
	bne $t2, $t3, above_collision_state
	
	lw $t2, 8($t1)				
	bne $t2, $t3, above_collision_state
	
	lw $t2, 12($t1)				
	bne $t2, $t3, above_collision_state

	lw $t2, 16($t1)				
	bne $t2, $t3, above_collision_state
	
	lw $t2, 20($t1)				
	bne $t2, $t3, above_collision_state
	
	lw $t2, 24($t1)				
	bne $t2, $t3, above_collision_state

	lw $t2, 28($t1)				
	bne $t2, $t3, above_collision_state
	
	lw $t2, 32($t1)				
	bne $t2, $t3, above_collision_state
	
	#set sprite to be jumping animation
	li $t0, 1
	sw $t0, 4($s3)
	
	subi $t1, $t1, 256

check_if_one_below_floor:

 	lw $t3, 16($s4)
 	  
	#check if sprite is about to touch top, and switch to static
	lw $t2, 0($t1)				
	bne $t2, $t3, static_on_above_collision

	lw $t2, 4($t1)				
	bne $t2, $t3, static_on_above_collision
	
	lw $t2, 8($t1)				
	bne $t2, $t3, static_on_above_collision
	
	lw $t2, 12($t1)				
	bne $t2, $t3, static_on_above_collision

	lw $t2, 16($t1)				
	bne $t2, $t3, static_on_above_collision
	
	lw $t2, 20($t1)				
	bne $t2, $t3, static_on_above_collision
	
	lw $t2, 24($t1)				
	bne $t2, $t3, static_on_above_collision

	lw $t2, 28($t1)				
	bne $t2, $t3, static_on_above_collision
	
	lw $t2, 32($t1)				
	bne $t2, $t3, static_on_above_collision
	
	j shift_up
	
static_on_above_collision:
	#set sprite to be static animation
	li $t0, 0
	sw $t0, 4($s3)
	
	j shift_up

above_collision_state:
	sw $zero, 8($s2)
	
	lw $t0, 12($s2)
	beq $t0, 0, fall_state
	
	li $t0, 1 
	sw $t0, 4($s2) 
	
	j gravity_collision_complete

shift_up:
	#set vertical state to up
	li $t0, 2
	sw $t0, 4($s2)
	
	
	# decrement unit-coordinate
	subi $s0, $s0, 256
	
	lw $t0, 4($s1)
	subi $t0, $t0, 1
	sw $t0, 4($s1)
	
	lw $t0, 8($s2)
	addi $t0, $t0, 1
	sw $t0, 8($s2)
	
gravity_collision_complete:

	lw $t0, 0($s2)
	lw $t1, 4($s2)

	#only redraw if vertical and horizontal states have been changed
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
	#reset horizontal and vertical direction
	li $t0, 1
	sw $t0, 0($s2)
	sw $t0, 4($s2)
	
	li $v0, 32 
	li $a0, SLEEP_TIME   			
	syscall

	j main_loop




	

	
	
	    
	      
	
	
	







