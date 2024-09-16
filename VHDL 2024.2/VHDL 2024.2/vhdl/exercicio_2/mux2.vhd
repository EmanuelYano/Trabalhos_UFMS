library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
    port(i0,i1,sel:in std_logic;
    s:out std_logic);
end;

architecture behavioral of mux2 is
begin
    process (i0,i1,sel)
    begin
        if sel = '0' then
            s <= i0;
        else
            s <= i1;
        end if;
        
    end process;
end architecture;