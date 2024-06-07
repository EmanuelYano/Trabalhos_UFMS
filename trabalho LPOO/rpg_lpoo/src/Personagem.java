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
            System.out.printf(" [Saude: %.2f", getSaude());
        }else{
            System.out.printf(" [Morreu ");
        }
       // System.out.printf(" [Saude: "+ getSaude());
        System.out.println(", Forca: " + getForca() + ", Destreza: " 
        + getDestreza() + " " + getArma() + "]");
    }

    public void atacar(Personagem b){
        double dano = calculaDano();
        b.recebeDano(dano);
        /*if(!b.estaMorto()){
            System.out.println("vivão!");
        }else{
            System.out.println("faliceu!");
        }*/

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
