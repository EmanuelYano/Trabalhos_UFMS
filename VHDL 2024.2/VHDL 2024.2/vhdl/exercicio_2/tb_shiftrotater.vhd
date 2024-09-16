library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_shiftrotater is

end entity;
architecture behavioral of tb_shiftrotater is
    signal din : std_logic_vector(3 downto 1);
    signal desloc : std_logic_vector(1 downto 0);
    signal shift : std_logic;
    signal dout : std_logic_vector(3 downto 1);
    
begin
    sr: entity work.shiftrotater(structural)
        port map(din, desloc, shift, dout);
    
        estim: process 
            variable valor: std_logic_vector(3 downto 0) := "0110";
            variable qtd: natural := 2;
        begin
            din <= valor;
            desloc <= std_logic_vector(to_unsigned(2,qtd));
            shift <= '0';
            wait for 1 ns;

            assert unsigned(dout) = (unsigned(valor) rol qtd)
                report "Ihh deu ruim"
                severity failure;

        end process;
    

end architecture;