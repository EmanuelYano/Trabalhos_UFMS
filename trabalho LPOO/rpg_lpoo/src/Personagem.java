import java.util.Locale;

public abstract class Personagem {
    
    /* 
        Declaração das variáveis
    */
    private String nomeTipo;
    private double saude;
    private double forca;
    private double destreza;
    private Arma arma;
    
    /*
        Método construtor da classe
    */
    public Personagem(String nomeTipo, double saude, double forca, 
    double destreza, Arma arma){

        this.nomeTipo = nomeTipo;
        this.saude = saude;
        this.forca = forca;
        this.destreza = destreza;
        this.arma = arma;
    } 

    /*
        Método para imprimir os status do personagem
    */
    public void printStatus(){
        System.out.printf(getNometipo());
        if(!estaMorto()){
            System.out.printf(Locale.US, " [Saude: %.1f", getSaude());
        }else{
            System.out.printf(" [Morto");
        }
        System.out.println(", Forca: " + getForca() + ", Destreza: " 
        + getDestreza() + ", " + getArma() + "]");
    }

    /*
        Método principal, onde está a lógica de funcionamento das batalhas, 
        realizando o cálculo do dano e retirando os pontos de vida necessário, 
        além de verificar se personagem está vivo ou morto para conseguir 
        realizar o ataque
    */
    public void atacar(Personagem b){
        if(!estaMorto()){
            System.out.println("O "+ this.nomeTipo + " ataca o "+b.getNometipo()+" com "+this.getArma()+".");
            if(this.destreza > b.getDestreza()){
                if(!b.estaMorto()){
                    double dano = calculaDano();
                    b.recebeDano(dano);
                    System.out.println("O ataque foi efetivo com "+dano+" pontos de dano!");
                }else{
                    System.out.println("Pare! O "+b.getNometipo()+" ja está morto!");
                }
            }else if(this.destreza < b.getDestreza()){
                if(!b.estaMorto()){
                    double dano = b.calculaDano();
                    recebeDano(dano);
                    System.out.println("O ataque foi inefetivo e revidado com "+dano+" pontos de dano!");
                }else{
                    System.out.println("Pare! O "+getNometipo()+" ja está morto!");
                }
            }else{
                if(!b.estaMorto()){
                    System.out.println("O ataque foi defendido, ninguem se machucou!");            
                }
            }
        }else{
            System.out.println("O "+ this.nomeTipo + " não consegue atacar, pois esta morto. ");
        }

    }

    /*
        Método para realizar o cálculo de dano que será aplicado ao personagem,
        através do modificador da arma vezes força
    */
    private double calculaDano(){
        return forca * arma.getModificador();
    }
    
    /*
        Método para realizar o cálculo de pontos de vida do personagem a serem
        retirados
    */
    private double recebeDano(double pontosDano){
        double attSaude;
        attSaude = getSaude() - pontosDano;
        setSaude(attSaude);
        return attSaude;
    }
    
    /*
        Método que devolve se personagem está vivo ou morto
    */
    private boolean estaMorto(){
        return (getSaude()<1);
    }

    /*
        Método que retorna o tipo do personagem
    */
    private String getNometipo(){
        return nomeTipo;
    }
    
    /*
        Método que retorna o tipo de arma utilizada
    */
    private String getArma(){
        return arma.getNome();
    }

    /*
        Método que retorna a quantidade de força do personagem
    */
    private double getForca(){
       return forca;
    }

    /*
        Método que retorna a quantidade de destreza do personagem
    */
    private double getDestreza(){
        return destreza;
    }

    /*
        Método que retorna a quantidade de pontos de vida do personagem
    */
    private double getSaude(){
        return saude;
    }

    /*
        Método que realiza a atualização da vida do personagem
    */    
    private void setSaude(double saude){
        this.saude = saude;
    }
}
