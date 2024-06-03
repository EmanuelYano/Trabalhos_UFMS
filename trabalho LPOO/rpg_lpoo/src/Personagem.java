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

    public abstract void printStatus();
    public abstract Personagem atacar(Personagem b);

    protected abstract double calculaDano();
    protected abstract double recebeDano(double pontosDano);
    protected abstract boolean estaMorto();

}
