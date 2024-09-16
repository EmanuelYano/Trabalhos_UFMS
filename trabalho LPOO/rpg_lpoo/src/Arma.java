abstract class Arma {
    
    /*
        Variáveis da classe
    */
    private String nome;
    private double modDano;

    /*
        Método construtor da classe arma
    */
    public Arma (String nome, double modificador){
        this.nome = nome;
        this.modDano = modificador;
    }

    /*
        Método que retorna o nome da arma
    */
    public String getNome(){
        return nome;
    };
    
    /*
        Método que retorna o valor do modificador de dano da arma do personagem
    */
    public double getModificador(){
        return modDano;
    };
}
