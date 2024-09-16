library ieee;
use ieee.std_logic_1164.all;

entity shiftrotater is
    port (
        din:    in std_logic_vector(3 downto 0);
        desloc: in std_logic_vector(1 downto 0);
        shift:  in std_logic;
        dout:   out std_logic_vector(3 downto 0)
    );
end entity;

architecture structural of shiftrotater is

    signal a,b,c,d :std_logic;

begin
-- din
m0: entity work.mux2(behavioral)
    port map (i0 => din(3),i1 => din(2),sel => desloc(0),s => a);
m1: entity work.mux2(behavioral)
    port map (i0 => din(2),i1 => din(1),sel => desloc(0),s => b);
m2: entity work.mux2(behavioral)
    port map (i0 => din(1),i1 => din(0),sel => desloc(0),s => c);
m3: entity work.mux2(behavioral)
    port map (i0 => din(0),i1 => din(3),sel => desloc(0),s => d);

-- dout
m4: entity work.mux2(behavioral)
    port map (i0 => a,i1 => c,sel => desloc(1),s => dout(3));
m5: entity work.mux2(behavioral)
    port map (i0 => b,i1 => d,sel => desloc(1),s => dout(2));
m6: entity work.mux2(behavioral)
    port map (i0 => c,i1 => a,sel => desloc(1),s => dout(1));
m7: entity work.mux2(behavioral)
    port map (i0 => d,i1 => b,sel => desloc(1),s => dout(0));
end architecture;