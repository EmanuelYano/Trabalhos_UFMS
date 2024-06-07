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
        System.out.println("Paladino [Saude: "+ getSaude() + 
        ", Forca: " + getForca() + ", Destreza: " 
        + getDestreza() + getArma() + "]");
    }

    /*public abstract Personagem atacar(Personagem b){

    };*/

    private abstract double calculaDano(){
        return forca * arma.getModificador();
    };
    private abstract void recebeDano(double pontosDano){
        saude = saude - pontosDano;
    };
    private abstract boolean estaMorto(){
        return (getSaude()>=1);
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
    /*private void setSaude(double saude){
        this.saude = saude;
    }*/

}
