abstract class ArmaMago extends Arma{
    
    /*
        Método construtor da classe das armas que um Mago pode utilizar, 
        parte mais genérica e abstrata, não podendo criar objetos com ela
    */
    public ArmaMago(String nome, double modificador) {
        super(nome, modificador);
    }
    
}
