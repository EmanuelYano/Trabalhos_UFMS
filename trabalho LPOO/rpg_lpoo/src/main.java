import java.util.Scanner;
public class main{
    public static void main(String[] args) {
    /*  Arma espada = new Espada();
        Arma lanca = new Lanca();
        Paladino pala1 = new Paladino("Darkness", 100.0, 100.0, 15.0, lanca);
        Paladino pala2 = new Paladino("Leona", 100.0, 100.0, 12.0, espada);
        pala2.atacar(pala1);
        pala1.printStatus();
        pala2.printStatus();
    */

        Scanner scan = new Scanner(System.in);  
        int[] numeros = new int[5];
        int[] numeros2 = new int[5];
        int[] numeros3 = new int[3];
        String l1,l3,l5;
        String[] l2,l4,l6;

        l1 = scan.nextLine();
        l2 = l1.split(" ");
        numeros = convertNum(l2);

        l3 = scan.nextLine();
        l4 = l3.split(" ");
        numeros2 = convertNum(l4);

        Personagem a = CriacaoPessonagem.checagem(numeros);
        Personagem b = CriacaoPessonagem.checagem(numeros2);

        //a.printStatus();
        //b.printStatus();
        l5 = scan.nextLine();
        l6 = l5.split(" ");
        numeros3 = convertNum(l6);

        while (numeros3[0] != 0 || numeros3[1] != 0){
            if(numeros3[0] == 1){
                a.atacar(b);
            }else{
                b.atacar(a);
            }

            l5 = scan.nextLine();
            l6 = l5.split(" ");
            numeros3 = convertNum(l6);
        }


        
    }
    public static int[] convertNum(String[] l){
        int[] num = new int[l.length];
        for (int i = 0; i < l.length; i++) {
            num[i] = Integer.parseInt(l[i]);
        }
        return num;
    }
    
//intellij comunidade
    /*case 1
1 10 10 5 1 
1 10 10 6 2 
1 2 
2 1 
0

case 2
2 10 5 6 1 
2 10 6 5 2 
1 2 
2 1 
1 2 
1 2 
2 1 
1 2 
2 1 
0

case 3
3 10 10 5 1
3 10 10 6 2 
1 2 
2 1 
1 2 
0

case 4
4 10 5 6 1 
3 10 6 5 1 
1 2 
1 2 
1 2 
1 2 
2 1 
2 1 
1 2 
1 2 
2 1 
1 2 
0

case 5
4 10 5 4 2 
1 10 5 9 2 
2 1 
1 2 
2 1 
1 2 
0

 */
    
}