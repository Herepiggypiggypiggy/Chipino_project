
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of stable_map is

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component AO222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; Z : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component OAI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component OA221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AN4D1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component BUFFD4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFD0BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal map_internal : std_logic_vector(71 downto 0);
  signal state : std_logic_vector(2 downto 0);
  signal n_1, n_3, n_5, n_9, n_12 : std_logic;
  signal n_16, n_17, n_18, n_19, n_20 : std_logic;
  signal n_22, n_23, n_24, n_25, n_26 : std_logic;
  signal n_27, n_28, n_30, n_31, n_32 : std_logic;
  signal n_33, n_34, n_35, n_36, n_37 : std_logic;
  signal n_38, n_39, n_40, n_41, n_42 : std_logic;
  signal n_43, n_44, n_45, n_47, n_48 : std_logic;
  signal n_49, n_50, n_51, n_52, n_53 : std_logic;
  signal n_54, n_55, n_56, n_57, n_58 : std_logic;
  signal n_59, n_60, n_61, n_62, n_63 : std_logic;
  signal n_64, n_65, n_66, n_67, n_68 : std_logic;
  signal n_69, n_70, n_71, n_72, n_73 : std_logic;
  signal n_74, n_75, n_76, n_77, n_78 : std_logic;
  signal n_79, n_80, n_81, n_82, n_83 : std_logic;
  signal n_84, n_85, n_86, n_87, n_88 : std_logic;
  signal n_89, n_90, n_91, n_92, n_93 : std_logic;
  signal n_94, n_95, n_96, n_97, n_98 : std_logic;
  signal n_99, n_100, n_101, n_102, n_103 : std_logic;
  signal n_104, n_105, n_106, n_107, n_108 : std_logic;
  signal n_109, n_110, n_111, n_112, n_113 : std_logic;
  signal n_114, n_115, n_116, n_117, n_118 : std_logic;
  signal n_119, n_120, n_121, n_122, n_123 : std_logic;
  signal n_124, n_125, n_126, n_127, n_128 : std_logic;
  signal n_129, n_130, n_131, n_132, n_133 : std_logic;
  signal n_134, n_135, n_136, n_137, n_138 : std_logic;
  signal n_139, n_140, n_141, n_142, n_143 : std_logic;
  signal n_144, n_145, n_225, n_226, n_227 : std_logic;
  signal n_229, n_230, n_235, n_236, n_248 : std_logic;
  signal n_254, n_260, n_266, n_272, n_278 : std_logic;
  signal n_284, n_290, n_296, n_302, n_308 : std_logic;
  signal n_314, n_320, n_326, n_332, n_338 : std_logic;
  signal n_344, n_350, n_356, n_362, n_368 : std_logic;
  signal n_374, n_380, n_386, n_392, n_398 : std_logic;
  signal n_404, n_410, n_416, n_422, n_428 : std_logic;
  signal n_434, n_440, n_446, n_452, n_458 : std_logic;
  signal n_464, n_470, n_476, n_482, n_488 : std_logic;
  signal n_494, n_500, n_506, n_512, n_518 : std_logic;
  signal n_524, n_530, n_536, n_542, n_548 : std_logic;
  signal n_554, n_560, n_566, n_572, n_578 : std_logic;
  signal n_584, n_590, n_596, n_602, n_608 : std_logic;
  signal n_614 : std_logic;

