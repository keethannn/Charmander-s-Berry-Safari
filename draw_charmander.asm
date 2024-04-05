.eqv BACKGROUND 0xbfedff
.eqv DD_RED 0x300000
.eqv D_RED 0xb30000
.eqv L_RED 0xc83636
.eqv D_ORANGE 0xad4304
.eqv L_ORANGE 0xf85d00
.eqv YELLOW 0xf8e100
.eqv D_GREEN 0x02754f



erase_charmander:
	
	li $t0, BACKGROUND
	move $t1, $s0
	
	#row 1
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)

	#row 2
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	#row 3
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	#row 4
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	#row 5
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	#row 6
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	#row 7
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	#row 8
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	#row 9
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	#row 10
	addi $t1, $t1, 256
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	sw $t0, 16($t1)
	sw $t0, 20($t1)
	sw $t0, 24($t1)
	sw $t0, 28($t1)
	sw $t0, 32($t1)
	
	jr $ra
	
set_charmander_background:
	li $t1, BACKGROUND
	li $t2, BACKGROUND
	li $t3, BACKGROUND
	li $t4, BACKGROUND
	li $t5, BACKGROUND
	li $t6, BACKGROUND
	li $t7, BACKGROUND
	
	jr $ra

set_charmander_colors:   
	li $t1, DD_RED
	li $t2, D_RED
	li $t3, L_RED
	li $t4, D_ORANGE
	li $t5, L_ORANGE
	li $t6, YELLOW
	li $t7, D_GREEN
	
	jr $ra
	
charmander_left_static: 
	
	sw $t1, 24($s0)
        sw $t1, 16($s0)
        sw $t1, 12($s0)
        sw $t1, 8($s0)
        sw $t1, 4($s0)
        sw $t1, 284($s0)
        sw $t2, 280($s0)
        sw $t1, 276($s0)
        sw $t4, 272($s0)
        sw $t5, 268($s0)
        sw $t5, 264($s0)
        sw $t5, 260($s0)
        sw $t1, 256($s0)
        sw $t1, 544($s0)
        sw $t2, 540($s0)
        sw $t3, 536($s0)
        sw $t1, 532($s0)
        sw $t4, 528($s0)
        sw $t7, 524($s0)
        sw $t5, 520($s0)
        sw $t7, 516($s0)
        sw $t1, 512($s0)
        sw $t1, 800($s0)
        sw $t3, 796($s0)
        sw $t6, 792($s0)
        sw $t1, 788($s0)
        sw $t4, 784($s0)
        sw $t5, 780($s0)
        sw $t5, 776($s0)
        sw $t5, 772($s0)
        sw $t1, 768($s0)
        sw $t1, 1056($s0)
        sw $t6, 1052($s0)
        sw $t6, 1048($s0)
        sw $t1, 1044($s0)
        sw $t5, 1040($s0)
        sw $t6, 1036($s0)
        sw $t6, 1032($s0)
        sw $t1, 1028($s0)
        sw $t1, 1308($s0)
        sw $t5, 1304($s0)
        sw $t1, 1300($s0)
        sw $t4, 1296($s0)
        sw $t5, 1292($s0)
        sw $t6, 1288($s0)
        sw $t4, 1284($s0)
        sw $t1, 1280($s0)
        sw $t1, 1564($s0)
        sw $t5, 1560($s0)
        sw $t4, 1556($s0)
        sw $t5, 1552($s0)
        sw $t6, 1548($s0)
        sw $t6, 1544($s0)
        sw $t1, 1540($s0)
        sw $t1, 1820($s0)
        sw $t4, 1816($s0)
        sw $t5, 1812($s0)
        sw $t5, 1808($s0)
        sw $t6, 1804($s0)
        sw $t6, 1800($s0)
        sw $t1, 1796($s0)
        sw $t1, 2072($s0)
        sw $t4, 2068($s0)
        sw $t5, 2064($s0)
        sw $t1, 2060($s0)
        sw $t4, 2056($s0)
        sw $t4, 2052($s0)
        sw $t1, 2048($s0)
        sw $t1, 2324($s0)
        sw $t1, 2320($s0)
        sw $t1, 2312($s0)
        sw $t1, 2308($s0)

	jr $ra
	
