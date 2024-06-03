public class Paladino extends Personagem{
    
    public Paladino(String nomeTipo, double saude, double forca, 
    double destreza, Arma arma){
        super(nomeTipo, saude, forca, destreza, arma);
    }

    public void printStatus(){
        System.out.println("Paladino [Saude: "+ getSaude() + 
        ", Forca: " + getForca() + ", Destreza: " 
        + getDestreza() + getArma() + "]");
    }

    public Personagem atacar(Personagem b){
        return b;
    }

    protected double calculaDano(){
        return 0;
    }

    protected double recebeDano(double pontosDano){
        return 0;
    }
    protected boolean estaMorto(){
        return true;
    }


    private String getArma(){

    } 

    private double getForca(){

    }

    private double getDestreza(){

    }

    private double getSaude(){
        
    }
}
