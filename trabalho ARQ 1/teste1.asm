.data
vetor: .word 3
dados: .word 15,12,1

.text
troca:
    lw $t0, 0($a0)     # $t0 = vetor[i]
    lw $t1, 0($a1)     # $t1 = vetor[j]
    sw $t1, 0($a0)     # vetor[i] = $t1
    sw $t0, 0($a1)     # vetor[j] = $t0
    jr $ra             # Retorna para o endereço de retorno
    
pivo:    
    move $t0, $a0          # $t0 <= $a0 Endereço Base
    move $t1, $a1          # $t1 <= $a1 índice inicial
    move $t2, $a2          # $t2 <= $a2 índice final
    lw $t3, ($t2)         # $t3 = pivo
    addi $t4, $t1, -4     # $t4 = $t1 - 4 (índice inicial - 1)
    move $t5, $t1          # $t5 = $t1 índice para verificação

verificacao_pivo:
    addi $t5, $t5, 4        # $t5 =+ 4 Incrementa 4, vai para o proximo byte
    lw $t6, ($t5)           # $t6 = vetor[$t5]
    ble $t6, $t3, menor     # Se vetor[$t5] <= pivô, então troca
    j verificacao_pivo      # Continua a verificação

menor:
    addi $t4, $t4, 4        # $t4 =+ 4 Incrementa 4, vai para o procimo byte
    lw $t7, ($t4)           # $t7 = vetor[$t4]
    sw $t6, ($t4)           # vetor[$t4] = $t6
    sw $t7, ($t5)           # vetor[$t5] = $t7
    j    verificacao_pivo   # Continua a verificação


quicksort:
    move $t0, $a0            # $t0 = $a0 base
    move $t1, $a1            # $t1 = $a1 índice inicial
    move $t2, $a2            # $t2 = $a2 índice final
    ble $t1, $t2, ordenado  # Se índice inicial >= índice final, retorna
    addi $sp, $sp, -12      # "Cria 3 pilhas"
    sw $ra, 0($sp)          # Salva o registrador de retorno
    sw $t0, 4($sp)          # Salva o endereço base do vetor
    sw $t1, 8($sp)          # Salva o índice inicial
    sw $t2, 12($sp)         # Salva o índice final
    jal pivo                # Chama o pivo
    lw $t0, 4($sp)          # Reinicia o endereço base do array
    lw $t1, 8($sp)          # Reinicia o índice inicial
    lw $t2, 12($sp)         # Reinicia o índice final
    addi $sp, $sp, 12       # Reinicia o ponteiro da pilha
    addi $t3, $v0, 4        # Faz o pivo ir para a proxima posição
    jal quicksort           # Chama o quicksort para ordenar a metade inicial do vetor
    move $a0, $t0           # Base do array
    move $a1, $t3           # Avança pivo para proxima posição
    move $a2, $t2           # Índice final
    jal quicksort           # Chama quicksort para ordenar a segunda parte do vetor

ordenado:
    lw $ra, 0($sp)     # Reinicia o registrador de retorno
    addi $sp, $sp, 4   # Ajusta o ponteiro da pilha
    jr $ra             # Retorna para o endereço de retorno