begin

  map_internal_reg_51 : DFQD1BWP7T port map(CP => clk, D => n_145, Q => map_internal(51));
  map_internal_reg_53 : DFQD1BWP7T port map(CP => clk, D => n_144, Q => map_internal(53));
  map_internal_reg_38 : DFQD1BWP7T port map(CP => clk, D => n_141, Q => map_internal(38));
  g4711 : AO222D0BWP7T port map(A1 => n_143, A2 => map_data_volatile(51), B1 => n_131, B2 => map_internal(18), C1 => n_52, C2 => map_internal(51), Z => n_145);
  g4712 : AO222D0BWP7T port map(A1 => n_143, A2 => map_data_volatile(53), B1 => n_130, B2 => map_internal(20), C1 => n_54, C2 => map_internal(53), Z => n_144);
  map_internal_reg_52 : DFQD1BWP7T port map(CP => clk, D => n_133, Q => map_internal(52));
  map_internal_reg_35 : DFQD1BWP7T port map(CP => clk, D => n_136, Q => map_internal(35));
  g4727 : AO221D0BWP7T port map(A1 => n_140, A2 => n_235, B1 => n_143, B2 => map_data_volatile(36), C => n_139, Z => n_142);
  g4728 : AO221D0BWP7T port map(A1 => n_140, A2 => map_internal(38), B1 => n_143, B2 => map_data_volatile(38), C => n_139, Z => n_141);
  g4764 : AO22D0BWP7T port map(A1 => n_127, A2 => map_internal(37), B1 => map_data_volatile(37), B2 => n_143, Z => n_138);
  g4725 : AO221D0BWP7T port map(A1 => n_135, A2 => n_229, B1 => n_143, B2 => map_data_volatile(33), C => n_134, Z => n_137);
  g4726 : AO221D0BWP7T port map(A1 => n_135, A2 => map_internal(35), B1 => n_143, B2 => map_data_volatile(35), C => n_134, Z => n_136);
  g4717 : AO222D0BWP7T port map(A1 => n_59, A2 => map_data(19), B1 => n_143, B2 => map_data_volatile(52), C1 => n_53, C2 => map_internal(52), Z => n_133);
  g4767 : AO22D0BWP7T port map(A1 => n_56, A2 => map_internal(34), B1 => map_data_volatile(34), B2 => n_143, Z => n_132);
  g4729 : IOA21D0BWP7T port map(A1 => n_129, A2 => map_internal(53), B => n_128, ZN => n_131);
  g4730 : IOA21D0BWP7T port map(A1 => n_129, A2 => map_internal(51), B => n_128, ZN => n_130);
  g4867 : OAI21D0BWP7T port map(A1 => n_17, A2 => n_55, B => n_51, ZN => n_127);
  g4765 : AO221D0BWP7T port map(A1 => n_124, A2 => map_internal(18), B1 => n_143, B2 => map_data_volatile(18), C => n_123, Z => n_126);
  g4766 : AO221D0BWP7T port map(A1 => n_124, A2 => map_internal(20), B1 => n_143, B2 => map_data_volatile(20), C => n_123, Z => n_125);
  g4826 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(40), B1 => map_data_volatile(40), B2 => n_143, Z => n_122);
  g4829 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(13), B1 => map_data_volatile(13), B2 => n_143, Z => n_121);
  g4830 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(43), B1 => map_data_volatile(43), B2 => n_143, Z => n_119);
  g4831 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(7), B1 => map_data_volatile(7), B2 => n_143, Z => n_118);
  g4832 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(44), B1 => map_data_volatile(44), B2 => n_143, Z => n_117);
  g4833 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(45), B1 => map_data_volatile(45), B2 => n_143, Z => n_116);
  g4835 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(8), B1 => map_data_volatile(8), B2 => n_143, Z => n_115);
  g4834 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(46), B1 => map_data_volatile(46), B2 => n_143, Z => n_114);
  g4837 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(48), B1 => map_data_volatile(48), B2 => n_143, Z => n_113);
  g4838 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(6), B1 => map_data_volatile(6), B2 => n_143, Z => n_112);
  g4839 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(49), B1 => map_data_volatile(49), B2 => n_143, Z => n_111);
  g4840 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(9), B1 => map_data_volatile(9), B2 => n_143, Z => n_110);
  g4803 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(67), B1 => map_data_volatile(67), B2 => n_143, Z => n_109);
  g4841 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(50), B1 => map_data_volatile(50), B2 => n_143, Z => n_108);
  g4797 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(26), B1 => map_data_volatile(26), B2 => n_143, Z => n_107);
  g4842 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(10), B1 => map_data_volatile(10), B2 => n_143, Z => n_106);
  g4843 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(11), B1 => map_data_volatile(11), B2 => n_143, Z => n_105);
  g4844 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(12), B1 => map_data_volatile(12), B2 => n_143, Z => n_104);
  g4845 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(42), B1 => map_data_volatile(42), B2 => n_143, Z => n_103);
  g4846 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(14), B1 => map_data_volatile(14), B2 => n_143, Z => n_102);
  g4798 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(5), B1 => map_data_volatile(5), B2 => n_143, Z => n_101);
  g4847 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(15), B1 => map_data_volatile(15), B2 => n_143, Z => n_100);
  g4848 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(16), B1 => map_data_volatile(16), B2 => n_143, Z => n_99);
  g4849 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(54), B1 => map_data_volatile(54), B2 => n_143, Z => n_98);
  g4850 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(55), B1 => map_data_volatile(55), B2 => n_143, Z => n_97);
  g4851 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(56), B1 => map_data_volatile(56), B2 => n_143, Z => n_96);
  g4801 : AO22D0BWP7T port map(A1 => n_226, A2 => map_internal(19), B1 => map_data_volatile(19), B2 => n_143, Z => n_95);
  g4852 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(17), B1 => map_data_volatile(17), B2 => n_143, Z => n_94);
  g4802 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(66), B1 => map_data_volatile(66), B2 => n_143, Z => n_93);
  g4853 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(57), B1 => map_data_volatile(57), B2 => n_143, Z => n_92);
  g4794 : AOI31D0BWP7T port map(A1 => n_60, A2 => map_internal(51), A3 => map_internal(53), B => n_48, ZN => n_128);
  g4810 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(23), B1 => map_data_volatile(23), B2 => n_143, Z => n_91);
  g4855 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(59), B1 => map_data_volatile(59), B2 => n_143, Z => n_90);
  g4804 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(68), B1 => map_data_volatile(68), B2 => n_143, Z => n_89);
  g4856 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(60), B1 => map_data_volatile(60), B2 => n_143, Z => n_88);
  g4857 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(61), B1 => map_data_volatile(61), B2 => n_143, Z => n_87);
  g4805 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(69), B1 => map_data_volatile(69), B2 => n_143, Z => n_86);
  g4858 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(62), B1 => map_data_volatile(62), B2 => n_143, Z => n_85);
  g4859 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(63), B1 => map_data_volatile(63), B2 => n_143, Z => n_84);
  g4860 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(64), B1 => map_data_volatile(64), B2 => n_143, Z => n_83);
  g4806 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(70), B1 => map_data_volatile(70), B2 => n_143, Z => n_82);
  g4861 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(65), B1 => map_data_volatile(65), B2 => n_143, Z => n_81);
  g4808 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(71), B1 => map_data_volatile(71), B2 => n_143, Z => n_80);
  g4836 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(47), B1 => map_data_volatile(47), B2 => n_143, Z => n_79);
  g4807 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(21), B1 => map_data_volatile(21), B2 => n_143, Z => n_78);
  g4809 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(22), B1 => map_data_volatile(22), B2 => n_143, Z => n_77);
  g4825 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(39), B1 => map_data_volatile(39), B2 => n_143, Z => n_76);
  g4854 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(58), B1 => map_data_volatile(58), B2 => n_143, Z => n_75);
  g4811 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(24), B1 => map_data_volatile(24), B2 => n_143, Z => n_74);
  g4812 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(25), B1 => map_data_volatile(25), B2 => n_143, Z => n_73);
  g4813 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(41), B1 => map_data_volatile(41), B2 => n_143, Z => n_72);
  g4814 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(27), B1 => map_data_volatile(27), B2 => n_143, Z => n_71);
  g4815 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(28), B1 => map_data_volatile(28), B2 => n_143, Z => n_70);
  g4816 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(29), B1 => map_data_volatile(29), B2 => n_143, Z => n_69);
  g4817 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(30), B1 => map_data_volatile(30), B2 => n_143, Z => n_68);
  g4818 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(31), B1 => map_data_volatile(31), B2 => n_143, Z => n_67);
  g4819 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(32), B1 => map_data_volatile(32), B2 => n_143, Z => n_66);
  g4820 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(1), B1 => map_data_volatile(1), B2 => n_143, Z => n_65);
  g4821 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(0), B1 => map_data_volatile(0), B2 => n_143, Z => n_64);
  g4822 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(2), B1 => map_data_volatile(2), B2 => n_143, Z => n_63);
  g4823 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(3), B1 => map_data_volatile(3), B2 => n_143, Z => n_62);
  g4824 : AO22D0BWP7T port map(A1 => n_120, A2 => map_internal(4), B1 => map_data_volatile(4), B2 => n_143, Z => n_61);
  g4869 : AO21D0BWP7T port map(A1 => n_60, A2 => map_data(37), B => n_50, Z => n_140);
  g4800 : OAI32D1BWP7T port map(A1 => map_internal(52), A2 => n_227, A3 => n_47, B1 => n_30, B2 => n_35, ZN => n_59);
  g4720 : OAI221D0BWP7T port map(A1 => n_38, A2 => state(2), B1 => state(1), B2 => n_27, C => n_33, ZN => n_58);
  g4862 : OAI22D0BWP7T port map(A1 => n_40, A2 => vga_done, B1 => n_45, B2 => n_23, ZN => n_57);
  state_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_mined(2), D => n_41, Q => state(2));
  g4868 : OAI21D0BWP7T port map(A1 => n_16, A2 => n_55, B => n_49, ZN => n_56);
  g4863 : OR2D1BWP7T port map(A1 => n_53, A2 => n_36, Z => n_54);
  g4864 : OR2D1BWP7T port map(A1 => n_53, A2 => n_34, Z => n_52);
  g4874 : INVD0BWP7T port map(I => n_50, ZN => n_51);
  g4865 : IOA21D0BWP7T port map(A1 => n_60, A2 => map_data(34), B => n_49, ZN => n_135);
  g4799 : NR4D0BWP7T port map(A1 => n_47, A2 => map_internal(53), A3 => map_internal(52), A4 => map_internal(51), ZN => n_48);
  g4878 : OAI211D1BWP7T port map(A1 => vga_done, A2 => n_55, B => n_44, C => n_39, ZN => n_50);
  g4871 : INR2D1BWP7T port map(A1 => map_internal(52), B1 => n_47, ZN => n_129);
  g4872 : OAI221D0BWP7T port map(A1 => n_25, A2 => reset, B1 => n_55, B2 => n_37, C => n_45, ZN => n_53);
  g4876 : OA21D0BWP7T port map(A1 => n_55, A2 => n_32, B => n_44, Z => n_49);
  g4877 : OAI21D0BWP7T port map(A1 => n_43, A2 => n_12, B => n_42, ZN => n_124);
  g4873 : ND2D1BWP7T port map(A1 => n_44, A2 => n_55, ZN => n_120);
  g4875 : NR3D0BWP7T port map(A1 => n_45, A2 => n_19, A3 => map_updated, ZN => n_41);
  g4879 : OA221D0BWP7T port map(A1 => n_55, A2 => state(0), B1 => state(2), B2 => n_22, C => n_39, Z => n_40);
  g4866 : IND4D0BWP7T port map(A1 => map_updated, B1 => dir_mined(2), B2 => n_20, B3 => n_37, ZN => n_38);
  g4880 : AOI211XD0BWP7T port map(A1 => n_28, A2 => n_5, B => n_31, C => n_60, ZN => n_42);
  g4881 : IND3D1BWP7T port map(A1 => n_39, B1 => vga_done, B2 => n_18, ZN => n_47);
  g4889 : IAO21D0BWP7T port map(A1 => map_internal(20), A2 => map_internal(51), B => n_35, ZN => n_36);
  g4890 : IAO21D0BWP7T port map(A1 => map_internal(18), A2 => map_internal(53), B => n_35, ZN => n_34);
  g4885 : NR3D0BWP7T port map(A1 => n_43, A2 => n_3, A3 => n_9, ZN => n_123);
  g4886 : OAI21D0BWP7T port map(A1 => n_24, A2 => n_37, B => n_33, ZN => n_44);
  g4882 : AN4D1BWP7T port map(A1 => n_26, A2 => n_32, A3 => vga_done, A4 => n_33, Z => n_143);
  g4888 : IND2D1BWP7T port map(A1 => state(2), B1 => n_31, ZN => n_45);
  g4887 : INVD0BWP7T port map(I => n_227, ZN => n_30);
  g4883 : AN3D0BWP7T port map(A1 => n_60, A2 => n_235, A3 => map_internal(38), Z => n_139);
  g4895 : ND2D1BWP7T port map(A1 => n_60, A2 => n_32, ZN => n_39);
  g4894 : ND2D1BWP7T port map(A1 => n_28, A2 => state(1), ZN => n_43);
  g4893 : ND2D1BWP7T port map(A1 => n_26, A2 => vga_done, ZN => n_27);
  g4897 : INVD0BWP7T port map(I => n_24, ZN => n_25);
  g4884 : AN3D0BWP7T port map(A1 => n_60, A2 => n_229, A3 => map_internal(35), Z => n_134);
  g4896 : ND2D1BWP7T port map(A1 => n_60, A2 => map_internal(52), ZN => n_35);
  g4891 : AOI21D0BWP7T port map(A1 => n_1, A2 => dir_mined(2), B => map_updated, ZN => n_23);
  g4906 : INVD0BWP7T port map(I => n_28, ZN => n_22);
  g4892 : AN2D1BWP7T port map(A1 => n_37, A2 => n_33, Z => n_31);
  g4907 : CKND1BWP7T port map(I => n_60, ZN => n_55);
  g4898 : AO21D0BWP7T port map(A1 => dir_mined(0), A2 => dir_mined(1), B => n_19, Z => n_20);
  g4903 : OAI22D0BWP7T port map(A1 => state(1), A2 => vga_done, B1 => n_18, B2 => n_32, ZN => n_24);
  g4900 : XNR2D1BWP7T port map(A1 => map_internal(38), A2 => map_data(36), ZN => n_17);
  g4901 : XNR2D1BWP7T port map(A1 => map_internal(35), A2 => map_data(33), ZN => n_16);
  g4904 : NR2XD0BWP7T port map(A1 => n_18, A2 => state(2), ZN => n_26);
  g4908 : NR2D1BWP7T port map(A1 => n_18, A2 => reset, ZN => n_28);
  g4910 : AN2D1BWP7T port map(A1 => state(2), A2 => n_33, Z => n_60);
  g4905 : NR2XD0BWP7T port map(A1 => dir_mined(0), A2 => dir_mined(1), ZN => n_19);
  g4909 : NR2D1BWP7T port map(A1 => state(0), A2 => state(1), ZN => n_37);
  g4929 : BUFFD4BWP7T port map(I => map_internal(51), Z => map_data(51));
  g4921 : BUFFD4BWP7T port map(I => map_internal(38), Z => map_data(38));
  g4912 : BUFFD4BWP7T port map(I => map_internal(35), Z => map_data(35));
  g4918 : BUFFD4BWP7T port map(I => map_internal(18), Z => map_data(18));
  g4915 : INVD1BWP7T port map(I => reset, ZN => n_33);
  g4922 : BUFFD4BWP7T port map(I => map_internal(52), Z => map_data(52));
  g4913 : INVD0BWP7T port map(I => vga_done, ZN => n_5);
  g4927 : BUFFD4BWP7T port map(I => map_internal(53), Z => map_data(53));
  g4920 : INVD0BWP7T port map(I => dir_mined(0), ZN => n_1);
  g4925 : BUFFD4BWP7T port map(I => map_internal(20), Z => map_data(20));
  g2 : OAI21D0BWP7T port map(A1 => n_225, A2 => n_43, B => n_42, ZN => n_226);
  g3 : XNR2D1BWP7T port map(A1 => map_internal(20), A2 => map_internal(18), ZN => n_225);
  g5005 : CKXOR2D1BWP7T port map(A1 => map_internal(51), A2 => map_internal(53), Z => n_227);
  drc_bufs : INVD4BWP7T port map(I => n_230, ZN => map_data(33));
  drc_bufs5011 : INVD4BWP7T port map(I => n_236, ZN => map_data(36));
  drc_bufs5018 : INVD4BWP7T port map(I => n_12, ZN => map_data(19));
  drc_bufs5024 : INVD4BWP7T port map(I => n_248, ZN => map_data(37));
  drc_bufs5030 : INVD4BWP7T port map(I => n_254, ZN => map_data(34));
  drc_bufs5036 : INVD4BWP7T port map(I => n_260, ZN => map_data(67));
  drc_bufs5042 : INVD4BWP7T port map(I => n_266, ZN => map_data(66));
  drc_bufs5048 : INVD4BWP7T port map(I => n_272, ZN => map_data(65));
  drc_bufs5054 : INVD4BWP7T port map(I => n_278, ZN => map_data(64));
  drc_bufs5060 : INVD4BWP7T port map(I => n_284, ZN => map_data(63));
  drc_bufs5066 : INVD4BWP7T port map(I => n_290, ZN => map_data(62));
  drc_bufs5072 : INVD4BWP7T port map(I => n_296, ZN => map_data(61));
  drc_bufs5078 : INVD4BWP7T port map(I => n_302, ZN => map_data(60));
  drc_bufs5084 : INVD4BWP7T port map(I => n_308, ZN => map_data(59));
  drc_bufs5090 : INVD4BWP7T port map(I => n_314, ZN => map_data(58));
  drc_bufs5096 : INVD4BWP7T port map(I => n_320, ZN => map_data(57));
  drc_bufs5102 : INVD4BWP7T port map(I => n_326, ZN => map_data(56));
  drc_bufs5108 : INVD4BWP7T port map(I => n_332, ZN => map_data(55));
  drc_bufs5114 : INVD4BWP7T port map(I => n_338, ZN => map_data(54));
  drc_bufs5120 : INVD4BWP7T port map(I => n_344, ZN => map_data(50));
  drc_bufs5126 : INVD4BWP7T port map(I => n_350, ZN => map_data(49));
  drc_bufs5132 : INVD4BWP7T port map(I => n_356, ZN => map_data(48));
  drc_bufs5138 : INVD4BWP7T port map(I => n_362, ZN => map_data(47));
  drc_bufs5144 : INVD4BWP7T port map(I => n_368, ZN => map_data(46));
  drc_bufs5150 : INVD4BWP7T port map(I => n_374, ZN => map_data(45));
  drc_bufs5156 : INVD4BWP7T port map(I => n_380, ZN => map_data(44));
  drc_bufs5162 : INVD4BWP7T port map(I => n_386, ZN => map_data(43));
  drc_bufs5168 : INVD4BWP7T port map(I => n_392, ZN => map_data(42));
  drc_bufs5174 : INVD4BWP7T port map(I => n_398, ZN => map_data(41));
  drc_bufs5180 : INVD4BWP7T port map(I => n_404, ZN => map_data(40));
  drc_bufs5186 : INVD4BWP7T port map(I => n_410, ZN => map_data(39));
  drc_bufs5192 : INVD4BWP7T port map(I => n_416, ZN => map_data(0));
  drc_bufs5198 : INVD4BWP7T port map(I => n_422, ZN => map_data(16));
  drc_bufs5204 : INVD4BWP7T port map(I => n_428, ZN => map_data(7));
  drc_bufs5210 : INVD4BWP7T port map(I => n_434, ZN => map_data(15));
  drc_bufs5216 : INVD4BWP7T port map(I => n_440, ZN => map_data(32));
  drc_bufs5222 : INVD4BWP7T port map(I => n_446, ZN => map_data(31));
  drc_bufs5228 : INVD4BWP7T port map(I => n_452, ZN => map_data(30));
  drc_bufs5234 : INVD4BWP7T port map(I => n_458, ZN => map_data(29));
  drc_bufs5240 : INVD4BWP7T port map(I => n_464, ZN => map_data(28));
  drc_bufs5246 : INVD4BWP7T port map(I => n_470, ZN => map_data(27));
  drc_bufs5252 : INVD4BWP7T port map(I => n_476, ZN => map_data(26));
  drc_bufs5258 : INVD4BWP7T port map(I => n_482, ZN => map_data(25));
  drc_bufs5264 : INVD4BWP7T port map(I => n_488, ZN => map_data(24));
  drc_bufs5270 : INVD4BWP7T port map(I => n_494, ZN => map_data(23));
  drc_bufs5276 : INVD4BWP7T port map(I => n_500, ZN => map_data(22));
  drc_bufs5282 : INVD4BWP7T port map(I => n_506, ZN => map_data(21));
  drc_bufs5288 : INVD4BWP7T port map(I => n_512, ZN => map_data(8));
  drc_bufs5294 : INVD4BWP7T port map(I => n_518, ZN => map_data(17));
  drc_bufs5300 : INVD4BWP7T port map(I => n_524, ZN => map_data(71));
  drc_bufs5306 : INVD4BWP7T port map(I => n_530, ZN => map_data(1));
  drc_bufs5312 : INVD4BWP7T port map(I => n_536, ZN => map_data(14));
  drc_bufs5318 : INVD4BWP7T port map(I => n_542, ZN => map_data(13));
  drc_bufs5324 : INVD4BWP7T port map(I => n_548, ZN => map_data(12));
  drc_bufs5330 : INVD4BWP7T port map(I => n_554, ZN => map_data(11));
  drc_bufs5336 : INVD4BWP7T port map(I => n_560, ZN => map_data(10));
  drc_bufs5342 : INVD4BWP7T port map(I => n_566, ZN => map_data(9));
  drc_bufs5348 : INVD4BWP7T port map(I => n_572, ZN => map_data(3));
  drc_bufs5354 : INVD4BWP7T port map(I => n_578, ZN => map_data(70));
  drc_bufs5360 : INVD4BWP7T port map(I => n_584, ZN => map_data(6));
  drc_bufs5366 : INVD4BWP7T port map(I => n_590, ZN => map_data(5));
  drc_bufs5372 : INVD4BWP7T port map(I => n_596, ZN => map_data(4));
  drc_bufs5378 : INVD4BWP7T port map(I => n_602, ZN => map_data(69));
  drc_bufs5384 : INVD4BWP7T port map(I => n_608, ZN => map_data(2));
  drc_bufs5390 : INVD4BWP7T port map(I => n_614, ZN => map_data(68));
  map_internal_reg_20 : DFD1BWP7T port map(CP => clk, D => n_125, Q => map_internal(20), QN => n_9);
  state_reg_0 : DFD1BWP7T port map(CP => clk, D => n_57, Q => state(0), QN => n_18);
  map_internal_reg_18 : DFD1BWP7T port map(CP => clk, D => n_126, Q => map_internal(18), QN => n_3);
  state_reg_1 : DFD1BWP7T port map(CP => clk, D => n_58, Q => state(1), QN => n_32);
  map_internal_reg_33 : DFD0BWP7T port map(CP => clk, D => n_137, Q => n_229, QN => n_230);
  map_internal_reg_36 : DFD0BWP7T port map(CP => clk, D => n_142, Q => n_235, QN => n_236);
  map_internal_reg_19 : DFD0BWP7T port map(CP => clk, D => n_95, Q => map_internal(19), QN => n_12);
  map_internal_reg_37 : DFD0BWP7T port map(CP => clk, D => n_138, Q => map_internal(37), QN => n_248);
  map_internal_reg_34 : DFD0BWP7T port map(CP => clk, D => n_132, Q => map_internal(34), QN => n_254);
  map_internal_reg_67 : DFD0BWP7T port map(CP => clk, D => n_109, Q => map_internal(67), QN => n_260);
  map_internal_reg_66 : DFD0BWP7T port map(CP => clk, D => n_93, Q => map_internal(66), QN => n_266);
  map_internal_reg_65 : DFD0BWP7T port map(CP => clk, D => n_81, Q => map_internal(65), QN => n_272);
  map_internal_reg_64 : DFD0BWP7T port map(CP => clk, D => n_83, Q => map_internal(64), QN => n_278);
  map_internal_reg_63 : DFD0BWP7T port map(CP => clk, D => n_84, Q => map_internal(63), QN => n_284);
  map_internal_reg_62 : DFD0BWP7T port map(CP => clk, D => n_85, Q => map_internal(62), QN => n_290);
  map_internal_reg_61 : DFD0BWP7T port map(CP => clk, D => n_87, Q => map_internal(61), QN => n_296);
  map_internal_reg_60 : DFD0BWP7T port map(CP => clk, D => n_88, Q => map_internal(60), QN => n_302);
  map_internal_reg_59 : DFD0BWP7T port map(CP => clk, D => n_90, Q => map_internal(59), QN => n_308);
  map_internal_reg_58 : DFD0BWP7T port map(CP => clk, D => n_75, Q => map_internal(58), QN => n_314);
  map_internal_reg_57 : DFD0BWP7T port map(CP => clk, D => n_92, Q => map_internal(57), QN => n_320);
  map_internal_reg_56 : DFD0BWP7T port map(CP => clk, D => n_96, Q => map_internal(56), QN => n_326);
  map_internal_reg_55 : DFD0BWP7T port map(CP => clk, D => n_97, Q => map_internal(55), QN => n_332);
  map_internal_reg_54 : DFD0BWP7T port map(CP => clk, D => n_98, Q => map_internal(54), QN => n_338);
  map_internal_reg_50 : DFD0BWP7T port map(CP => clk, D => n_108, Q => map_internal(50), QN => n_344);
  map_internal_reg_49 : DFD0BWP7T port map(CP => clk, D => n_111, Q => map_internal(49), QN => n_350);
  map_internal_reg_48 : DFD0BWP7T port map(CP => clk, D => n_113, Q => map_internal(48), QN => n_356);
  map_internal_reg_47 : DFD0BWP7T port map(CP => clk, D => n_79, Q => map_internal(47), QN => n_362);
  map_internal_reg_46 : DFD0BWP7T port map(CP => clk, D => n_114, Q => map_internal(46), QN => n_368);
  map_internal_reg_45 : DFD0BWP7T port map(CP => clk, D => n_116, Q => map_internal(45), QN => n_374);
  map_internal_reg_44 : DFD0BWP7T port map(CP => clk, D => n_117, Q => map_internal(44), QN => n_380);
  map_internal_reg_43 : DFD0BWP7T port map(CP => clk, D => n_119, Q => map_internal(43), QN => n_386);
  map_internal_reg_42 : DFD0BWP7T port map(CP => clk, D => n_103, Q => map_internal(42), QN => n_392);
  map_internal_reg_41 : DFD0BWP7T port map(CP => clk, D => n_72, Q => map_internal(41), QN => n_398);
  map_internal_reg_40 : DFD0BWP7T port map(CP => clk, D => n_122, Q => map_internal(40), QN => n_404);
  map_internal_reg_39 : DFD0BWP7T port map(CP => clk, D => n_76, Q => map_internal(39), QN => n_410);
  map_internal_reg_0 : DFD0BWP7T port map(CP => clk, D => n_64, Q => map_internal(0), QN => n_416);
  map_internal_reg_16 : DFD0BWP7T port map(CP => clk, D => n_99, Q => map_internal(16), QN => n_422);
  map_internal_reg_7 : DFD0BWP7T port map(CP => clk, D => n_118, Q => map_internal(7), QN => n_428);
  map_internal_reg_15 : DFD0BWP7T port map(CP => clk, D => n_100, Q => map_internal(15), QN => n_434);
  map_internal_reg_32 : DFD0BWP7T port map(CP => clk, D => n_66, Q => map_internal(32), QN => n_440);
  map_internal_reg_31 : DFD0BWP7T port map(CP => clk, D => n_67, Q => map_internal(31), QN => n_446);
  map_internal_reg_30 : DFD0BWP7T port map(CP => clk, D => n_68, Q => map_internal(30), QN => n_452);
  map_internal_reg_29 : DFD0BWP7T port map(CP => clk, D => n_69, Q => map_internal(29), QN => n_458);
  map_internal_reg_28 : DFD0BWP7T port map(CP => clk, D => n_70, Q => map_internal(28), QN => n_464);
  map_internal_reg_27 : DFD0BWP7T port map(CP => clk, D => n_71, Q => map_internal(27), QN => n_470);
  map_internal_reg_26 : DFD0BWP7T port map(CP => clk, D => n_107, Q => map_internal(26), QN => n_476);
  map_internal_reg_25 : DFD0BWP7T port map(CP => clk, D => n_73, Q => map_internal(25), QN => n_482);
  map_internal_reg_24 : DFD0BWP7T port map(CP => clk, D => n_74, Q => map_internal(24), QN => n_488);
  map_internal_reg_23 : DFD0BWP7T port map(CP => clk, D => n_91, Q => map_internal(23), QN => n_494);
  map_internal_reg_22 : DFD0BWP7T port map(CP => clk, D => n_77, Q => map_internal(22), QN => n_500);
  map_internal_reg_21 : DFD0BWP7T port map(CP => clk, D => n_78, Q => map_internal(21), QN => n_506);
  map_internal_reg_8 : DFD0BWP7T port map(CP => clk, D => n_115, Q => map_internal(8), QN => n_512);
  map_internal_reg_17 : DFD0BWP7T port map(CP => clk, D => n_94, Q => map_internal(17), QN => n_518);
  map_internal_reg_71 : DFD0BWP7T port map(CP => clk, D => n_80, Q => map_internal(71), QN => n_524);
  map_internal_reg_1 : DFD0BWP7T port map(CP => clk, D => n_65, Q => map_internal(1), QN => n_530);
  map_internal_reg_14 : DFD0BWP7T port map(CP => clk, D => n_102, Q => map_internal(14), QN => n_536);
  map_internal_reg_13 : DFD0BWP7T port map(CP => clk, D => n_121, Q => map_internal(13), QN => n_542);
  map_internal_reg_12 : DFD0BWP7T port map(CP => clk, D => n_104, Q => map_internal(12), QN => n_548);
  map_internal_reg_11 : DFD0BWP7T port map(CP => clk, D => n_105, Q => map_internal(11), QN => n_554);
  map_internal_reg_10 : DFD0BWP7T port map(CP => clk, D => n_106, Q => map_internal(10), QN => n_560);
  map_internal_reg_9 : DFD0BWP7T port map(CP => clk, D => n_110, Q => map_internal(9), QN => n_566);
  map_internal_reg_3 : DFD0BWP7T port map(CP => clk, D => n_62, Q => map_internal(3), QN => n_572);
  map_internal_reg_70 : DFD0BWP7T port map(CP => clk, D => n_82, Q => map_internal(70), QN => n_578);
  map_internal_reg_6 : DFD0BWP7T port map(CP => clk, D => n_112, Q => map_internal(6), QN => n_584);
  map_internal_reg_5 : DFD0BWP7T port map(CP => clk, D => n_101, Q => map_internal(5), QN => n_590);
  map_internal_reg_4 : DFD0BWP7T port map(CP => clk, D => n_61, Q => map_internal(4), QN => n_596);
  map_internal_reg_69 : DFD0BWP7T port map(CP => clk, D => n_86, Q => map_internal(69), QN => n_602);
  map_internal_reg_2 : DFD0BWP7T port map(CP => clk, D => n_63, Q => map_internal(2), QN => n_608);
  map_internal_reg_68 : DFD0BWP7T port map(CP => clk, D => n_89, Q => map_internal(68), QN => n_614);

end synthesised;
