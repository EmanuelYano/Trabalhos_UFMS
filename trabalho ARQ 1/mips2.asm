.data
msg:	.ascii "O resultado das medias eh:"
msg2: .ascii " "

.text
_start:
  la $a3, msg2
  jal main
  addi $v0, $zero, 10 # Syscall exit
  syscall

media:
	addi	$sp, $sp, -8	# Aloca 2 ints
	sw	$fp, 4($sp)	    # Callee-save fp
	sw	$s0, 0($sp)	    # Callee-save s0
	addi	$fp, $sp, 4	  # Inicio do StackFrame
	
	add	$s0, $a0, $a1   # s0 <- a + b (params)
	srl	$v0, $s0, 1	    # v0 <- s0 / 2
	
	lw	  $fp, 4($sp)	  # Restaura fp
	lw	  $s0, 0($sp)	  # Restaura s0
	addi	$sp, $sp, 8	  # Restaura sp
	jr    $ra		        # Retorna
	
main:
	addi    $sp, $sp, -16	  # Aloca 4 ints
	sw	    $fp, 12($sp)	  # Callee-save fp
	sw	    $ra, 8($sp)	    # Callee-save ra
	addi	  $fp, $sp, 12	  # Inicio do StackFrame
	
	la	    $t0, msg	# Carrega endereco string em t0
	
	addi	$a0, $zero, 1	# a0 <- 1
	addi	$a1, $zero, 3	# a1 <- 3
	sw	  $t0, 4($sp)	  # Caller-save t0
	jal	  media		      # v0 <- media(1,3)
	
	addi	$a0, $zero, 6	# a0 <- 6
	addi	$a1, $zero, 7	# a1 <- 7
	sw	  $v0, 0($sp)	  # Caller-save v0
	jal	  media		      # v0 <- media(6,7)
	
	lw	  $a0, 4($sp)	    # a0 <- caller-save t0 (end. string)
	lw	  $a1, 0($sp) 	  # a1 <- caller-save v0 (media(1,3))
	add	  $a2, $v0, $zero # a2 <- media(6,7)
	jal   print           # print(a0, a1, a2)

  lw    $fp, 12($sp)  # Restaura $fp
  lw    $ra, 8($sp)   # Restaura $ra
  lw		$t0, 4($sp)		# Restaura $t0
  addi  $v0, $zero, 0 # Retorna 0
  addi  $sp, $sp, 16  # Restaura $sp
  jr    $ra           # return 

print:
  addi  $v0, $zero, 4 # Syscall print string
  syscall

  addi  $v0, $zero, 1   # Syscall print int
  add   $a0, $zero, $a1 # a0 <- a1
  syscall
  
  addi $v0, $zero, 4
  add $a0, $zero, $a3
  syscall
  
  addi  $v0, $zero, 1   # Syscall print int
  add   $a0, $zero, $a2 # a0 <- a2
  syscall

  addi  $v0, $zero, 11   # Syscall print char
  addi  $a0, $zero, '\n' # a0 <- byte('\n') = 15
  syscall

  jr    $ra # return 
  