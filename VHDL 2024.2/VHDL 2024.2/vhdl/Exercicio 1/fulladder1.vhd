library ieee;
use ieee.std_logic_1164.all;

entity fulladder1 is
    port (
        A, B, CIN: in std_logic;
        S, COUT: out std_logic
    );
end entity;

architecture behavioral of fulladder1 is
begin

    S <= a xor b xor CIN ;
    COUT <= (a and b) or (a and CIN) or (b and CIN) ;

end architecture;