library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Para menor média do módulo de erro:
use work.pck_min_max_error.all;

entity sigmoide is
  port (
    ck : in bit;
    x : in  signed ( ( num_bits - 1 ) downto 0 );
    y : out signed ( ( num_bits - 1 ) downto 0 ));
end sigmoide;

architecture calcula of sigmoide is
begin  -- calcula
  -- Para menor média do módulo de erro:
  calcula_saida: process( ck )
    variable tmp, tmp_2, tmp_4 : signed( 2 * num_bits - 1 downto 0 );
    variable tmp_3 : signed ( ( num_bits - 1 ) downto 0 );
  begin  -- process calcula_saida
    if ck = '1' then
      -- região 1:
      if x <= xinf then
        y <= zero;
      -- região 2:
      elsif x <= xmin then
        tmp := p2k1 * x + p2k0 * one;
        y <= tmp( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
      -- região 3:
      elsif x <= xmed then
        tmp_2 := p3k2 * x + p3k1 * one;
        tmp_3 := tmp_2( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        tmp_4 := x * tmp_3 + p3k0 * one;
        y <= tmp_4( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
      -- região 4:
      elsif x <= xmax then
        tmp_2 := p4k2 * x + p4k1 * one;
        tmp_3 := tmp_2( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
        tmp_4 := x * tmp_3 + p4k0 * one;
        y <= tmp_4( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
      -- região 5:
      elsif x <= xsup then
        tmp := p5k1 * x + p5k0 * one;
        y <= tmp( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
      -- região 6:
      else
        y <= one;
      end if;
    end if;
  end process calcula_saida;
end calcula;
