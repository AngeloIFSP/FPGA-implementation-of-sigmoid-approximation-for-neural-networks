-- To obtain the lowest absolute average error.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package pck_abs_avg_error is
  constant num_bits : integer := 16;
  constant num_bits_int_part : integer := 4;
  constant num_bits_frac_part : integer := num_bits - num_bits_int_part;
  constant xinf : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -22282, num_bits );
  constant xmin : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -13312, num_bits );
  constant xmed : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 0, num_bits );
  constant xmax : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 13312, num_bits );
  constant xsup : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 22282, num_bits );
  constant zero : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 0, num_bits );
  constant one : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 4096, num_bits );
  constant p2k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 58, num_bits );
  constant p2k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 314, num_bits );
  constant p3k2 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 165, num_bits );
  constant p3k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 1116, num_bits );
  constant p3k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2057, num_bits );
  constant p4k2 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -165, num_bits );
  constant p4k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 1116, num_bits );
  constant p4k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2039, num_bits );
  constant p5k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 58, num_bits );
  constant p5k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 3782, num_bits );
end package pck_abs_avg_error;