charmander_left_jump:
	
	sw $t1, 280($s0)
        sw $t1, 272($s0)
        sw $t1, 268($s0)
        sw $t1, 264($s0)
        sw $t1, 260($s0)
        sw $t1, 540($s0)
        sw $t2, 536($s0)
        sw $t1, 532($s0)
        sw $t4, 528($s0)
        sw $t5, 524($s0)
        sw $t5, 520($s0)
        sw $t5, 516($s0)
        sw $t1, 512($s0)
        sw $t1, 800($s0)
        sw $t2, 796($s0)
        sw $t3, 792($s0)
        sw $t1, 788($s0)
        sw $t4, 784($s0)
        sw $t7, 780($s0)
        sw $t5, 776($s0)
        sw $t7, 772($s0)
        sw $t1, 768($s0)
        sw $t1, 1056($s0)
        sw $t3, 1052($s0)
        sw $t6, 1048($s0)
        sw $t1, 1044($s0)
        sw $t4, 1040($s0)
        sw $t5, 1036($s0)
        sw $t5, 1032($s0)
        sw $t5, 1028($s0)
        sw $t1, 1024($s0)
        sw $t1, 1312($s0)
        sw $t6, 1308($s0)
        sw $t6, 1304($s0)
        sw $t1, 1300($s0)
        sw $t5, 1296($s0)
        sw $t6, 1292($s0)
        sw $t6, 1288($s0)
        sw $t1, 1284($s0)
        sw $t1, 1564($s0)
        sw $t5, 1560($s0)
        sw $t1, 1556($s0)
        sw $t4, 1552($s0)
        sw $t5, 1548($s0)
        sw $t6, 1544($s0)
        sw $t4, 1540($s0)
        sw $t1, 1536($s0)
        sw $t1, 1820($s0)
        sw $t5, 1816($s0)
        sw $t4, 1812($s0)
        sw $t5, 1808($s0)
        sw $t6, 1804($s0)
        sw $t6, 1800($s0)
        sw $t1, 1796($s0)
        sw $t1, 2076($s0)
        sw $t4, 2072($s0)
        sw $t5, 2068($s0)
        sw $t5, 2064($s0)
        sw $t6, 2060($s0)
        sw $t6, 2056($s0)
        sw $t1, 2052($s0)
        sw $t1, 2048($s0)
        sw $t1, 2328($s0)
        sw $t1, 2324($s0)
        sw $t1, 2320($s0)
        sw $t1, 2316($s0)
        sw $t1, 2312($s0)
        sw $t1, 2308($s0)
        
        jr $ra

	
charmander_right_static:
	 
	#1st row
	sw $t1, 8($s0)
	sw $t1, 16($s0)
	sw $t1, 20($s0)
	sw $t1, 24($s0)
	sw $t1, 28($s0)
	
	#2nd row
	sw $t1, 260($s0)
	sw $t2, 264($s0)
	sw $t1, 268($s0)
	sw $t4, 272($s0)
	sw $t5, 276($s0)
	sw $t5, 280($s0)
	sw $t5, 284($s0)
	sw $t1, 288($s0)
	
	#3rd row
	sw $t1, 512($s0)
	sw $t2, 516($s0)
	sw $t3, 520($s0)
	sw $t1, 524($s0)
	sw $t4, 528($s0)
	sw $t7, 532($s0)
	sw $t5, 536($s0)
	sw $t7, 540($s0)
	sw $t1, 544($s0)
	
	#4th row
	sw $t1, 768($s0)
	sw $t3, 772($s0)
	sw $t6, 776($s0)
	sw $t1, 780($s0)
	sw $t4, 784($s0)
	sw $t5, 788($s0)
	sw $t5, 792($s0)
	sw $t5, 796($s0)
	sw $t1, 800($s0)
	
	#5th row
	sw $t1, 1024($s0)
	sw $t6, 1028($s0)
	sw $t6, 1032($s0)
	sw $t1, 1036($s0)
	sw $t5, 1040($s0)
	sw $t6, 1044($s0)
	sw $t6, 1048($s0)
	sw $t1, 1052($s0)
	
	#6th row
	sw $t1, 1284($s0)
	sw $t5, 1288($s0)
	sw $t1, 1292($s0)
	sw $t4, 1296($s0)
	sw $t5, 1300($s0)
	sw $t6, 1304($s0)
	sw $t4, 1308($s0)
	sw $t1, 1312($s0)
	
	#7th row
	sw $t1, 1540($s0)
	sw $t5, 1544($s0)
	sw $t4, 1548($s0)
	sw $t5, 1552($s0)
	sw $t6, 1556($s0)
	sw $t6, 1560($s0)
	sw $t1, 1564($s0)
	
	#8th row 
	sw $t1, 1796($s0)
	sw $t4, 1800($s0)
	sw $t5, 1804($s0)
	sw $t5, 1808($s0)
	sw $t6, 1812($s0)
	sw $t6, 1816($s0)
	sw $t1, 1820($s0)
	
	#9th row
	sw $t1, 2056($s0)
	sw $t4, 2060($s0)
	sw $t5, 2064($s0)
	sw $t1, 2068($s0)
	sw $t4, 2072($s0)
	sw $t4, 2076($s0)
	sw $t1, 2080($s0)
	
	#10th row 
	sw $t1, 2316($s0)
	sw $t1, 2320($s0)
	sw $t1, 2328($s0)
	sw $t1, 2332($s0)
	
	jr $ra
	
