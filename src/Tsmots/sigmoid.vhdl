library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pck_definitions.all;

entity sigmoide is
  port (
    ck : in bit;
    x : in  signed ( ( num_bits - 1 ) downto 0 );
    y : out signed ( ( num_bits - 1 ) downto 0 ));
end sigmoide;

architecture calcula of sigmoide is
begin  -- calcula
  calcula_saida: process( ck )
    variable abs_x, y_tmp, a_x_small, a_x_2_small, b_x_small : signed ( ( num_bits - 1 ) downto 0 );
    variable a_x_large, a_x_2_large, b_x_large : signed( 2 * num_bits - 1 downto 0 );
  begin  -- process calcula_saida
    if ck = '1' then
      abs_x := abs( x );
      if abs_x >= lim then
        y_tmp := one;
      else
        a_x_large := a * abs_x;
        a_x_small := a_x_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        a_x_2_large := a_x_small * abs_x;
        a_x_2_small := a_x_2_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        b_x_large := b * abs_x;
        b_x_small := b_x_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y_tmp := a_x_2_small + b_x_small + c;
      end if;
      if x( num_bits - 1 ) = '0' then
        y <= y_tmp;
      else
        y <= one - y_tmp;
      end if;
    end if;
  end process calcula_saida;
end calcula;
