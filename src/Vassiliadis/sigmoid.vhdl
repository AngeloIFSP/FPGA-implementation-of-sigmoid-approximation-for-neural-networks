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
    variable tmp_small, tmp_quadr : signed ( ( num_bits - 1 ) downto 0 );
    variable tmp_large, tmp_large_shift : signed( 2 * num_bits - 1 downto 0 );
  begin  -- process calcula_saida
    if ck = '1' then
      if x < lambda_0 then
        y <= zero;
      elsif x < lambda_0_1_delta then
        tmp_small := x + b_to_1_delta;
        tmp_large := tmp_small * tmp_small;
        tmp_large_shift := shift_right( tmp_large, c_to_1_neg_expon );
        tmp_quadr := tmp_large_shift( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= a_to_1_delta + tmp_quadr;
      elsif x < lambda_0_2_delta then
        tmp_small := x + b_to_2_delta;
        tmp_large := tmp_small * tmp_small;
        tmp_large_shift := shift_right( tmp_large, c_to_2_neg_expon );
        tmp_quadr := tmp_large_shift( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= a_to_2_delta + tmp_quadr;
      elsif x < lambda_0_3_delta then
        tmp_small := x + b_to_3_delta;
        tmp_large := tmp_small * tmp_small;
        tmp_large_shift := shift_right( tmp_large, c_to_3_neg_expon );
        tmp_quadr := tmp_large_shift( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= a_to_3_delta + tmp_quadr;
      elsif x < lambda_0_4_delta then
        tmp_small := x + b_to_4_delta;
        tmp_large := tmp_small * tmp_small;
        tmp_large_shift := shift_right( tmp_large, c_to_4_neg_expon );
        tmp_quadr := tmp_large_shift( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= a_to_4_delta + tmp_quadr;
      elsif x < lambda_0_5_delta then
        tmp_small := x + b_to_5_delta;
        tmp_large := tmp_small * tmp_small;
        tmp_large_shift := -shift_right( tmp_large, c_to_5_neg_expon );
        tmp_quadr := tmp_large_shift( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= a_to_5_delta + tmp_quadr;
      elsif x < lambda_0_6_delta then
        tmp_small := x + b_to_6_delta;
        tmp_large := tmp_small * tmp_small;
        tmp_large_shift := -shift_right( tmp_large, c_to_6_neg_expon );
        tmp_quadr := tmp_large_shift( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= a_to_6_delta + tmp_quadr;
      elsif x < lambda_0_7_delta then
        tmp_small := x + b_to_7_delta;
        tmp_large := tmp_small * tmp_small;
        tmp_large_shift := -shift_right( tmp_large, c_to_7_neg_expon );
        tmp_quadr := tmp_large_shift( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= a_to_7_delta + tmp_quadr;
      elsif x < lambda_0_8_delta then
        tmp_small := x + b_to_8_delta;
        tmp_large := tmp_small * tmp_small;
        tmp_large_shift := -shift_right( tmp_large, c_to_8_neg_expon );
        tmp_quadr := tmp_large_shift( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        y <= a_to_8_delta + tmp_quadr;
      else
        y <= one;
      end if;
    end if;
  end process calcula_saida;
end calcula;
