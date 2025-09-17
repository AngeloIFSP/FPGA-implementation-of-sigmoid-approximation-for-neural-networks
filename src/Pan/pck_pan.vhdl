library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package pck_pan is
  constant num_bits : integer := 16;
  constant num_bits_int_part : integer := 4;
  constant num_bits_frac_part : integer := num_bits - num_bits_int_part;
  constant zero : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 0, num_bits );
  constant zero_int : signed ( ( num_bits_int_part - 1 ) downto 0 ) := to_signed( 0, num_bits_int_part );
  constant one : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 4096, num_bits );
  constant ln_2 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2839, num_bits );
  constant inv_ln_2 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 5909, num_bits );
  constant L : integer := 4;
  constant mem_size : integer := 16; -- L = 4, 2^L = 16.
  type memory is array ( ( mem_size - 1 ) downto 0 ) of signed( ( num_bits - 1 ) downto 0 );
  constant lim_2_375 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 9728, num_bits );
  constant lim_5 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 20480, num_bits );
  constant v_0_5 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2048, num_bits );
  constant v_0_625 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2560, num_bits );
  constant v_0_84375 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 3456, num_bits );
  constant rom : memory := ( 0 => to_signed( 4096, num_bits ),
                             1 => to_signed( 3922, num_bits ),
                             2 => to_signed( 3756, num_bits ),
                             3 => to_signed( 3597, num_bits ),
                             4 => to_signed( 3444, num_bits ),
                             5 => to_signed( 3298, num_bits ),
                             6 => to_signed( 3158, num_bits ),
                             7 => to_signed( 3025, num_bits ),
                             8 => to_signed( 2896, num_bits ),
                             9 => to_signed( 2774, num_bits ),
                             10 => to_signed( 2656, num_bits ),
                             11 => to_signed( 2543, num_bits ),
                             12 => to_signed( 2435, num_bits ),
                             13 => to_signed( 2332, num_bits ),
                             14 => to_signed( 2233, num_bits ),
                             15 => to_signed( 2139, num_bits ));

  -- constant xinf : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -22282, num_bits );
  -- constant xmin : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -16384, num_bits );
  -- constant xmed : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 0, num_bits );
  -- constant xmax : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 16384, num_bits );
  -- constant xsup : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 22282, num_bits );
  -- constant p1k2 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 128, num_bits );
  -- constant p1k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 1024, num_bits );
  -- constant p1k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2048, num_bits );
  -- constant p2k2 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -128, num_bits );
  -- constant p2k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 1024, num_bits );
  -- constant p2k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2048, num_bits );
end package pck_pan;