charmander_right_jump:
	 
	sw $t1, 264($s0)
        sw $t1, 272($s0)
        sw $t1, 276($s0)
        sw $t1, 280($s0)
        sw $t1, 284($s0)
        sw $t1, 516($s0)
        sw $t2, 520($s0)
        sw $t1, 524($s0)
        sw $t4, 528($s0)
        sw $t5, 532($s0)
        sw $t5, 536($s0)
        sw $t5, 540($s0)
        sw $t1, 544($s0)
        sw $t1, 768($s0)
        sw $t2, 772($s0)
        sw $t3, 776($s0)
        sw $t1, 780($s0)
        sw $t4, 784($s0)
        sw $t7, 788($s0)
        sw $t5, 792($s0)
        sw $t7, 796($s0)
        sw $t1, 800($s0)
        sw $t1, 1024($s0)
        sw $t3, 1028($s0)
        sw $t6, 1032($s0)
        sw $t1, 1036($s0)
        sw $t4, 1040($s0)
        sw $t5, 1044($s0)
        sw $t5, 1048($s0)
        sw $t5, 1052($s0)
        sw $t1, 1056($s0)
        sw $t1, 1280($s0)
        sw $t6, 1284($s0)
        sw $t6, 1288($s0)
        sw $t1, 1292($s0)
        sw $t5, 1296($s0)
        sw $t6, 1300($s0)
        sw $t6, 1304($s0)
        sw $t1, 1308($s0)
        sw $t1, 1540($s0)
        sw $t5, 1544($s0)
        sw $t1, 1548($s0)
        sw $t4, 1552($s0)
        sw $t5, 1556($s0)
        sw $t6, 1560($s0)
        sw $t4, 1564($s0)
        sw $t1, 1568($s0)
        sw $t1, 1796($s0)
        sw $t5, 1800($s0)
        sw $t4, 1804($s0)
        sw $t5, 1808($s0)
        sw $t6, 1812($s0)
        sw $t6, 1816($s0)
        sw $t1, 1820($s0)
        sw $t1, 2052($s0)
        sw $t4, 2056($s0)
        sw $t5, 2060($s0)
        sw $t5, 2064($s0)
        sw $t6, 2068($s0)
        sw $t6, 2072($s0)
        sw $t1, 2076($s0)
        sw $t1, 2080($s0)
        sw $t1, 2312($s0)
        sw $t1, 2316($s0)
        sw $t1, 2320($s0)
        sw $t1, 2324($s0)
        sw $t1, 2328($s0)
        sw $t1, 2332($s0)
	
	jr $ra
	
charmander_left_left:
	sw $t1, 24($s0)
        sw $t1, 16($s0)
        sw $t1, 12($s0)
        sw $t1, 8($s0)
        sw $t1, 4($s0)
        sw $t1, 284($s0)
        sw $t2, 280($s0)
        sw $t1, 276($s0)
        sw $t4, 272($s0)
        sw $t5, 268($s0)
        sw $t5, 264($s0)
        sw $t5, 260($s0)
        sw $t1, 256($s0)
        sw $t1, 544($s0)
        sw $t2, 540($s0)
        sw $t3, 536($s0)
        sw $t1, 532($s0)
        sw $t4, 528($s0)
        sw $t7, 524($s0)
        sw $t5, 520($s0)
        sw $t7, 516($s0)
        sw $t1, 512($s0)
        sw $t1, 800($s0)
        sw $t3, 796($s0)
        sw $t6, 792($s0)
        sw $t1, 788($s0)
        sw $t4, 784($s0)
        sw $t5, 780($s0)
        sw $t5, 776($s0)
        sw $t5, 772($s0)
        sw $t1, 768($s0)
        sw $t1, 1056($s0)
        sw $t6, 1052($s0)
        sw $t6, 1048($s0)
        sw $t1, 1044($s0)
        sw $t5, 1040($s0)
        sw $t6, 1036($s0)
        sw $t6, 1032($s0)
        sw $t1, 1028($s0)
        sw $t1, 1308($s0)
        sw $t5, 1304($s0)
        sw $t1, 1300($s0)
        sw $t4, 1296($s0)
        sw $t5, 1292($s0)
        sw $t6, 1288($s0)
        sw $t4, 1284($s0)
        sw $t1, 1280($s0)
        sw $t1, 1564($s0)
        sw $t5, 1560($s0)
        sw $t4, 1556($s0)
        sw $t5, 1552($s0)
        sw $t6, 1548($s0)
        sw $t6, 1544($s0)
        sw $t1, 1540($s0)
        sw $t1, 1820($s0)
        sw $t4, 1816($s0)
        sw $t5, 1812($s0)
        sw $t5, 1808($s0)
        sw $t6, 1804($s0)
        sw $t6, 1800($s0)
        sw $t1, 1796($s0)
        sw $t1, 2072($s0)
        sw $t1, 2068($s0)
        sw $t1, 2064($s0)
        sw $t1, 2060($s0)
        sw $t4, 2056($s0)
        sw $t4, 2052($s0)
        sw $t1, 2048($s0)
        sw $t1, 2312($s0)
        sw $t1, 2308($s0)
        
        jr $ra
        
