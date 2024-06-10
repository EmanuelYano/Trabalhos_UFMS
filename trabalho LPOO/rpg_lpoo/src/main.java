import java.util.Scanner;
public class main {
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

        String l1 = scan.nextLine();
        String[] l2 = l1.split(" ");
        for (int i = 0; i < l2.length; i++) {
            numeros[i] = Integer.parseInt(l2[i]);
        }

        String l3 = scan.nextLine();
        String[] l4 = l3.split(" ");
        for (int i = 0; i < l4.length; i++) {
            numeros2[i] = Integer.parseInt(l4[i]);
        }

        escolha(numeros);

        escolha(numeros2);


        
    }

    public static int escolha(int[] numeros){
        if(numeros[0] == 1){
            if(numeros[4] == 1){
                Arma transmutacao = new Transmutacao();
                Mago mago = new Mago("Mago",numeros[1],numeros[2],numeros[3],transmutacao);
                mago.printStatus();
                return mago;
            }else{
                Arma psikappa = new Psikappa();
                Mago mago = new Mago("Mago",numeros[1],numeros[2],numeros[3],psikappa);
                mago.printStatus();
                return mago;    
            }
        }else if(numeros[0] == 2){
            if(numeros[4] == 1){
                Arma espada = new Espada();
                Paladino paladino = new Paladino("Paladino",numeros[1],numeros[2],numeros[3],espada);
                paladino.printStatus();
                return paladino;
            }else{
                Arma lanca = new Lanca();
                Paladino paladino = new Paladino("Paladino",numeros[1],numeros[2],numeros[3],lanca);
                paladino.printStatus();
                return paladino;
    
            }
        }else if(numeros[0] == 3){
            if(numeros[4] == 1){
                Arma martelo = new Martelo();
                Clerigo clerigo = new Clerigo("Clerigo",numeros[1],numeros[2],numeros[3],martelo);
                clerigo.printStatus();
                return clerigo;
            }else{
                Arma maca = new Maca();
                Clerigo clerigo = new Clerigo("Clerigo",numeros[1],numeros[2],numeros[3],maca);
                clerigo.printStatus();
                return clerigo;
    
            }
        }else{
            System.out.println("Classe não identificada");
        }
    }
}