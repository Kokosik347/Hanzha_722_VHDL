-------------------------------------------------------------------------------
-- Lab Work 2 - Combinatorial Logic Implementations
-- Реалізація функцій Y3 – Y0
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bf4_logic is
port(
    X : in STD_LOGIC_VECTOR(3 downto 0);
    Y : out STD_LOGIC_VECTOR(3 downto 0)
);
end bf4_logic;

architecture bf4_logic of bf4_logic is

signal P : STD_LOGIC_VECTOR(10 downto 0); -- .p 11

begin

-- Variant 1: equations built on minimized terms

P(0)  <= X(0) and X(1) and X(2);                          -- -111
P(1)  <= X(1) and not X(2) and not X(3);                 -- 0-10
P(2)  <= X(2) and not X(0) and not X(1);                 -- -100
P(3)  <= not X(0) and not X(2) and not X(3);             -- 00-0
P(4)  <= X(0) and X(3) and not X(1) and not X(2);        -- 10-1

P(5)  <= X(0) and X(1) and not X(2);                     -- -011
P(6)  <= X(0) and X(3) and not X(1);                     -- 1-01
P(7)  <= X(1) and X(2) and not X(0);                     -- -110
P(8)  <= X(2) and X(3) and not X(1);                     -- 11-0

P(9)  <= X(0) and X(2) and X(3);                         -- 111-
P(10) <= X(1) and not X(0) and not X(2);                 -- 0-1-

-- Outputs

Y(3) <= P(0) or P(1) or P(2) or P(3) or P(4);

Y(2) <= P(5) or P(6) or P(7) or P(8) or P(3);

Y(1) <= P(9) or
        (X(0) and X(2) and not X(1)) or
        (X(2) and X(3) and not X(1)) or
        (X(1) and not X(0) and not X(2)) or
        (X(1) and not X(0) and not X(3)) or
        (X(1) and not X(2) and not X(3));

Y(0) <= P(9) or
        P(6) or
        (X(1) and X(3) and not X(0)) or
        (X(0) and not X(2) and not X(3)) or
        (X(2) and not X(0) and not X(1) and not X(3));

-- Variant 2: equations obtained after minimization
--
-- Y(3) = (X(0) and X(1) and X(2)) or
--        (X(1) and not X(2) and not X(3)) or
--        (X(2) and not X(0) and not X(1)) or
--        (not X(0) and not X(2) and not X(3)) or
--        (X(0) and X(3) and not X(1) and not X(2));
--
-- Y(2) = (X(0) and X(1) and not X(2)) or
--        (X(0) and X(3) and not X(1)) or
--        (X(1) and X(2) and not X(0)) or
--        (X(2) and X(3) and not X(1)) or
--        (not X(0) and not X(1) and not X(2) and not X(3));
--
-- Y(1) = (X(0) and X(2) and X(3)) or
--        (X(0) and X(2) and not X(1)) or
--        (X(2) and X(3) and not X(1)) or
--        (X(1) and not X(0) and not X(2)) or
--        (X(1) and not X(0) and not X(3)) or
--        (X(1) and not X(2) and not X(3));
--
-- Y(0) = (X(0) and X(2) and X(3)) or
--        (X(0) and X(3) and not X(1)) or
--        (X(1) and X(3) and not X(0)) or
--        (X(0) and not X(2) and not X(3)) or
--        (X(2) and not X(0) and not X(1) and not X(3));

end bf4_logic;