charmander_left_right:
	sw $t1, 24($s0)
        sw $t1, 16($s0)
        sw $t1, 12($s0)
        sw $t1, 8($s0)
        sw $t1, 4($s0)
        sw $t1, 284($s0)
        sw $t2, 280($s0)
        sw $t1, 276($s0)
        sw $t4, 272($s0)
        sw $t5, 268($s0)
        sw $t5, 264($s0)
        sw $t5, 260($s0)
        sw $t1, 256($s0)
        sw $t1, 544($s0)
        sw $t2, 540($s0)
        sw $t3, 536($s0)
        sw $t1, 532($s0)
        sw $t4, 528($s0)
        sw $t7, 524($s0)
        sw $t5, 520($s0)
        sw $t7, 516($s0)
        sw $t1, 512($s0)
        sw $t1, 800($s0)
        sw $t3, 796($s0)
        sw $t6, 792($s0)
        sw $t1, 788($s0)
        sw $t4, 784($s0)
        sw $t5, 780($s0)
        sw $t5, 776($s0)
        sw $t5, 772($s0)
        sw $t1, 768($s0)
        sw $t1, 1056($s0)
        sw $t6, 1052($s0)
        sw $t6, 1048($s0)
        sw $t1, 1044($s0)
        sw $t5, 1040($s0)
        sw $t6, 1036($s0)
        sw $t6, 1032($s0)
        sw $t1, 1028($s0)
        sw $t1, 1308($s0)
        sw $t5, 1304($s0)
        sw $t1, 1300($s0)
        sw $t4, 1296($s0)
        sw $t5, 1292($s0)
        sw $t6, 1288($s0)
        sw $t4, 1284($s0)
        sw $t1, 1280($s0)
        sw $t1, 1564($s0)
        sw $t5, 1560($s0)
        sw $t4, 1556($s0)
        sw $t5, 1552($s0)
        sw $t6, 1548($s0)
        sw $t6, 1544($s0)
        sw $t1, 1540($s0)
        sw $t1, 1820($s0)
        sw $t4, 1816($s0)
        sw $t5, 1812($s0)
        sw $t5, 1808($s0)
        sw $t6, 1804($s0)
        sw $t6, 1800($s0)
        sw $t1, 1796($s0)
        sw $t1, 2072($s0)
        sw $t4, 2068($s0)
        sw $t5, 2064($s0)
        sw $t1, 2060($s0)
        sw $t1, 2056($s0)
        sw $t1, 2324($s0)
        sw $t1, 2320($s0)
        
        jr $ra


