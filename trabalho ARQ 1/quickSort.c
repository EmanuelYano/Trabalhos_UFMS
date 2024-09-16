#include <stdio.h>
/* Como você modificaria a função quicksort 
para ordenar elementos em ordem descrescente*/

void troca(int *x, int *y){
    int z;
    z = *x;
    *x = *y;
    *y = z;
}

int separa(int p, int r, int num[r]){
    int x,i,j;
    x = num[p];
    i = p - 1;
    printf("\n %d ",i);
    j = r + 1;
    while(i<j){
        do{
            j--;
        }while(num[j] > x);//>
        do{
            i++;
        }while(num[i] < x);//<
        if(i<j)
            troca(&num[i],&num[j]);
        else
            return j;  
    }
}

void orde_rapida(int p, int r, int num[r]){
    int q;
    if(p < r){
        q = separa(p,r,num);
        orde_rapida(p,q,num);
        orde_rapida(q+1,r,num);
    }
}

int main(){
    int n;
    printf("Digite a quantidade de numeros: ");
    scanf("%d", &n);
    int num[n];
    printf("Digite os numeros: ");
    for(int i = 0; i < n; i++)
        scanf("%d", &num[i]);
    orde_rapida(0,n,num);
    printf("\nOrdem crescente numeros: ");
    for(int i = 1; i <= n; i++)
        printf("%d ", num[i]);
    return 0;
}
