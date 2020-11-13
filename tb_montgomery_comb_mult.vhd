--------------------------------------------------------------------------------
-- Simple testbench for "montg_comb_mult.vhd" module (for m=8)

-- It's based on "test_montg_mult" testbench (for m=8), which is from the 
-- Hardware Implementation of Finite-Field Arithmetic book's website:
-- http://www.arithmetic-circuits.org/finite-field/index.html
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
Use work.montgomery_mult_comb_package.all;

ENTITY tb_montgomery_comb_mult IS
END tb_montgomery_comb_mult;

ARCHITECTURE behavior OF tb_montgomery_comb_mult IS 

  -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT montgomery_comb_mult is 
  PORT (
    a, b: in std_logic_vector(M-1 downto 0);
    c: out std_logic_vector(M-1 downto 0)
  );
  END COMPONENT;
  
  --Inputs
  SIGNAL a :  std_logic_vector(M-1 downto 0) := (others=>'0');
  SIGNAL b :  std_logic_vector(M-1 downto 0) := (others=>'0');
  
  --Outputs
  SIGNAL c :  std_logic_vector(M-1 downto 0);

BEGIN

  -- Instantiate the Unit Under Test (UUT)
     uut: montgomery_comb_mult    
       PORT MAP( a => a, b => b, 
                 c => c);           
                  
  tb : PROCESS
  BEGIN
    -- Two equal M-bits polynomials for M = 8 
    a <= "10101010"; -- x^7 + x^5 + x^3 + x
    b <= "10101010"; -- x^7 + x^5 + x^3 + x
    
    -- Two different M-bits polynomials for M = 8 
    -- a <= "10101010"; -- x^7 + x^5 + x^3 + x
    -- b <= "00000000"; -- 0
    
    -- Two different M-bits polynomials for M = 8
    -- a <= "11111111"; -- x^7 + x^6 + x^5 + x^4 + x^3 + x^2 + x + 1
    -- b <= "10101010"; -- x^7 + x^5 + x^3 + x
    
    -- Two different M-bits polynomials for M = 8
    -- a <= "10101010"; -- x^7 + x^5 + x^3 + x
    -- b <= "01010101"; -- x^6 + x^4 + x^2 + 1
    
    -- Two equal M-bits polynomials for M = 8 
    -- a <= "01010101"; -- x^6 + x^4 + x^2 + 1
    -- b <= "01010101"; -- x^6 + x^4 + x^2 + 1     
    
    wait for 1 ps;   

    ASSERT (FALSE) REPORT
    "Simulation finished (not a failure). No problems detected. "
    SEVERITY FAILURE;
  END PROCESS;

END;
