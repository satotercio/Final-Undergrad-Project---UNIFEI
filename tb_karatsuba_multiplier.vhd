--------------------------------------------------------------------------------
-- Simple testbench for "Karatsuba_multiplier" module (for m=8 or m=9)

-- It's based on "test_montg_mult" testbench (for m=8), which is from the 
-- Hardware Implementation of Finite-Field Arithmetic book's website:
-- http://www.arithmetic-circuits.org/finite-field/index.html
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tb_karatsuba_multiplier IS
END tb_karatsuba_multiplier;

ARCHITECTURE behavior OF tb_karatsuba_multiplier IS 

  -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT karatsuba_multiplier is
  generic (M: integer);  
  PORT (
    a, b: in std_logic_vector(M-1 downto 0);
    d: out std_logic_vector(2*M-2 downto 0)
  );
  END COMPONENT;

  -- Choose the size
  constant M: integer := 8;
  -- constant M: integer := 9;
  
  --Inputs
  SIGNAL a :  std_logic_vector(M-1 downto 0) := (others=>'0');
  SIGNAL b :  std_logic_vector(M-1 downto 0) := (others=>'0');
  
  --Outputs
  SIGNAL d :  std_logic_vector(2*M-2 downto 0);

BEGIN

  -- Instantiate the Unit Under Test (UUT)
  -- k0: karatsuba_multiplier   -- "k0" notation for M even values
       -- generic map(M => 8) 
       -- PORT MAP( a => a, b => b, 
                 -- d => d);
  
  -- Instantiate the Unit Under Test (UUT)  
  -- k1: karatsuba_multiplier   -- "k1" notation for M odd values
       -- generic map(M => 9)
       -- PORT MAP( a => a, b => b, 
                 -- d => d);
                 
  -- Instantiate the Unit Under Test (UUT)
     k: karatsuba_multiplier    -- or "k" notation for M even/odd values
       generic map(M => M)
       PORT MAP( a => a, b => b, 
                 d => d);           
                  
  tb : PROCESS
  BEGIN
    -- Two equal M-bits polynomials for M = 8 (even)
    a <= "11011011"; -- x^7 + x^6 + x^4 + x^3 + x + 1
    b <= "11011011"; -- x^7 + x^6 + x^4 + x^3 + x + 1
    
    -- Two different M-bits polynomials for M = 8 (even) (Slide's example step-by-step.)
    -- a <= "11010010"; -- x^7 + x^6 + x^4 + x
    -- b <= "10101101"; -- x^7 + x^5 + x^3 + x^2 + 1
    
    -- Two equal M-bits polynomials for M = 9 (odd) (Slide's example step-by-step.)
    -- a <= "010101010"; -- x^7 + x^5 + x^3 + x
    -- b <= "010101010"; -- x^7 + x^5 + x^3 + x
    
    -- Two different M-bits polynomials for M = 9 (odd)
    -- a <= "110111001"; -- x^8 + x^7 + x^5 + x^4 + x^3 + 1
    -- b <= "101001110"; -- x^8 + x^6 + x^3 + x^2 + x     
    
    wait for 1 ps;   

    ASSERT (FALSE) REPORT
    "Simulation finished (not a failure). No problems detected. "
    SEVERITY FAILURE;
  END PROCESS;

END;
