library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package pck_definitions is
  constant num_bits : integer := 16;
  constant num_bits_int_part : integer := 4;
  constant num_bits_frac_part : integer := num_bits - num_bits_int_part;
  constant zero : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 0, num_bits );
  constant one : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 4096, num_bits );
  constant lim : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 16384, num_bits );
  constant a : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -147, num_bits );
  constant b : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 1061, num_bits );
  constant c : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2064, num_bits );
end package pck_definitions;
