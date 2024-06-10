import java.util.Locale;
abstract class Personagem {

    private String nomeTipo;
    private double saude;
    private double forca;
    private double destreza;
    private Arma arma;
    
    public Personagem(String nomeTipo, double saude, double forca, 
    double destreza, Arma arma){

        this.nomeTipo = nomeTipo;
        this.saude = saude;
        this.forca = forca;
        this.destreza = destreza;
        this.arma = arma;
    } 

    public void printStatus(){
        System.out.printf(getNometipo());
        if(!estaMorto()){
            System.out.printf(Locale.US, " [Saude: %.1f", getSaude());
        }else{
            System.out.printf(" [Morreu");
        }
       // System.out.printf(" [Saude: "+ getSaude());
        System.out.println(", Forca: " + getForca() + ", Destreza: " 
        + getDestreza() + ", " + getArma() + "]");
    }

    public void atacar(Personagem b){
        //double dano = calculaDano();
        //b.recebeDano(dano);
        if(!estaMorto()){
            System.out.println("O "+ this.nomeTipo + " ataca o "+this.getNometipo()+" com "+this.getArma()+".");
            if(this.destreza > b.getDestreza()){
                if(!b.estaMorto()){
                    b.recebeDano(calculaDano());
                    System.out.println("O ataque foi efetivo com "+calculaDano()+" pontos de dano!");
                }else{
                    System.out.println("Pare! O "+b.getNometipo()+" ja está morto!");
                }
            }else if(this.destreza < b.getDestreza()){
                if(!b.estaMorto()){
                    recebeDano(calculaDano());
                    System.out.println("O ataque foi inefetivo e revidado com "+calculaDano()+" pontos de dano!");
                }else{
                    System.out.println("Pare! O "+getNometipo()+" ja está morto!");
                }
            }else{
                if(!b.estaMorto()){
                    System.out.println("O ataque foi defendido, ninguem se machucou!");            
                }
            }
        }else if(estaMorto()){
            System.out.println("O "+ this.nomeTipo + " não consegue atacar, pois esta morto. ");
        }

    };


    private double calculaDano(){
        return forca * (1 + arma.getModificador());
    };
    private double recebeDano(double pontosDano){
        double attSaude;
        attSaude = getSaude() - pontosDano;
        setSaude(attSaude);
        return attSaude;
    };
    private boolean estaMorto(){
        return (getSaude()<1);
    };


    private String getNometipo(){
        return nomeTipo;
    };
    private String getArma(){
        return arma.getNome();
    } 

    private double getForca(){
        return forca;
    }

    private double getDestreza(){
        return destreza;
    }

    private double getSaude(){
        return saude;
    }
    private void setSaude(double saude){
        this.saude = saude;
    }

}
