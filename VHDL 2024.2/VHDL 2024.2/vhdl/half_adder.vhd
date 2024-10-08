library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port (
        x,y: in std_logic;
        sum, carry: out std_logic
    );
end entity;

architecture arch of half_adder is
begin

    sum <= x xor y;
    carry <= x and y;

end architecture;