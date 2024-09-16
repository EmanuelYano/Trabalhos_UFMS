library ieee;
use ieee.std_logic_1164.all;

entity tbfulladder1 is
end entity;
architecture rtl of tbfulladder1 is
    signal a,b,cin,s,cout : std_logic; 
begin
    fa1: entity work.fulladder1(behavioral)
         port map(a,b,cin,s,cout); 
    estimulo_checagem: process is
        type linha_tv is record
            a, b,cin,s,cout: std_logic;
        end record;
        type vet_linha_tv is array (0 to 7) of linha_tv;
        constant tv : vet_linha_tv := (
        --    a   b  cin  s  cout
            ('0','0','0','0','0'),
            ('0','0','1','1','0'),
            ('0','1','0','1','0'),
            ('0','1','1','0','1'),
            ('1','0','0','1','0'),
            ('1','0','1','0','1'),
            ('1','1','0','0','1'),
            ('1','1','1','1','1')
        );
    begin
        for i in tv'range loop
            a <= tv(i).a;
            b <= tv(i).b;
            cin <= tv(i).cin;
            wait for 1 ns;

            assert s = tv(i).s
                report "Erro em S! Eseprado "& std_logic'image(tv(i).s)&
                " ,as obtido "&std_logic'image(s);
            assert cout = tv(i).cout
                report "Erro em cout! Eseprado "& std_logic'image(tv(i).cout)&
                " ,as obtido "&std_logic'image(cout);            
        end loop;
        report "Fim dos testes!";
        wait;
    end process estimulo_checagem;
end architecture;