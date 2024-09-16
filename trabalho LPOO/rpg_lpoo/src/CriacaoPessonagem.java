public class CriacaoPessonagem{ 
    private static Personagem xxx;

    public static Personagem checagem(int[] numeros){
        if(numeros[0]<4 && numeros[0]>=1){
            escolha(numeros);  
        }
        return xxx;
    }
    
    public static void escolha(int[] numeros){
        if(numeros[0] == 1){
            if(numeros[4] == 1){
                Arma transmutacao = new Transmutacao();
                Mago mago = new Mago(numeros[1],numeros[2],numeros[3],transmutacao);
                mago.printStatus();
                xxx = mago;
            }else{
                Arma psikappa = new Psikappa();
                Mago mago = new Mago(numeros[1],numeros[2],numeros[3],psikappa);
                mago.printStatus();
                xxx = mago;    
            }
        }else if(numeros[0] == 2){
            if(numeros[4] == 1){
                Arma espada = new Espada();
                Paladino paladino = new Paladino(numeros[1],numeros[2],numeros[3],espada);
                paladino.printStatus();
                xxx = paladino;
            }else{
                Arma lanca = new Lanca();
                Paladino paladino = new Paladino(numeros[1],numeros[2],numeros[3],lanca);
                paladino.printStatus();
                xxx = paladino;
    
            }
        }else if(numeros[0] == 3){
            if(numeros[4] == 1){
                Arma martelo = new Martelo();
                Clerigo clerigo = new Clerigo(numeros[1],numeros[2],numeros[3],martelo);
                clerigo.printStatus();
                xxx = clerigo;
            }else{
                Arma maca = new Maca();
                Clerigo clerigo = new Clerigo(numeros[1],numeros[2],numeros[3],maca);
                clerigo.printStatus();
                xxx = clerigo;
    
            }
        }
    }
}