charmander_right_left:
	 
	#1st row
	sw $t1, 8($s0)
	sw $t1, 16($s0)
	sw $t1, 20($s0)
	sw $t1, 24($s0)
	sw $t1, 28($s0)
	
	#2nd row
	sw $t1, 260($s0)
	sw $t2, 264($s0)
	sw $t1, 268($s0)
	sw $t4, 272($s0)
	sw $t5, 276($s0)
	sw $t5, 280($s0)
	sw $t5, 284($s0)
	sw $t1, 288($s0)
	
	#3rd row
	sw $t1, 512($s0)
	sw $t2, 516($s0)
	sw $t3, 520($s0)
	sw $t1, 524($s0)
	sw $t4, 528($s0)
	sw $t7, 532($s0)
	sw $t5, 536($s0)
	sw $t7, 540($s0)
	sw $t1, 544($s0)
	
	#4th row
	sw $t1, 768($s0)
	sw $t3, 772($s0)
	sw $t6, 776($s0)
	sw $t1, 780($s0)
	sw $t4, 784($s0)
	sw $t5, 788($s0)
	sw $t5, 792($s0)
	sw $t5, 796($s0)
	sw $t1, 800($s0)
	
	#5th row
	sw $t1, 1024($s0)
	sw $t6, 1028($s0)
	sw $t6, 1032($s0)
	sw $t1, 1036($s0)
	sw $t5, 1040($s0)
	sw $t6, 1044($s0)
	sw $t6, 1048($s0)
	sw $t1, 1052($s0)
	
	#6th row
	sw $t1, 1284($s0)
	sw $t5, 1288($s0)
	sw $t1, 1292($s0)
	sw $t4, 1296($s0)
	sw $t5, 1300($s0)
	sw $t6, 1304($s0)
	sw $t4, 1308($s0)
	sw $t1, 1312($s0)
	
	#7th row
	sw $t1, 1540($s0)
	sw $t5, 1544($s0)
	sw $t4, 1548($s0)
	sw $t5, 1552($s0)
	sw $t6, 1556($s0)
	sw $t6, 1560($s0)
	sw $t1, 1564($s0)
	
	#8th row 
	sw $t1, 1796($s0)
	sw $t4, 1800($s0)
	sw $t5, 1804($s0)
	sw $t5, 1808($s0)
	sw $t6, 1812($s0)
	sw $t6, 1816($s0)
	sw $t1, 1820($s0)
	
	#9th row
	sw $t1, 2056($s0)
	sw $t4, 2060($s0)
	sw $t5, 2064($s0)
	sw $t1, 2068($s0)
	sw $t1, 2072($s0)
	
	#10th row 
	sw $t1, 2316($s0)
	sw $t1, 2320($s0)
	
	jr $ra

charmander_right_right:
	 
	#1st row
	sw $t1, 8($s0)
	sw $t1, 16($s0)
	sw $t1, 20($s0)
	sw $t1, 24($s0)
	sw $t1, 28($s0)
	
	#2nd row
	sw $t1, 260($s0)
	sw $t2, 264($s0)
	sw $t1, 268($s0)
	sw $t4, 272($s0)
	sw $t5, 276($s0)
	sw $t5, 280($s0)
	sw $t5, 284($s0)
	sw $t1, 288($s0)
	
	#3rd row
	sw $t1, 512($s0)
	sw $t2, 516($s0)
	sw $t3, 520($s0)
	sw $t1, 524($s0)
	sw $t4, 528($s0)
	sw $t7, 532($s0)
	sw $t5, 536($s0)
	sw $t7, 540($s0)
	sw $t1, 544($s0)
	
	#4th row
	sw $t1, 768($s0)
	sw $t3, 772($s0)
	sw $t6, 776($s0)
	sw $t1, 780($s0)
	sw $t4, 784($s0)
	sw $t5, 788($s0)
	sw $t5, 792($s0)
	sw $t5, 796($s0)
	sw $t1, 800($s0)
	
	#5th row
	sw $t1, 1024($s0)
	sw $t6, 1028($s0)
	sw $t6, 1032($s0)
	sw $t1, 1036($s0)
	sw $t5, 1040($s0)
	sw $t6, 1044($s0)
	sw $t6, 1048($s0)
	sw $t1, 1052($s0)
	
	#6th row
	sw $t1, 1284($s0)
	sw $t5, 1288($s0)
	sw $t1, 1292($s0)
	sw $t4, 1296($s0)
	sw $t5, 1300($s0)
	sw $t6, 1304($s0)
	sw $t4, 1308($s0)
	sw $t1, 1312($s0)
	
	#7th row
	sw $t1, 1540($s0)
	sw $t5, 1544($s0)
	sw $t4, 1548($s0)
	sw $t5, 1552($s0)
	sw $t6, 1556($s0)
	sw $t6, 1560($s0)
	sw $t1, 1564($s0)
	
	#8th row 
	sw $t1, 1796($s0)
	sw $t4, 1800($s0)
	sw $t5, 1804($s0)
	sw $t5, 1808($s0)
	sw $t6, 1812($s0)
	sw $t6, 1816($s0)
	sw $t1, 1820($s0)
	
	#9th row
	sw $t1, 2056($s0)
	sw $t1, 2060($s0)
	sw $t1, 2064($s0)
	sw $t1, 2068($s0)
	sw $t4, 2072($s0)
	sw $t4, 2076($s0)
	sw $t1, 2080($s0)
	
	#10th row
	sw $t1, 2328($s0)
	sw $t1, 2332($s0)
	
	jr $ra
