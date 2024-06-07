public class main {
    public static void main(String[] args) {
        Arma espada = new Espada();
        Arma lanca = new Lanca();
        Paladino pala1 = new Paladino("Darkness", 100.0, 15.0, 15.0, lanca);
        Paladino pala2 = new Paladino("Leona", 100.0, 18.0, 12.0, espada);
        
        pala1.printStatus();
        pala2.printStatus();
       // System.out.println(espada.getModificador());
        for(int i=0; i<6; i++){
            System.out.println();
            pala1.atacar(pala2);
            pala1.printStatus();
            pala2.printStatus();
            System.out.println();
            pala2.atacar(pala1);
            pala1.printStatus();
            pala2.printStatus();
            

        }
      
    }
}
 