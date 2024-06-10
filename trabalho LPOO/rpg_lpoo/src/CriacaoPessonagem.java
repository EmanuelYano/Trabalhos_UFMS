public class CriacaoPessonagem {
    
    
    public void escolha(int[] numeros){
        if(numeros[0] == 1){
            if(numeros[4] == 1){
                Arma transmutacao = new Transmutacao();
                Mago mago = new Mago("Mago",numeros[1],numeros[2],numeros[3],transmutacao);
                mago.printStatus();
            }else{
                Arma psikappa = new Psikappa();
                Mago mago2 = new Mago("Mago",numeros[1],numeros[2],numeros[3],psikappa);
                mago2.printStatus();
    
            }
        }
    }
    
   
}

