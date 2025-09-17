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
    variable tmp_small : signed ( ( num_bits - 1 ) downto 0 );
    variable tmp_large : signed( 2 * num_bits - 1 downto 0 );
  begin  -- process calcula_saida
    if ck = '1' then
      if x <= limit_minus_8 then
        y <= zero;
      elsif x <= limit_minus_4_5 then
        tmp_large := x * coef_1;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_1;
      elsif x <= limit_minus_3 then
        tmp_large := x * coef_2;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_2;
      elsif x <= limit_minus_2 then
        tmp_large := x * coef_3;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_3;
      elsif x <= limit_minus_1 then
        tmp_large := x * coef_4;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_4;
      elsif x <= limit_plus_1 then
        tmp_large := x * coef_5;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_5;
      elsif x <= limit_plus_2 then
        tmp_large := x * coef_6;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_6;
      elsif x <= limit_plus_3 then
        tmp_large := x * coef_7;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_7;
      elsif x <= limit_plus_4_5 then
        tmp_large := x * coef_8;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_8;
      elsif x <= limit_plus_8 then
        tmp_large := x * coef_9;
        tmp_small := tmp_large( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= tmp_small + indep_9;
      else
        y <= one;
      end if;
    end if;
  end process calcula_saida;
end calcula;
