library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pck_pan.all;

entity sigmoide is
  port (
    ck : in bit;
    x : in  signed ( ( num_bits - 1 ) downto 0 );
    y : out signed ( ( num_bits - 1 ) downto 0 ));
end sigmoide;

architecture calcula of sigmoide is
begin
  calcula_saida: process( ck )
    variable x_div_ln_2, e_minus_x_tmp, sigma_0_squared_tmp,
      sigma_0_squared_e_minus_x_plus_one_tmp : signed( ( 2 * num_bits - 1 ) downto 0 );
    variable r_tmp : signed( ( 2 * num_bits - num_bits_int_part - 5 ) downto 0 );
    variable rom_out, r, one_minus_r, shift_prev_e_x, factors_e_x, e_minus_x, sigma_0, two_sigma_0,
      sigma_0_squared, e_minus_x_plus_one, sigma_0_squared_e_minus_x_plus_one, sigma_x,
      abs_x, var_y : signed( ( num_bits - 1 ) downto 0 );
    variable m : signed( ( 2 * num_bits_int_part - 1 ) downto 0 );
    variable ind_rom : integer range 0 to mem_size - 1;
    variable j_int, m_int : integer;
    variable j : signed( ( L - 1 ) downto 0 );
    variable low_bits : signed( ( num_bits - 1 - num_bits_int_part - 4 ) downto 0 );
  begin  -- process calcula_saida
    if ck = '1' then
      if x( num_bits - 1 ) = '0' then
        abs_x := x;
      else
        abs_x := -x;
      end if;
      -- EXP part:
      x_div_ln_2 := abs_x * inv_ln_2;
      m := x_div_ln_2( ( 2 * num_bits - 1 ) downto ( 2 * num_bits - 2 * num_bits_int_part ) );
      m_int := to_integer( m );
      j := x_div_ln_2( ( 2 * num_bits - 2 * num_bits_int_part - 1 ) downto ( 2 * num_bits - 2 * num_bits_int_part - 4 ) );
      j_int := to_integer( j );
      if j_int < 0 then
        j_int := 16 + j_int;
      end if;
      rom_out := rom( j_int ); -- 2^(-j/16)
      low_bits := x_div_ln_2( ( 2 * num_bits - 5 - 2 * num_bits_int_part ) downto ( 2 * num_bits - 12 - 2 * num_bits_int_part ) );
      if low_bits( ( num_bits - 1 - num_bits_int_part - 4 ) ) = '0' then
        r_tmp := low_bits * ln_2;
      else
        r_tmp := ( -low_bits ) * ln_2;
      end if;
      r := zero_int & r_tmp( ( 2 * num_bits - num_bits_int_part - 5 ) downto num_bits_frac_part );
      one_minus_r := one - r;
      if m_int > 0 then
        shift_prev_e_x := shift_right( rom_out, m_int ); -- 2^(-m)*2^(-j/16)
      else
        shift_prev_e_x := rom_out;
      end if;
      e_minus_x_tmp := one_minus_r * shift_prev_e_x;
      e_minus_x := e_minus_x_tmp( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
      -- PWL part:
      if abs_x < one then
        sigma_0 := shift_right( abs_x, 2 ) + v_0_5;
      elsif abs_x < lim_2_375 then
        sigma_0 := shift_right( abs_x, 3 ) + v_0_625;
      elsif abs_x < lim_5 then
        sigma_0 := shift_right( abs_x, 5 ) + v_0_84375;
      else
        sigma_0 := one;
      end if;
      -- NR part:
      two_sigma_0 := shift_left( sigma_0, 1 );
      sigma_0_squared_tmp := sigma_0 * sigma_0;
      sigma_0_squared := sigma_0_squared_tmp( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
      e_minus_x_plus_one := e_minus_x + one;
      sigma_0_squared_e_minus_x_plus_one_tmp := sigma_0_squared * e_minus_x_plus_one;
      sigma_0_squared_e_minus_x_plus_one := sigma_0_squared_e_minus_x_plus_one_tmp( 2 * num_bits - 1 - num_bits_int_part downto num_bits_frac_part );
      sigma_x := two_sigma_0 - sigma_0_squared_e_minus_x_plus_one;
      if x( num_bits - 1 ) = '0' then
        var_y := sigma_x;
      else
        var_y := one - sigma_x;
      end if;
      y <= var_y;
    end if;
  end process calcula_saida;
end calcula;
