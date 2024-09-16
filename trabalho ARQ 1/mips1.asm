# Faculdade de Computa¸c~ao
# Universidade Federal de Mato Grosso do Sul
# Arquitetura de Computadores I
# Prof. Renan Albuquerque Marks
#
# Exemplo de c´odigo de montagem de um algoritmo
#
# Seção de dados do programa.
# Usada para "nomear" com labels endere¸cos de mem´oria que s~ao alocados e
# inicializados no inic´?cio do programa.
.data
tamanho: .word 3
vetor: .word 20, 30, 0

# Seçãoo de texto do programa.
# Usada para informar as instru¸c~oes MIPS do programa.

.text
# start()
#------------
_start:
addi $sp, $sp, -4 	# Aloca Stack-Frame 1 palavra
sw $ra, 0($sp) 		# Salva Callee-save
jal main 		# main()
lw $ra, 0($sp) 		# Restaura Callee-save
addi $sp, $sp, 4 	# Desaloca Stack-Frame 1 palavra
addi $v0, $zero, 10
syscall 		# Chamada de sistema para finaliza¸c~ao (exit system call)


# main()
#------------
main:
addi $sp, $sp, -4 	# Aloca Stack-Frame 1 palavra
sw $ra, 0($sp) 		# Salva Callee-save
la $t0, vetor 		# Carrega endere¸co base (inicial) do vetor para $t5
lw $t1, tamanho 	# Carrega palavra de dados apontada pelo label "tamanho"
addi $t1, $t1, -1 	# Decrementa tamanho em 1, para indexar o vetor de 0 a 9
lw $t2, 0($t0) 		# Carrega primeiro elemento do vetor para $t2
lw $t3, 4($t0)		# Carrega segundo elemento do vetor para $t3
add $t2, $t2, $t3 	# Soma o primeiro com o segundo elemento
sw $t2, 8($t0) 		# Armazena a soma na terceira posicao do vetor
lw $ra, 0($sp) 		# Restaura Callee-save
addi $sp, $sp, 4 	# Desaloca Stack-Frame 1 palavra
jr $ra 			# Return
