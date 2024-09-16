library ieee;
use ieee.std_logic_1164.all;

entity fulladder4 is
    port(
        A, B: in std_logic_vector(3 downto 0);
        CIN: in std_logic;
        S: out std_logic_vector(3 downto 0);
        COUT: out std_logic
    );
end entity;

architecture structural of fulladder4 is

signal carry : std_logic_vector(2 downto 0);
begin

slb0: entity work.fulladder1(behavioral)
      port map(a => a(0), b => b(0), cin =>'0',s => s(0), cout => carry(0));
slb1: entity work.fulladder1(behavioral)
      port map(a => a(1), b => b(1), cin => carry(0),s => s(1), cout => carry(1));
slb2: entity work.fulladder1(behavioral)
      port map(a => a(2), b => b(2), cin => carry(1),s => s(2), cout => carry(2));
slb3: entity work.fulladder1(behavioral)
      port map(a => a(3), b => b(3), cin => carry(2),s => s(3), cout => cout);


end architecture;
