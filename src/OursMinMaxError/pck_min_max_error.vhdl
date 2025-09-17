-- To obtain the lowest maximum absolute error.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package pck_min_max_error is
  constant num_bits : integer := 16;
  constant num_bits_int_part : integer := 4;
  constant num_bits_frac_part : integer := num_bits - num_bits_int_part;
  constant xinf : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -21258, num_bits );
  constant xmin : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -13271, num_bits );
  constant xmed : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 0, num_bits );
  constant xmax : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 13271, num_bits );
  constant xsup : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 21258, num_bits );
  constant zero : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 0, num_bits );
  constant one : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 4096, num_bits );
  constant p2k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 64, num_bits );
  constant p2k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 339, num_bits );
  constant p3k2 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 166, num_bits );
  constant p3k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 1117, num_bits );
  constant p3k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2057, num_bits );
  constant p4k2 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( -166, num_bits );
  constant p4k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 1117, num_bits );
  constant p4k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 2039, num_bits );
  constant p5k1 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 64, num_bits );
  constant p5k0 : signed ( ( num_bits - 1 ) downto 0 ) := to_signed( 3757, num_bits );
end package pck_min_max_error;
