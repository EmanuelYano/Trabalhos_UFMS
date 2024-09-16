abstract class ArmaPaladino extends Arma{
    
    /*
        Método construtor da classe das armas que um Paladino pode utilizar, 
        parte mais genérica e abstrata, não podendo criar objetos com ela
    */
    public ArmaPaladino(String nome, double modificador) {
        super(nome, modificador);
    }
    
}
