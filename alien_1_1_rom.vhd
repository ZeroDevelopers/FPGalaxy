library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alien11_rom is
    port(
        addr: in std_logic_vector(9 downto 0);
        data: out std_logic_vector(2 downto 0)
    );
end alien11_rom;

architecture content of alien11_rom is
    type rgb_array is array(0 to 31) of std_logic_vector(2 downto 0);
    type rom_type is array(0 to 31) of rgb_array;

    signal rgb_row: rgb_array;

    constant ALIEN: rom_type :=
    (
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "000", "001", "001", "001", "001", "000", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "001", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "001", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "111", "111", "001", "001", "001", "001", "001", "001", "001", "001", "111", "111", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "001", "001", "001", "001", "111", "111", "111", "111", "001", "001", "001", "001", "001", "001", "111", "111", "111", "111", "001", "001", "001", "001", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "001", "001", "001", "001", "001", "111", "111", "111", "111", "001", "001", "001", "001", "001", "001", "111", "111", "111", "111", "001", "001", "001", "001", "001", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "111", "111", "111", "111", "001", "001", "001", "001", "111", "111", "111", "111", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "111", "111", "111", "111", "001", "001", "001", "001", "111", "111", "111", "111", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "111", "111", "001", "001", "001", "001", "001", "001", "111", "111", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "001", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000", "001", "001", "001", "001", "001", "001", "001", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "001", "001", "001", "000", "000", "001", "001", "001", "000", "000", "000", "000", "000", "000", "001", "001", "001", "000", "000", "001", "001", "001", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "001", "001", "001", "000", "000", "000", "001", "001", "000", "000", "000", "000", "000", "000", "000", "000", "001", "001", "000", "000", "000", "001", "001", "001", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "001", "001", "000", "000", "000", "001", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "001", "000", "000", "000", "001", "001", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "001", "001", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "001", "001", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "001", "001", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "001", "001", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "001", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "001", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000"),
        ("000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000")
    );
begin
    rgb_row <= ALIEN(conv_integer(addr(9 downto 5)));
    data <= rgb_row(conv_integer(addr(4 downto 0)));
end content;