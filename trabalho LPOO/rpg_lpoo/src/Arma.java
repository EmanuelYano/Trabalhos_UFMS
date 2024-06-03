abstract class Arma {
    
    private String nome;
    private double modDano;

    public Arma (String nome, double modificador){

        this.nome = nome;
        this.modDano = modificador;
    }

    abstract public String getNome();
    abstract public double getModificador();
}
