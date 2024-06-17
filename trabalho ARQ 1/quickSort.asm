# inicio do trabalho

.data
tamanho: .word 3
vetor: .word 4, 2, 1

.text

main:
	la $t0, vetor		# Salvando enderecodo vetor em $t0
	lw $t1, tamanho		# Aloca tamanho do vetor em $t1
	sub $t1, $t1, 1		# subtrai 1 do tamanho do vetor
	add $a0, $t0, $zero	# Salva o vetor de $t0 em $a0
	addi $a1, $zero, 0	# Salva o indice i-inicial em $a1
	add $a2, $zero, $t1	# Salva o indice i-final $t1 em $a2
	jal ordenaRapido
	addi $v0, $zero, 10 # Syscall exit
  	syscall

ordenaRapido:
	addi $sp, $sp, -16		# Crio 4 pilhas
	sw $ra, 12($sp)			# Salva $ra na pilha (endereco de retorno)
	sw $a2, 8($sp)			# Salva $a2 na pilha (indice i-final)
	sw $a1, 4($sp)			# Salva $a1 na pilha (indice i-inicial) 
	sw $a0, 0($sp)			# Salva $a0 na pilha (vetor)
	add $t0, $a2, $zero		# Salvando indice inicial no $t0
	slt $t1, $a1, $t0		# Compara se $a1 < $t0, retorna 1 em $t1 se true, em false 0 
	beq $t1, $zero, encerrar	# Confere se $t1 se igualou a $a1 para realizar finalizacao do metodo
	jal separa			# Aciona o metodo separa(), para dar inicio a ordenacao
	add $s0, $v0, $zero		# Salva pivo em $s0
	lw $a1, 4($sp)			# Salva em $a1 indice i-inicial
	addi $a2, $s0, -1		# Salva em $a2 pivo, decrementando 1
	jal ordenaRapido		# Chama ordenaRapido(), para realizar recursao
	addi $a1, $s0, 1		# Salva em $a1 pivo, incrementando 1
	lw $a2, 8($sp)			# Salva em $a2 indice i-final
	jal ordenaRapido		
	
encerrar:

 	lw $a0, 0($sp)			# Devolve $a0 inicial
 	lw $a1, 4($sp)			# Devolve $a1 inicial
 	lw $a2, 8($sp)			# Devolve $a2 inicial
 	lw $ra, 12($sp)			# Devolve $ra inicial
 	addi $sp, $sp, 16		# Desempilha 
 	jr $ra				# Retorna ao $ra inicial
	
separa:
	addi $sp, $sp, -16		# Coloco a pilha 4x maior
	sw $ra, 12($sp)			# Salva $ra na pilha (endereco de retorno)
	sw $a2, 8($sp)			# Salva $a2 na pilha (indice i-final)
	sw $a1, 4($sp)			# Salva $a1 na pilha (indice i-inicial)
	sw $a0, 0($sp)			# Salva $a0 na pilha (vetor)	
	add $s1, $a1, $zero
	add $s2, $a2, $zero	
	# Definição do pivo
	sll $t1, $s2, 2			# Multiplica por 4 (4 bytes)
	add $t1, $t1, $a0 		# $t1 recebe nova posicao
	lw $t2, 0($t1)			# $t2 recebe conteudo da memoria (recebe o pivo)	
	addi $t3, $s1, -1		# Decrementa o i-inicial
	add $t4, $s1, $zero		# Cria o indice j
	addi $t5, $s2, -1		# Decrementa o i-final	
	jal repeticao

repeticao:
	slt $t6, $t5, $t4		# Verifica se j é menor que i-final, caso true return 0, false 1
	bne $t6, $zero, fimRep		# Se o retorno por 1, continua as instrucoes, caso 0 vai direto para o fimRep
	sll $t1, $t4, 2			# Multiplica por 4 (4 bytes)
	add $t1, $t1, $a0		# $t1 recebe nova posicao de endereco
	lw $t7, 0($t1)			# $t7 recebe conteudo da memoria
	slt $t8, $t2, $t7		# Confere se pivo < que valor de indice j
	bne $t8, $zero, fimSe		# Confere o retorno de $t8, se 1 -> fimSe, se 0 -> continua as instrucoes
	addi $t3, $t3, 1		# Incrementa 1 no i-inicial
	add $a1, $t3, $zero		# Salva valor de indice i em $a1
	add $a2, $t4, $zero		# Salva valor de indice j em $a2
	jal troca			# Chama o metodo troca()		
	addi $t4, $t4, 1		# Incrementa 1 no j
	j repeticao			# Retorna ao inicio da repeticao

	fimSe:
		addi $t4, $t4, 1	# Incrementa 1 no j
		j repeticao		# Retorna ao inicio da repeticao

fimRep:
	addi $a1, $t3, 1		# $a1 recebe i-inicial + 1
	add $a2, $s2, $zero		# $a2 recebe i-final
	add $v0, $a1, $zero		# Salva $a1 em $v0
	jal troca			# Chama o metodo troca()	
	lw $ra, 12($sp)			# Devolve $ra inicial
	addi $sp, $sp, 16		# Desempilha
	jr $ra				# Retorna para $ra	
	

troca:
	addi $sp, $sp, -12	# Crio 3 pilhas
	sw $a0, 0($sp)		# Salva $a0 na pilha (vetor)
	sw $a1, 4($sp)		# Salva $a1 na pilha (indice i-inicial)
	sw $a2, 8($sp)		# Salva $a2 na pilha (indice i-final)
	sll $t1, $a1, 2 	# Multiplica por 4 (4 bytes)
	add $t1, $a0, $t1	# $t1 recebe nova posicao de endereco
	lw $s3, 0($t1)		# $s3 recebe conteudo da memoria
	sll $t2, $a2, 2		# Multiplica por 4 (4 bytes)
	add $t2, $a0, $t2	# $t2 recebe nova posicao de endereco
	lw $s4, 0($t2)		# $s4 recebe conteudo da memoria
	# Fazendo a inversao dos valores
	sw $s4, 0($t1)		# Salva $s4 na memoria de $t1
	sw $s3, 0($t2)		# Salva $s3 na memoria de $t2 
	addi $sp, $sp, 12	# Restauro a pilha
	jr $ra			# Retorno ao $ra inicial
    
    











