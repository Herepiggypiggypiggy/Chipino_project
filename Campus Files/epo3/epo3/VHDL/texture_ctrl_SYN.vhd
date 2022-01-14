
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of texture_ctrl is

  component BUFFD4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D1BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component FA1D0BWP7T
    port(A, B, CI : in std_logic; CO, S : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AN4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component ND2D4BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component OR4D4BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AOI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OA211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI222D1BWP7T
    port(A, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA31D1BWP7T
    port(A1, A2, A3, B : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component AO31D1BWP7T
    port(A1, A2, A3, B : in std_logic; Z : out std_logic);
  end component;

  component CKMUX2D1BWP7T
    port(I0, I1, S : in std_logic; Z : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component DFXQD1BWP7T
    port(CP, DA, DB, SA : in std_logic; Q : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component AO32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AN4D1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component INR4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFD0BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFKCND0BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFCND0BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFXD0BWP7T
    port(CP, DA, DB, SA : in std_logic; Q, QN : out std_logic);
  end component;

  component DFXD1BWP7T
    port(CP, DA, DB, SA : in std_logic; Q, QN : out std_logic);
  end component;

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFCND1BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  signal vcount : std_logic_vector(9 downto 0);
  signal vvis : std_logic_vector(6 downto 0);
  signal hvis : std_logic_vector(6 downto 0);
  signal yposition : std_logic_vector(4 downto 0);
  signal frame_count : std_logic_vector(3 downto 0);
  signal xposition : std_logic_vector(4 downto 0);
  signal csa_tree_add_99_11_groupi_n_0, csa_tree_add_99_11_groupi_n_1, csa_tree_add_99_11_groupi_n_2, csa_tree_add_99_11_groupi_n_3, csa_tree_add_99_11_groupi_n_4 : std_logic;
  signal csa_tree_add_99_11_groupi_n_5, csa_tree_add_99_11_groupi_n_6, csa_tree_add_99_11_groupi_n_7, csa_tree_add_99_11_groupi_n_8, csa_tree_add_99_11_groupi_n_9 : std_logic;
  signal csa_tree_add_99_11_groupi_n_10, csa_tree_add_99_11_groupi_n_11, csa_tree_add_99_11_groupi_n_12, csa_tree_add_99_11_groupi_n_13, csa_tree_add_99_11_groupi_n_14 : std_logic;
  signal csa_tree_add_99_11_groupi_n_15, csa_tree_add_99_11_groupi_n_16, csa_tree_add_99_11_groupi_n_17, csa_tree_add_99_11_groupi_n_18, csa_tree_add_99_11_groupi_n_19 : std_logic;
  signal csa_tree_add_99_11_groupi_n_20, csa_tree_add_99_11_groupi_n_21, csa_tree_add_99_11_groupi_n_22, csa_tree_add_99_11_groupi_n_23, csa_tree_add_99_11_groupi_n_24 : std_logic;
  signal csa_tree_add_99_11_groupi_n_25, csa_tree_add_99_11_groupi_n_26, csa_tree_add_99_11_groupi_n_27, csa_tree_add_99_11_groupi_n_28, csa_tree_add_99_11_groupi_n_29 : std_logic;
  signal csa_tree_add_99_11_groupi_n_30, csa_tree_add_99_11_groupi_n_31, csa_tree_add_99_11_groupi_n_32, csa_tree_add_99_11_groupi_n_33, csa_tree_add_99_11_groupi_n_34 : std_logic;
  signal csa_tree_add_99_11_groupi_n_35, csa_tree_add_99_11_groupi_n_36, csa_tree_add_99_11_groupi_n_37, csa_tree_add_99_11_groupi_n_38, csa_tree_add_99_11_groupi_n_39 : std_logic;
  signal csa_tree_add_99_11_groupi_n_40, csa_tree_add_99_11_groupi_n_41, csa_tree_add_99_11_groupi_n_42, csa_tree_add_99_11_groupi_n_45, csa_tree_add_99_11_groupi_n_46 : std_logic;
  signal csa_tree_add_99_11_groupi_n_47, csa_tree_add_99_11_groupi_n_48, csa_tree_add_99_11_groupi_n_49, csa_tree_add_99_11_groupi_n_50, csa_tree_add_99_11_groupi_n_51 : std_logic;
  signal csa_tree_add_99_11_groupi_n_52, csa_tree_add_99_11_groupi_n_53, csa_tree_add_99_11_groupi_n_54, csa_tree_add_99_11_groupi_n_55, csa_tree_add_99_11_groupi_n_56 : std_logic;
  signal csa_tree_add_99_11_groupi_n_57, csa_tree_add_99_11_groupi_n_58, csa_tree_add_99_11_groupi_n_59, csa_tree_add_99_11_groupi_n_60, csa_tree_add_99_11_groupi_n_61 : std_logic;
  signal csa_tree_add_99_11_groupi_n_62, csa_tree_add_99_11_groupi_n_63, csa_tree_add_99_11_groupi_n_64, csa_tree_add_99_11_groupi_n_65, csa_tree_add_99_11_groupi_n_66 : std_logic;
  signal csa_tree_add_99_11_groupi_n_67, csa_tree_add_99_11_groupi_n_68, csa_tree_add_99_11_groupi_n_69, csa_tree_add_99_11_groupi_n_70, csa_tree_add_99_11_groupi_n_71 : std_logic;
  signal csa_tree_add_99_11_groupi_n_72, csa_tree_add_99_11_groupi_n_73, csa_tree_add_99_11_groupi_n_74, csa_tree_add_99_11_groupi_n_75, csa_tree_add_99_11_groupi_n_76 : std_logic;
  signal csa_tree_add_99_11_groupi_n_77, csa_tree_add_99_11_groupi_n_78, csa_tree_add_99_11_groupi_n_79, csa_tree_add_99_11_groupi_n_80, csa_tree_add_99_11_groupi_n_81 : std_logic;
  signal csa_tree_add_99_11_groupi_n_82, csa_tree_add_99_11_groupi_n_83, csa_tree_add_99_11_groupi_n_84, csa_tree_add_99_11_groupi_n_85, csa_tree_add_99_11_groupi_n_86 : std_logic;
  signal csa_tree_add_99_11_groupi_n_88, csa_tree_add_99_11_groupi_n_89, csa_tree_add_99_11_groupi_n_90, csa_tree_add_99_11_groupi_n_91, csa_tree_add_99_11_groupi_n_92 : std_logic;
  signal csa_tree_add_99_11_groupi_n_93, csa_tree_add_99_11_groupi_n_94, csa_tree_add_99_11_groupi_n_95, csa_tree_add_99_11_groupi_n_96, csa_tree_add_99_11_groupi_n_97 : std_logic;
  signal csa_tree_add_99_11_groupi_n_98, csa_tree_add_99_11_groupi_n_99, csa_tree_add_99_11_groupi_n_100, csa_tree_add_99_11_groupi_n_101, csa_tree_add_99_11_groupi_n_102 : std_logic;
  signal csa_tree_add_99_11_groupi_n_103, csa_tree_add_99_11_groupi_n_105, csa_tree_add_99_11_groupi_n_106, csa_tree_add_99_11_groupi_n_107, csa_tree_add_99_11_groupi_n_108 : std_logic;
  signal csa_tree_add_99_11_groupi_n_109, csa_tree_add_99_11_groupi_n_110, csa_tree_add_99_11_groupi_n_111, csa_tree_add_99_11_groupi_n_112, csa_tree_add_99_11_groupi_n_113 : std_logic;
  signal csa_tree_add_99_11_groupi_n_114, csa_tree_add_99_11_groupi_n_115, csa_tree_add_99_11_groupi_n_116, csa_tree_add_99_11_groupi_n_118, csa_tree_add_99_11_groupi_n_119 : std_logic;
  signal csa_tree_add_99_11_groupi_n_120, csa_tree_add_99_11_groupi_n_121, csa_tree_add_99_11_groupi_n_122, csa_tree_add_99_11_groupi_n_123, csa_tree_add_99_11_groupi_n_124 : std_logic;
  signal csa_tree_add_99_11_groupi_n_125, csa_tree_add_99_11_groupi_n_126, csa_tree_add_99_11_groupi_n_127, csa_tree_add_99_11_groupi_n_129, csa_tree_add_99_11_groupi_n_131 : std_logic;
  signal csa_tree_add_99_11_groupi_n_133, csa_tree_add_99_11_groupi_n_135, csa_tree_add_99_11_groupi_n_137, csa_tree_add_99_11_groupi_n_140, csa_tree_add_99_11_groupi_n_142 : std_logic;
  signal n_0, n_1, n_2, n_3, n_4 : std_logic;
  signal n_5, n_6, n_7, n_8, n_9 : std_logic;
  signal n_10, n_11, n_12, n_13, n_14 : std_logic;
  signal n_15, n_16, n_17, n_18, n_19 : std_logic;
  signal n_20, n_21, n_22, n_23, n_24 : std_logic;
  signal n_25, n_26, n_27, n_28, n_29 : std_logic;
  signal n_30, n_31, n_32, n_33, n_34 : std_logic;
  signal n_35, n_36, n_37, n_38, n_39 : std_logic;
  signal n_40, n_41, n_42, n_43, n_44 : std_logic;
  signal n_45, n_46, n_47, n_48, n_49 : std_logic;
  signal n_50, n_51, n_52, n_53, n_54 : std_logic;
  signal n_55, n_56, n_57, n_58, n_59 : std_logic;
  signal n_60, n_61, n_62, n_63, n_64 : std_logic;
  signal n_65, n_66, n_67, n_68, n_69 : std_logic;
  signal n_70, n_71, n_72, n_73, n_74 : std_logic;
  signal n_75, n_76, n_77, n_78, n_79 : std_logic;
  signal n_80, n_81, n_82, n_83, n_84 : std_logic;
  signal n_85, n_86, n_87, n_88, n_89 : std_logic;
  signal n_90, n_91, n_92, n_93, n_94 : std_logic;
  signal n_95, n_96, n_97, n_98, n_99 : std_logic;
  signal n_100, n_101, n_102, n_103, n_104 : std_logic;
  signal n_105, n_106, n_107, n_108, n_109 : std_logic;
  signal n_110, n_111, n_112, n_113, n_114 : std_logic;
  signal n_115, n_116, n_117, n_118, n_119 : std_logic;
  signal n_120, n_121, n_122, n_123, n_124 : std_logic;
  signal n_125, n_126, n_127, n_128, n_129 : std_logic;
  signal n_130, n_131, n_132, n_133, n_134 : std_logic;
  signal n_135, n_136, n_137, n_138, n_139 : std_logic;
  signal n_140, n_141, n_142, n_143, n_144 : std_logic;
  signal n_145, n_146, n_147, n_148, n_149 : std_logic;
  signal n_150, n_151, n_152, n_153, n_154 : std_logic;
  signal n_155, n_156, n_157, n_158, n_159 : std_logic;
  signal n_160, n_161, n_162, n_163, n_164 : std_logic;
  signal n_165, n_166, n_167, n_168, n_169 : std_logic;
  signal n_170, n_171, n_172, n_173, n_174 : std_logic;
  signal n_175, n_176, n_177, n_178, n_179 : std_logic;
  signal n_180, n_181, n_182, n_183, n_184 : std_logic;
  signal n_185, n_186, n_187, n_188, n_189 : std_logic;
  signal n_190, n_191, n_192, n_193, n_194 : std_logic;
  signal n_195, n_196, n_197, n_198, n_199 : std_logic;
  signal n_200, n_201, n_202, n_203, n_204 : std_logic;
  signal n_205, n_206, n_207, n_208, n_209 : std_logic;
  signal n_210, n_211, n_212, n_213, n_214 : std_logic;
  signal n_215, n_216, n_217, n_218, n_219 : std_logic;
  signal n_220, n_221, n_222, n_223, n_224 : std_logic;
  signal n_225, n_226, n_227, n_228, n_229 : std_logic;
  signal n_230, n_231, n_232, n_233, n_234 : std_logic;
  signal n_235, n_236, n_237, n_238, n_239 : std_logic;
  signal n_240, n_241, n_242, n_243, n_244 : std_logic;
  signal n_245, n_246, n_247, n_248, n_249 : std_logic;
  signal n_250, n_251, n_252, n_253, n_254 : std_logic;
  signal n_255, n_256, n_257, n_258, n_259 : std_logic;
  signal n_260, n_261, n_262, n_263, n_264 : std_logic;
  signal n_265, n_266, n_267, n_268, n_269 : std_logic;
  signal n_270, n_271, n_272, n_273, n_274 : std_logic;
  signal n_275, n_276, n_277, n_278, n_279 : std_logic;
  signal n_280, n_281, n_282, n_283, n_284 : std_logic;
  signal n_285, n_286, n_287, n_288, n_289 : std_logic;
  signal n_290, n_291, n_292, n_293, n_294 : std_logic;
  signal n_295, n_296, n_297, n_298, n_299 : std_logic;
  signal n_300, n_301, n_302, n_303, n_304 : std_logic;
  signal n_305, n_306, n_307, n_308, n_309 : std_logic;
  signal n_310, n_311, n_312, n_313, n_314 : std_logic;
  signal n_315, n_316, n_317, n_318, n_319 : std_logic;
  signal n_320, n_321, n_322, n_323, n_324 : std_logic;
  signal n_325, n_326, n_327, n_328, n_330 : std_logic;
  signal n_331, n_332, n_333, n_334, n_338 : std_logic;
  signal n_339, n_340, n_341, n_342, n_343 : std_logic;
  signal n_344, n_345, n_346, n_347, n_348 : std_logic;
  signal n_349, n_350, n_351, n_352, n_353 : std_logic;
  signal n_354, n_355, n_356, n_357, n_358 : std_logic;
  signal n_359, n_360, n_361, n_362, n_363 : std_logic;
  signal n_364, n_365, n_366, n_367, n_368 : std_logic;
  signal n_369, n_370, n_371, n_372, n_373 : std_logic;
  signal n_374, n_375, n_376, n_377, n_378 : std_logic;
  signal n_379, n_380, n_381, n_382, n_383 : std_logic;
  signal n_384, n_385, n_386, n_387, n_388 : std_logic;
  signal n_389, n_390, n_391, n_392, n_393 : std_logic;
  signal n_394, n_395, n_396, n_397, n_398 : std_logic;
  signal n_399, n_400, n_401, n_402, n_403 : std_logic;
  signal n_404, n_405, n_406, n_407, n_408 : std_logic;
  signal n_409, n_410, n_411, n_412, n_413 : std_logic;
  signal n_414, n_415, n_416, n_417, n_418 : std_logic;
  signal n_419, n_420, n_421, n_422, n_423 : std_logic;
  signal n_424, n_425, n_426, n_427, n_428 : std_logic;
  signal n_429, n_430, n_431, n_432, n_433 : std_logic;
  signal n_434, n_435, n_436, n_437, n_438 : std_logic;
  signal n_439, n_440, n_441, n_442, n_443 : std_logic;
  signal n_444, n_445, n_446, n_447, n_448 : std_logic;
  signal n_449, n_450, n_451, n_452, n_453 : std_logic;
  signal n_454, n_455, n_456, n_457, n_458 : std_logic;
  signal n_459, n_460, n_461, n_462, n_463 : std_logic;
  signal n_464, n_465, n_466, n_467, n_468 : std_logic;
  signal n_469, n_470, n_471, n_472, n_473 : std_logic;
  signal n_474, n_475, n_476, n_477, n_478 : std_logic;
  signal n_479, n_480, n_481, n_482, n_483 : std_logic;
  signal n_484, n_485, n_486, n_487, n_488 : std_logic;
  signal n_489, n_490, n_491, n_492, n_493 : std_logic;
  signal n_494, n_495, n_496, n_497, n_498 : std_logic;
  signal n_499, n_500, n_501, n_502, n_503 : std_logic;
  signal n_504, n_505, n_506, n_507, n_508 : std_logic;
  signal n_509, n_510, n_511, n_512, n_513 : std_logic;
  signal n_514, n_515, n_516, n_517, n_518 : std_logic;
  signal n_519, n_520, n_521, n_522, n_523 : std_logic;
  signal n_524, n_525, n_526, n_527, n_528 : std_logic;
  signal n_529, n_530, n_531, n_532, n_533 : std_logic;
  signal n_534, n_535, n_536, n_537, n_538 : std_logic;
  signal n_539, n_540, n_541, n_542, n_543 : std_logic;
  signal n_544, n_545, n_546, n_547, n_548 : std_logic;
  signal n_549, n_550, n_551, n_552, n_553 : std_logic;
  signal n_554, n_555, n_556, n_557, n_558 : std_logic;
  signal n_559, n_560, n_561, n_562, n_563 : std_logic;
  signal n_564, n_565, n_566, n_567, n_568 : std_logic;
  signal n_569, n_570, n_571, n_572, n_573 : std_logic;
  signal n_574, n_575, n_576, n_577, n_578 : std_logic;
  signal n_579, n_580, n_581, n_582, n_583 : std_logic;
  signal n_584, n_585, n_586, n_587, n_588 : std_logic;
  signal n_589, n_590, n_591, n_592, n_593 : std_logic;
  signal n_594, n_595, n_596, n_597, n_598 : std_logic;
  signal n_599, n_600, n_601, n_602, n_603 : std_logic;
  signal n_604, n_605, n_606, n_607, n_608 : std_logic;
  signal n_609, n_610, n_611, n_612, n_613 : std_logic;
  signal n_614, n_615, n_616, n_617, n_618 : std_logic;
  signal n_619, n_620, n_621, n_622, n_623 : std_logic;
  signal n_624, n_625, n_626, n_627, n_628 : std_logic;
  signal n_629, n_630, n_631, n_632, n_633 : std_logic;
  signal n_634, n_635, n_636, n_637, n_638 : std_logic;
  signal n_639, n_640, n_641, n_642, n_643 : std_logic;
  signal n_644, n_645, n_646, n_647, n_648 : std_logic;
  signal n_649, n_650, n_651, n_652, n_653 : std_logic;
  signal n_654, n_655, n_656, n_657, n_658 : std_logic;
  signal n_659, n_660, n_661, n_662, n_663 : std_logic;
  signal n_664, n_665, n_666, n_667, n_668 : std_logic;
  signal n_669, n_670, n_671, n_672, n_673 : std_logic;
  signal n_674, n_675, n_676, n_677, n_678 : std_logic;
  signal n_679, n_680, n_681, n_682, n_683 : std_logic;
  signal n_684, n_685, n_686, n_687, n_688 : std_logic;
  signal n_689, n_690, n_691, n_692, n_693 : std_logic;
  signal n_694, n_695, n_696, n_697, n_698 : std_logic;
  signal n_699, n_700, n_701, n_702, n_703 : std_logic;
  signal n_704, n_705, n_706, n_707, n_708 : std_logic;
  signal n_709, n_710, n_711, n_712, n_713 : std_logic;
  signal n_714, n_715, n_718, n_719, n_720 : std_logic;
  signal n_721, n_722, n_723, n_724, n_725 : std_logic;
  signal n_726, n_727, n_728, n_729, n_730 : std_logic;
  signal n_731, n_737, n_738, n_739, n_740 : std_logic;
  signal n_741, n_742, n_743, n_744, n_745 : std_logic;
  signal n_746, n_748, n_749, n_751, n_752 : std_logic;
  signal n_753, n_754, n_755, n_756, n_757 : std_logic;
  signal n_758, n_759, n_760, n_761, n_762 : std_logic;
  signal n_763, n_764, n_765, n_766, n_767 : std_logic;
  signal n_768, n_769, n_770, n_771, n_772 : std_logic;
  signal n_773, n_774, n_775, n_776, n_777 : std_logic;
  signal n_778, n_779, n_780, n_781, n_782 : std_logic;

begin

  g6560 : BUFFD4BWP7T port map(I => vcount(9), Z => vcount_out(9));
  g6563 : BUFFD4BWP7T port map(I => vcount(6), Z => vcount_out(6));
  g6561 : BUFFD4BWP7T port map(I => vcount(8), Z => vcount_out(8));
  g6559 : BUFFD4BWP7T port map(I => vcount(5), Z => vcount_out(5));
  g6562 : BUFFD4BWP7T port map(I => vcount(7), Z => vcount_out(7));
  g7230 : MOAI22D0BWP7T port map(A1 => vvis(6), A2 => n_731, B1 => vvis(6), B2 => n_731, ZN => n_774);
  g7231 : OAI31D0BWP7T port map(A1 => n_724, A2 => vvis(3), A3 => vvis(4), B => n_727, ZN => n_772);
  g7232 : OAI21D0BWP7T port map(A1 => hvis(5), A2 => n_730, B => n_728, ZN => n_780);
  g7233 : CKXOR2D1BWP7T port map(A1 => vvis(3), A2 => n_724, Z => n_771);
  g7234 : MOAI22D0BWP7T port map(A1 => hvis(3), A2 => n_725, B1 => hvis(3), B2 => n_725, ZN => n_778);
  g7235 : AO21D0BWP7T port map(A1 => n_45, A2 => n_727, B => n_731, Z => n_773);
  g7236 : CKXOR2D1BWP7T port map(A1 => hvis(6), A2 => n_728, Z => n_781);
  g7237 : NR2D1BWP7T port map(A1 => n_45, A2 => n_727, ZN => n_731);
  g7238 : OAI21D0BWP7T port map(A1 => hvis(4), A2 => n_726, B => n_729, ZN => n_779);
  g7239 : INVD0BWP7T port map(I => n_729, ZN => n_730);
  g7240 : CKND2D1BWP7T port map(A1 => hvis(4), A2 => n_726, ZN => n_729);
  g7241 : IND2D1BWP7T port map(A1 => n_740, B1 => n_726, ZN => n_728);
  g7242 : MOAI22D0BWP7T port map(A1 => vvis(2), A2 => n_722, B1 => vvis(2), B2 => n_722, ZN => n_770);
  g7243 : MOAI22D0BWP7T port map(A1 => hvis(2), A2 => n_723, B1 => hvis(2), B2 => n_723, ZN => n_777);
  g7244 : IOA21D1BWP7T port map(A1 => n_737, A2 => n_722, B => vvis(4), ZN => n_727);
  g7245 : IND2D1BWP7T port map(A1 => n_744, B1 => n_723, ZN => n_726);
  g7246 : INR2D1BWP7T port map(A1 => n_723, B1 => hvis(2), ZN => n_725);
  g7247 : IND2D1BWP7T port map(A1 => vvis(2), B1 => n_722, ZN => n_724);
  g7248 : FA1D0BWP7T port map(A => n_720, B => timer1_out(5), CI => n_718, CO => n_723, S => n_776);
  g7249 : MOAI22D0BWP7T port map(A1 => vvis(1), A2 => n_721, B1 => vvis(1), B2 => n_721, ZN => n_769);
  g7250 : INR2XD0BWP7T port map(A1 => n_721, B1 => vvis(1), ZN => n_722);
  g7251 : OAI21D0BWP7T port map(A1 => vvis(0), A2 => n_719, B => n_721, ZN => n_768);
  g7252 : OAI21D0BWP7T port map(A1 => hvis(0), A2 => n_719, B => n_720, ZN => n_775);
  g7253 : ND2D1BWP7T port map(A1 => hvis(4), A2 => hvis(5), ZN => n_740);
  g7254 : OR2D1BWP7T port map(A1 => hvis(3), A2 => hvis(2), Z => n_744);
  g7255 : ND2D1BWP7T port map(A1 => vvis(0), A2 => n_719, ZN => n_721);
  g7256 : AN2D0BWP7T port map(A1 => vvis(5), A2 => vvis(4), Z => n_745);
  g7257 : NR2XD0BWP7T port map(A1 => vvis(3), A2 => vvis(2), ZN => n_737);
  g7258 : ND2D1BWP7T port map(A1 => hvis(0), A2 => n_719, ZN => n_720);
  g16827 : AN2D4BWP7T port map(A1 => n_715, A2 => n_701, Z => tile_address(2));
  g16828 : AN2D4BWP7T port map(A1 => n_715, A2 => n_713, Z => tile_address(1));
  g16829 : IND4D0BWP7T port map(A1 => tile_address(3), B1 => n_340, B2 => n_701, B3 => n_714, ZN => n_715);
  g16830 : AN3D0BWP7T port map(A1 => n_694, A2 => tile_address(0), A3 => n_713, Z => n_714);
  g16831 : OR2D4BWP7T port map(A1 => n_712, A2 => n_321, Z => tile_address(3));
  g16832 : ND3D0BWP7T port map(A1 => n_711, A2 => n_670, A3 => n_498, ZN => n_713);
  g16833 : OAI211D1BWP7T port map(A1 => n_326, A2 => n_498, B => n_520, C => n_710, ZN => n_712);
  g16834 : AOI211XD0BWP7T port map(A1 => n_608, A2 => map_data(16), B => n_709, C => n_683, ZN => n_711);
  g16835 : AN4D0BWP7T port map(A1 => n_529, A2 => n_536, A3 => n_509, A4 => n_708, Z => n_710);
  g16836 : ND4D0BWP7T port map(A1 => n_707, A2 => n_655, A3 => n_638, A4 => n_520, ZN => n_709);
  g16837 : AOI31D0BWP7T port map(A1 => n_426, A2 => n_429, A3 => n_433, B => n_706, ZN => n_708);
  g16838 : AOI221D0BWP7T port map(A1 => n_609, A2 => map_data(19), B1 => n_620, B2 => map_data(7), C => n_705, ZN => n_707);
  g16839 : AO211D0BWP7T port map(A1 => n_493, A2 => score(11), B => n_463, C => n_704, Z => n_706);
  g16840 : IND4D0BWP7T port map(A1 => n_675, B1 => n_577, B2 => n_660, B3 => n_703, ZN => n_705);
  g16841 : ND4D0BWP7T port map(A1 => n_703, A2 => n_544, A3 => n_322, A4 => n_561, ZN => n_704);
  g16842 : AOI211XD0BWP7T port map(A1 => n_522, A2 => n_345, B => n_702, C => n_447, ZN => n_703);
  g16843 : AO211D0BWP7T port map(A1 => n_426, A2 => n_440, B => n_700, C => n_626, Z => n_702);
  g16844 : IND4D0BWP7T port map(A1 => n_626, B1 => n_697, B2 => n_467, B3 => n_520, ZN => n_701);
  g16845 : ND2D4BWP7T port map(A1 => n_699, A2 => n_523, ZN => tile_address(0));
  g16846 : OAI21D0BWP7T port map(A1 => n_674, A2 => n_409, B => n_698, ZN => n_700);
  g16847 : NR4D0BWP7T port map(A1 => n_693, A2 => n_684, A3 => n_692, A4 => n_547, ZN => n_699);
  g16848 : AOI22D0BWP7T port map(A1 => n_696, A2 => n_340, B1 => n_522, B2 => n_748, ZN => n_698);
  g16849 : AN4D0BWP7T port map(A1 => n_690, A2 => n_506, A3 => n_526, A4 => n_695, Z => n_697);
  g16850 : OAI222D0BWP7T port map(A1 => n_691, A2 => n_622, B1 => n_394, B2 => n_482, C1 => n_596, C2 => n_606, ZN => n_696);
  g16851 : NR4D0BWP7T port map(A1 => n_686, A2 => n_678, A3 => n_538, A4 => n_537, ZN => n_695);
  g16852 : INVD1BWP7T port map(I => tile_address(4), ZN => n_694);
  g16853 : ND4D0BWP7T port map(A1 => n_688, A2 => n_662, A3 => n_661, A4 => n_654, ZN => n_693);
  g16854 : OR4D4BWP7T port map(A1 => n_687, A2 => n_500, A3 => n_476, A4 => n_517, Z => tile_address(4));
  g16855 : AO221D0BWP7T port map(A1 => n_628, A2 => map_data(27), B1 => n_615, B2 => map_data(60), C => n_689, Z => n_692);
  g16856 : AOI211XD0BWP7T port map(A1 => n_591, A2 => n_394, B => n_682, C => n_600, ZN => n_691);
  g16857 : NR3D0BWP7T port map(A1 => n_677, A2 => n_564, A3 => n_516, ZN => n_690);
  g16858 : IOA21D1BWP7T port map(A1 => n_617, A2 => map_data(12), B => n_685, ZN => n_689);
  g16859 : AOI211XD0BWP7T port map(A1 => n_631, A2 => map_data(57), B => n_676, C => n_500, ZN => n_688);
  g16860 : OAI211D1BWP7T port map(A1 => n_402, A2 => n_496, B => n_539, C => n_681, ZN => n_687);
  g16861 : AO221D0BWP7T port map(A1 => n_608, A2 => map_data(17), B1 => n_618, B2 => map_data(5), C => n_679, Z => n_686);
  g16862 : AOI221D0BWP7T port map(A1 => n_616, A2 => map_data(45), B1 => n_621, B2 => map_data(30), C => n_680, ZN => n_685);
  g16863 : ND4D0BWP7T port map(A1 => n_673, A2 => n_525, A3 => n_543, A4 => n_533, ZN => n_684);
  g16864 : ND4D0BWP7T port map(A1 => n_666, A2 => n_656, A3 => n_647, A4 => n_637, ZN => n_683);
  g16865 : NR3D0BWP7T port map(A1 => n_671, A2 => n_603, A3 => n_587, ZN => n_682);
  g16866 : NR4D0BWP7T port map(A1 => n_560, A2 => n_461, A3 => n_645, A4 => n_521, ZN => n_681);
  g16867 : ND4D0BWP7T port map(A1 => n_640, A2 => n_641, A3 => n_527, A4 => n_498, ZN => n_680);
  g16868 : ND4D0BWP7T port map(A1 => n_663, A2 => n_642, A3 => n_643, A4 => n_646, ZN => n_679);
  g16869 : ND4D0BWP7T port map(A1 => n_664, A2 => n_672, A3 => n_665, A4 => n_644, ZN => n_678);
  g16870 : ND4D0BWP7T port map(A1 => n_668, A2 => n_667, A3 => n_649, A4 => n_669, ZN => n_677);
  g16871 : ND4D0BWP7T port map(A1 => n_657, A2 => n_659, A3 => n_658, A4 => n_639, ZN => n_676);
  g16872 : ND4D0BWP7T port map(A1 => n_653, A2 => n_652, A3 => n_651, A4 => n_650, ZN => n_675);
  g16873 : IND4D0BWP7T port map(A1 => n_600, B1 => n_601, B2 => n_605, B3 => n_624, ZN => n_674);
  g16874 : AOI211XD0BWP7T port map(A1 => n_462, A2 => level(0), B => n_648, C => n_553, ZN => n_673);
  g16875 : AOI22D0BWP7T port map(A1 => n_630, A2 => map_data(2), B1 => n_620, B2 => map_data(8), ZN => n_672);
  g16876 : OA21D0BWP7T port map(A1 => n_623, A2 => n_393, B => n_605, Z => n_671);
  g16877 : AOI211XD0BWP7T port map(A1 => n_612, A2 => map_data(34), B => n_528, C => n_481, ZN => n_670);
  g16878 : AOI22D0BWP7T port map(A1 => n_627, A2 => map_data(44), B1 => n_324, B2 => map_data(41), ZN => n_669);
  g16879 : AOI22D0BWP7T port map(A1 => n_625, A2 => map_data(23), B1 => n_633, B2 => map_data(11), ZN => n_668);
  g16880 : AOI22D0BWP7T port map(A1 => n_632, A2 => map_data(38), B1 => n_635, B2 => map_data(26), ZN => n_667);
  g16881 : AOI221D0BWP7T port map(A1 => n_610, A2 => map_data(49), B1 => n_615, B2 => map_data(61), C => n_540, ZN => n_666);
  g16882 : AOI22D0BWP7T port map(A1 => n_629, A2 => map_data(71), B1 => n_619, B2 => map_data(65), ZN => n_665);
  g16883 : AOI22D0BWP7T port map(A1 => n_634, A2 => map_data(56), B1 => n_636, B2 => map_data(68), ZN => n_664);
  g16884 : AOI22D0BWP7T port map(A1 => n_628, A2 => map_data(29), B1 => n_615, B2 => map_data(62), ZN => n_663);
  g16885 : AOI22D0BWP7T port map(A1 => n_632, A2 => map_data(36), B1 => n_625, B2 => map_data(21), ZN => n_662);
  g16886 : AOI22D0BWP7T port map(A1 => n_627, A2 => map_data(42), B1 => n_633, B2 => map_data(9), ZN => n_661);
  g16887 : AOI22D0BWP7T port map(A1 => n_629, A2 => map_data(70), B1 => n_619, B2 => map_data(64), ZN => n_660);
  g16888 : AOI22D0BWP7T port map(A1 => n_630, A2 => map_data(0), B1 => n_620, B2 => map_data(6), ZN => n_659);
  g16889 : AOI22D0BWP7T port map(A1 => n_629, A2 => map_data(69), B1 => n_619, B2 => map_data(63), ZN => n_658);
  g16890 : AOI22D0BWP7T port map(A1 => n_634, A2 => map_data(54), B1 => n_636, B2 => map_data(66), ZN => n_657);
  g16891 : AOI22D0BWP7T port map(A1 => n_628, A2 => map_data(28), B1 => n_621, B2 => map_data(31), ZN => n_656);
  g16892 : AOI22D0BWP7T port map(A1 => n_636, A2 => map_data(67), B1 => n_630, B2 => map_data(1), ZN => n_655);
  g16893 : AOI22D0BWP7T port map(A1 => n_324, A2 => map_data(39), B1 => n_635, B2 => map_data(24), ZN => n_654);
  g16894 : AOI22D0BWP7T port map(A1 => n_625, A2 => map_data(22), B1 => n_633, B2 => map_data(10), ZN => n_653);
  g16895 : AOI22D0BWP7T port map(A1 => n_634, A2 => map_data(55), B1 => n_632, B2 => map_data(37), ZN => n_652);
  g16896 : AOI22D0BWP7T port map(A1 => n_324, A2 => map_data(40), B1 => n_635, B2 => map_data(25), ZN => n_651);
  g16897 : AOI22D0BWP7T port map(A1 => n_627, A2 => map_data(43), B1 => n_631, B2 => map_data(58), ZN => n_650);
  g16898 : AOI22D0BWP7T port map(A1 => n_631, A2 => map_data(59), B1 => n_463, B2 => n_441, ZN => n_649);
  g16899 : IND4D0BWP7T port map(A1 => n_626, B1 => n_513, B2 => n_504, B3 => n_551, ZN => n_648);
  g16900 : AOI21D0BWP7T port map(A1 => n_616, A2 => map_data(46), B => n_508, ZN => n_647);
  g16901 : AOI32D1BWP7T port map(A1 => n_486, A2 => n_412, A3 => n_432, B1 => n_612, B2 => map_data(35), ZN => n_646);
  g16902 : ND4D0BWP7T port map(A1 => n_611, A2 => n_550, A3 => n_474, A4 => n_475, ZN => n_645);
  g16903 : AOI22D0BWP7T port map(A1 => n_613, A2 => map_data(53), B1 => n_609, B2 => map_data(20), ZN => n_644);
  g16904 : AOI22D0BWP7T port map(A1 => n_610, A2 => map_data(50), B1 => n_617, B2 => map_data(14), ZN => n_643);
  g16905 : AOI22D0BWP7T port map(A1 => n_616, A2 => map_data(47), B1 => n_621, B2 => map_data(32), ZN => n_642);
  g16906 : AOI22D0BWP7T port map(A1 => n_608, A2 => map_data(15), B1 => n_618, B2 => map_data(3), ZN => n_641);
  g16907 : AOI22D0BWP7T port map(A1 => n_610, A2 => map_data(48), B1 => n_612, B2 => map_data(33), ZN => n_640);
  g16908 : AOI22D0BWP7T port map(A1 => n_613, A2 => map_data(51), B1 => n_609, B2 => map_data(18), ZN => n_639);
  g16909 : AOI22D0BWP7T port map(A1 => n_613, A2 => map_data(52), B1 => n_618, B2 => map_data(4), ZN => n_638);
  g16910 : AOI22D0BWP7T port map(A1 => n_617, A2 => map_data(13), B1 => n_499, B2 => n_333, ZN => n_637);
  g16911 : ND2D4BWP7T port map(A1 => n_611, A2 => n_571, ZN => tile_address(5));
  g16912 : INR2D1BWP7T port map(A1 => n_603, B1 => n_614, ZN => n_636);
  g16913 : NR2D1BWP7T port map(A1 => n_607, A2 => n_586, ZN => n_635);
  g16914 : NR2D1BWP7T port map(A1 => n_614, A2 => n_602, ZN => n_634);
  g16915 : INR2D1BWP7T port map(A1 => n_587, B1 => n_614, ZN => n_633);
  g16916 : NR2D1BWP7T port map(A1 => n_614, A2 => n_597, ZN => n_632);
  g16917 : NR2D1BWP7T port map(A1 => n_607, A2 => n_602, ZN => n_631);
  g16919 : NR4D0BWP7T port map(A1 => n_594, A2 => n_588, A3 => n_591, A4 => n_592, ZN => n_624);
  g16920 : AOI211XD0BWP7T port map(A1 => n_589, A2 => n_582, B => n_588, C => n_362, ZN => n_623);
  g16921 : ND3D0BWP7T port map(A1 => n_602, A2 => n_597, A3 => n_586, ZN => n_622);
  g16922 : NR3D0BWP7T port map(A1 => n_598, A2 => n_582, A3 => n_362, ZN => n_630);
  g16923 : NR3D0BWP7T port map(A1 => n_598, A2 => n_589, A3 => n_362, ZN => n_629);
  g16924 : NR3D0BWP7T port map(A1 => n_597, A2 => n_593, A3 => n_409, ZN => n_628);
  g16925 : NR3D0BWP7T port map(A1 => n_597, A2 => n_601, A3 => n_341, ZN => n_627);
  g16926 : OAI31D0BWP7T port map(A1 => n_354, A2 => n_471, A3 => n_427, B => n_611, ZN => n_626);
  g16927 : NR2D1BWP7T port map(A1 => n_614, A2 => n_586, ZN => n_625);
  g16928 : NR2D1BWP7T port map(A1 => n_604, A2 => n_597, ZN => n_621);
  g16929 : INR2D1BWP7T port map(A1 => n_587, B1 => n_598, ZN => n_620);
  g16930 : INR2D1BWP7T port map(A1 => n_603, B1 => n_598, ZN => n_619);
  g16931 : INR2D1BWP7T port map(A1 => n_587, B1 => n_599, ZN => n_618);
  g16932 : NR2D1BWP7T port map(A1 => n_604, A2 => n_586, ZN => n_617);
  g16933 : NR2D0BWP7T port map(A1 => n_604, A2 => n_602, ZN => n_616);
  g16934 : INR2D1BWP7T port map(A1 => n_603, B1 => n_599, ZN => n_615);
  g16935 : OR2D1BWP7T port map(A1 => n_605, A2 => n_341, Z => n_614);
  g16937 : OA21D0BWP7T port map(A1 => n_593, A2 => n_393, B => n_601, Z => n_606);
  g16938 : NR2D0BWP7T port map(A1 => n_598, A2 => n_602, ZN => n_613);
  g16939 : NR2D1BWP7T port map(A1 => n_599, A2 => n_597, ZN => n_612);
  g16940 : IND2D1BWP7T port map(A1 => n_598, B1 => n_596, ZN => n_611);
  g16941 : NR2D1BWP7T port map(A1 => n_599, A2 => n_602, ZN => n_610);
  g16942 : NR2D1BWP7T port map(A1 => n_598, A2 => n_586, ZN => n_609);
  g16943 : NR2D1BWP7T port map(A1 => n_599, A2 => n_586, ZN => n_608);
  g16944 : ND2D1BWP7T port map(A1 => n_600, A2 => n_340, ZN => n_607);
  g16945 : OR2D1BWP7T port map(A1 => n_590, A2 => n_451, Z => n_605);
  g16946 : ND2D1BWP7T port map(A1 => n_591, A2 => n_410, ZN => n_604);
  g16947 : INR2XD0BWP7T port map(A1 => n_362, B1 => n_589, ZN => n_603);
  g16948 : IND2D1BWP7T port map(A1 => n_362, B1 => n_595, ZN => n_602);
  g16949 : INVD0BWP7T port map(I => n_597, ZN => n_596);
  g16950 : IND2D1BWP7T port map(A1 => n_590, B1 => n_451, ZN => n_601);
  g16951 : NR3D0BWP7T port map(A1 => n_581, A2 => n_451, A3 => n_363, ZN => n_600);
  g16952 : ND2D1BWP7T port map(A1 => n_588, A2 => n_410, ZN => n_599);
  g16953 : ND2D1BWP7T port map(A1 => n_594, A2 => n_410, ZN => n_598);
  g16954 : ND2D1BWP7T port map(A1 => n_595, A2 => n_362, ZN => n_597);
  g16955 : CKND1BWP7T port map(I => n_592, ZN => n_593);
  g16956 : NR2XD0BWP7T port map(A1 => n_580, A2 => n_456, ZN => n_595);
  g16957 : INR2D1BWP7T port map(A1 => n_451, B1 => n_585, ZN => n_594);
  g16958 : NR2D1BWP7T port map(A1 => n_584, A2 => n_451, ZN => n_592);
  g16959 : NR2D1BWP7T port map(A1 => n_585, A2 => n_451, ZN => n_591);
  g16960 : IND2D1BWP7T port map(A1 => n_581, B1 => n_363, ZN => n_590);
  g16961 : IND2D1BWP7T port map(A1 => n_580, B1 => n_456, ZN => n_589);
  g16962 : INR2D1BWP7T port map(A1 => n_451, B1 => n_584, ZN => n_588);
  g16963 : INR2XD0BWP7T port map(A1 => n_362, B1 => n_583, ZN => n_587);
  g16964 : OR2D1BWP7T port map(A1 => n_583, A2 => n_362, Z => n_586);
  g16965 : IND2D1BWP7T port map(A1 => n_363, B1 => n_578, ZN => n_585);
  g16966 : ND2D1BWP7T port map(A1 => n_578, A2 => n_363, ZN => n_584);
  g16967 : ND2D1BWP7T port map(A1 => n_579, A2 => n_456, ZN => n_583);
  g16968 : IND2D1BWP7T port map(A1 => n_456, B1 => n_579, ZN => n_582);
  g16969 : ND4D0BWP7T port map(A1 => n_563, A2 => n_572, A3 => n_353, A4 => n_332, ZN => n_581);
  g16970 : ND3D0BWP7T port map(A1 => n_576, A2 => n_559, A3 => n_546, ZN => n_580);
  g16971 : NR4D0BWP7T port map(A1 => n_559, A2 => n_558, A3 => n_546, A4 => yposition(4), ZN => n_579);
  g16972 : OR2D4BWP7T port map(A1 => dim(2), A2 => n_566, Z => dim(1));
  g16973 : AOI211D1BWP7T port map(A1 => n_28, A2 => xplayer(3), B => n_563, C => n_572, ZN => n_578);
  g16974 : AOI211XD0BWP7T port map(A1 => n_462, A2 => level(1), B => n_570, C => n_323, ZN => n_577);
  g16975 : AN2D4BWP7T port map(A1 => n_575, A2 => n_410, Z => dim(3));
  g16976 : AOI22D0BWP7T port map(A1 => n_558, A2 => yposition(4), B1 => n_545, B2 => n_346, ZN => n_576);
  g16977 : ND2D4BWP7T port map(A1 => n_573, A2 => n_574, ZN => dim(2));
  g16978 : ND2D1BWP7T port map(A1 => n_555, A2 => n_569, ZN => n_575);
  g16979 : OR2D1BWP7T port map(A1 => n_569, A2 => n_409, Z => n_574);
  g16980 : ND2D1BWP7T port map(A1 => n_565, A2 => n_555, ZN => n_573);
  g16981 : OA211D0BWP7T port map(A1 => n_422, A2 => n_459, B => n_568, C => n_523, Z => n_571);
  g16982 : OAI211D1BWP7T port map(A1 => n_386, A2 => n_519, B => n_567, C => n_515, ZN => n_570);
  g16983 : MAOI22D0BWP7T port map(A1 => n_562, A2 => n_367, B1 => n_562, B2 => n_367, ZN => n_572);
  g16984 : AOI31D0BWP7T port map(A1 => n_466, A2 => n_344, A3 => frame_count(3), B => n_556, ZN => n_568);
  g16985 : AOI21D0BWP7T port map(A1 => n_524, A2 => n_418, B => n_557, ZN => n_567);
  g16986 : AOI21D0BWP7T port map(A1 => n_766, A2 => n_554, B => n_767, ZN => n_569);
  g16987 : OAI22D0BWP7T port map(A1 => n_555, A2 => n_409, B1 => n_457, B2 => n_480, ZN => n_566);
  g16988 : OAI32D1BWP7T port map(A1 => n_330, A2 => n_542, A3 => n_457, B1 => n_409, B2 => n_347, ZN => n_565);
  g16989 : ND4D0BWP7T port map(A1 => n_548, A2 => n_530, A3 => n_534, A4 => n_505, ZN => n_564);
  g16990 : FA1D0BWP7T port map(A => xposition(2), B => n_81, CI => n_442, CO => n_562, S => n_563);
  g16991 : ND2D4BWP7T port map(A1 => n_552, A2 => n_457, ZN => dim(0));
  g16992 : AOI221D0BWP7T port map(A1 => n_462, A2 => level(3), B1 => n_464, B2 => level(7), C => n_549, ZN => n_561);
  g16993 : OAI32D1BWP7T port map(A1 => n_414, A2 => n_477, A3 => n_519, B1 => n_426, B2 => n_501, ZN => n_560);
  g16994 : ND4D0BWP7T port map(A1 => n_531, A2 => n_532, A3 => n_507, A4 => n_510, ZN => n_557);
  g16995 : OAI22D0BWP7T port map(A1 => n_535, A2 => n_373, B1 => n_411, B2 => n_432, ZN => n_556);
  g16996 : MAOI22D0BWP7T port map(A1 => n_545, A2 => n_368, B1 => n_545, B2 => n_368, ZN => n_559);
  g16997 : MAOI222D1BWP7T port map(A => n_545, B => n_80, C => yplayer(3), ZN => n_558);
  g16998 : AO211D0BWP7T port map(A1 => n_488, A2 => n_763, B => n_765, C => n_764, Z => n_554);
  g16999 : NR2D0BWP7T port map(A1 => n_544, A2 => n_396, ZN => n_553);
  g17000 : IOA21D1BWP7T port map(A1 => n_347, A2 => n_514, B => n_410, ZN => n_552);
  g17001 : AO21D0BWP7T port map(A1 => n_330, A2 => n_518, B => n_347, Z => n_555);
  g17002 : AOI221D0BWP7T port map(A1 => n_478, A2 => n_345, B1 => n_464, B2 => level(4), C => n_472, ZN => n_551);
  g17003 : AOI222D0BWP7T port map(A1 => n_485, A2 => n_460, B1 => n_458, B2 => n_413, C1 => n_415, C2 => n_383, ZN => n_550);
  g17004 : OAI211D1BWP7T port map(A1 => n_408, A2 => n_459, B => n_473, C => n_541, ZN => n_549);
  g17005 : MAOI22D0BWP7T port map(A1 => n_494, A2 => score(14), B1 => n_519, B2 => n_385, ZN => n_548);
  g17006 : OAI22D0BWP7T port map(A1 => n_512, A2 => n_411, B1 => n_459, B2 => n_479, ZN => n_547);
  g17007 : FA1D0BWP7T port map(A => n_24, B => yplayer(2), CI => n_443, CO => n_545, S => n_546);
  g17008 : AOI22D0BWP7T port map(A1 => n_493, A2 => score(8), B1 => n_492, B2 => score(4), ZN => n_543);
  g17009 : AOI211D1BWP7T port map(A1 => n_448, A2 => n_759, B => n_762, C => n_761, ZN => n_542);
  g17010 : IAO21D0BWP7T port map(A1 => n_496, A2 => n_381, B => n_521, ZN => n_541);
  g17011 : AOI21D0BWP7T port map(A1 => n_486, A2 => n_468, B => n_411, ZN => n_540);
  g17012 : OAI21D0BWP7T port map(A1 => n_502, A2 => n_437, B => n_412, ZN => n_539);
  g17013 : OAI22D0BWP7T port map(A1 => n_489, A2 => n_380, B1 => n_459, B2 => n_444, ZN => n_538);
  g17014 : OAI22D0BWP7T port map(A1 => n_465, A2 => n_753, B1 => n_503, B2 => n_782, ZN => n_537);
  g17015 : AOI22D0BWP7T port map(A1 => n_492, A2 => score(7), B1 => n_494, B2 => score(15), ZN => n_536);
  g17016 : AOI31D0BWP7T port map(A1 => n_395, A2 => n_394, A3 => n_398, B => n_511, ZN => n_535);
  g17017 : CKAN2D1BWP7T port map(A1 => n_519, A2 => n_484, Z => n_544);
  g17018 : AOI22D0BWP7T port map(A1 => n_497, A2 => score(2), B1 => n_454, B2 => energy(10), ZN => n_534);
  g17019 : AOI22D0BWP7T port map(A1 => n_497, A2 => score(0), B1 => n_454, B2 => energy(8), ZN => n_533);
  g17020 : AOI22D0BWP7T port map(A1 => n_493, A2 => score(9), B1 => n_494, B2 => score(13), ZN => n_532);
  g17021 : AOI22D0BWP7T port map(A1 => n_497, A2 => score(1), B1 => n_492, B2 => score(5), ZN => n_531);
  g17022 : AOI22D0BWP7T port map(A1 => n_493, A2 => score(10), B1 => n_492, B2 => score(6), ZN => n_530);
  g17023 : AOI22D0BWP7T port map(A1 => n_497, A2 => score(3), B1 => n_454, B2 => energy(11), ZN => n_529);
  g17024 : OAI22D0BWP7T port map(A1 => n_452, A2 => n_450, B1 => n_496, B2 => n_445, ZN => n_528);
  g17025 : AOI22D0BWP7T port map(A1 => n_495, A2 => n_402, B1 => n_453, B2 => n_405, ZN => n_527);
  g17026 : AOI22D0BWP7T port map(A1 => n_487, A2 => n_372, B1 => n_433, B2 => n_397, ZN => n_526);
  g17027 : AOI22D0BWP7T port map(A1 => n_483, A2 => n_414, B1 => n_494, B2 => score(12), ZN => n_525);
  g17028 : MOAI22D0BWP7T port map(A1 => n_484, A2 => n_386, B1 => n_463, B2 => n_396, ZN => n_524);
  g17029 : OAI211D1BWP7T port map(A1 => n_759, A2 => n_425, B => n_762, C => n_388, ZN => n_518);
  g17030 : AOI21D0BWP7T port map(A1 => n_426, A2 => n_432, B => n_484, ZN => n_517);
  g17031 : OA211D0BWP7T port map(A1 => n_441, A2 => n_427, B => n_483, C => n_432, Z => n_516);
  g17032 : AO21D0BWP7T port map(A1 => n_467, A2 => n_322, B => n_427, Z => n_515);
  g17034 : IND3D1BWP7T port map(A1 => n_446, B1 => n_763, B2 => n_765, ZN => n_514);
  g17035 : IND2D1BWP7T port map(A1 => n_746, B1 => n_499, ZN => n_523);
  g17036 : OR2D1BWP7T port map(A1 => n_487, A2 => n_393, Z => n_522);
  g17037 : NR2D0BWP7T port map(A1 => n_503, A2 => n_355, ZN => n_521);
  g17038 : OR2D1BWP7T port map(A1 => n_501, A2 => n_427, Z => n_520);
  g17039 : IND2D1BWP7T port map(A1 => n_485, B1 => n_460, ZN => n_519);
  g17040 : AOI22D0BWP7T port map(A1 => n_461, A2 => energy(0), B1 => n_455, B2 => energy(4), ZN => n_513);
  g17041 : IAO21D0BWP7T port map(A1 => n_396, A2 => n_327, B => n_502, ZN => n_512);
  g17042 : OAI32D0BWP7T port map(A1 => n_398, A2 => n_437, A3 => n_428, B1 => n_387, B2 => n_395, ZN => n_511);
  g17043 : AOI22D0BWP7T port map(A1 => n_454, A2 => energy(9), B1 => n_455, B2 => energy(5), ZN => n_510);
  g17044 : AOI22D0BWP7T port map(A1 => n_461, A2 => energy(3), B1 => n_455, B2 => energy(7), ZN => n_509);
  g17045 : OA31D1BWP7T port map(A1 => n_328, A2 => n_356, A3 => n_422, B => n_466, Z => n_508);
  g17046 : AOI22D0BWP7T port map(A1 => n_464, A2 => level(5), B1 => n_461, B2 => energy(1), ZN => n_507);
  g17047 : OR2D4BWP7T port map(A1 => n_490, A2 => n_491, Z => animation_done);
  g17048 : AOI22D0BWP7T port map(A1 => n_462, A2 => level(2), B1 => n_464, B2 => level(6), ZN => n_506);
  g17049 : AOI22D0BWP7T port map(A1 => n_461, A2 => energy(2), B1 => n_455, B2 => energy(6), ZN => n_505);
  g17050 : AOI22D0BWP7T port map(A1 => n_470, A2 => n_433, B1 => n_421, B2 => n_372, ZN => n_504);
  g17051 : INVD0BWP7T port map(I => n_496, ZN => n_495);
  g17052 : INR2XD0BWP7T port map(A1 => n_749, B1 => n_753, ZN => n_491);
  g17053 : NR2XD0BWP7T port map(A1 => n_751, A2 => n_354, ZN => n_490);
  g17054 : NR2XD0BWP7T port map(A1 => n_453, A2 => n_469, ZN => n_489);
  g17055 : OA21D0BWP7T port map(A1 => n_388, A2 => n_406, B => n_762, Z => n_488);
  g17056 : IND2D1BWP7T port map(A1 => n_459, B1 => n_356, ZN => n_503);
  g17057 : ND2D1BWP7T port map(A1 => n_468, A2 => n_431, ZN => n_502);
  g17058 : IND2D1BWP7T port map(A1 => n_471, B1 => n_345, ZN => n_501);
  g17059 : INR2D1BWP7T port map(A1 => n_463, B1 => n_418, ZN => n_500);
  g17060 : NR2D1BWP7T port map(A1 => n_465, A2 => frame_count(3), ZN => n_499);
  g17061 : ND2D1BWP7T port map(A1 => n_453, A2 => frame_count(3), ZN => n_498);
  g17062 : AN2D1BWP7T port map(A1 => n_460, A2 => n_436, Z => n_497);
  g17063 : CKND2D1BWP7T port map(A1 => n_469, A2 => n_427, ZN => n_496);
  g17064 : INR2D1BWP7T port map(A1 => n_460, B1 => n_431, ZN => n_494);
  g17065 : INR2D1BWP7T port map(A1 => n_460, B1 => n_429, ZN => n_493);
  g17066 : INR2D1BWP7T port map(A1 => n_460, B1 => n_434, ZN => n_492);
  g17067 : INVD0BWP7T port map(I => n_484, ZN => n_483);
  g17068 : ND3D0BWP7T port map(A1 => n_423, A2 => n_391, A3 => n_400, ZN => n_482);
  g17069 : NR2D0BWP7T port map(A1 => n_459, A2 => n_449, ZN => n_481);
  g17070 : AOI211D1BWP7T port map(A1 => n_761, A2 => n_392, B => n_438, C => n_763, ZN => n_480);
  g17071 : OA21D0BWP7T port map(A1 => frame_count(3), A2 => frame_count(0), B => n_753, Z => n_479);
  g17072 : OAI21D0BWP7T port map(A1 => n_427, A2 => n_419, B => n_389, ZN => n_478);
  g17073 : AOI211D1BWP7T port map(A1 => n_396, A2 => n_371, B => n_387, C => n_386, ZN => n_477);
  g17075 : AOI21D0BWP7T port map(A1 => n_426, A2 => n_418, B => n_416, ZN => n_476);
  g17076 : OAI21D0BWP7T port map(A1 => n_435, A2 => n_325, B => n_453, ZN => n_475);
  g17077 : OAI21D0BWP7T port map(A1 => n_414, A2 => n_430, B => n_433, ZN => n_474);
  g17078 : OAI21D0BWP7T port map(A1 => n_417, A2 => n_412, B => n_432, ZN => n_473);
  g17079 : IAO21D0BWP7T port map(A1 => n_427, A2 => n_387, B => n_416, ZN => n_472);
  g17080 : OAI211D1BWP7T port map(A1 => n_357, A2 => n_364, B => n_420, C => n_407, ZN => n_487);
  g17081 : ND3D0BWP7T port map(A1 => n_429, A2 => n_431, A3 => n_370, ZN => n_486);
  g17082 : ND3D0BWP7T port map(A1 => n_429, A2 => n_431, A3 => n_384, ZN => n_485);
  g17083 : ND3D0BWP7T port map(A1 => n_429, A2 => n_413, A3 => n_384, ZN => n_484);
  g17084 : CKND1BWP7T port map(I => n_466, ZN => n_465);
  g17085 : ND2D0BWP7T port map(A1 => n_434, A2 => n_429, ZN => n_458);
  g17086 : CKAN2D1BWP7T port map(A1 => n_419, A2 => n_389, Z => n_471);
  g17087 : ND2D0BWP7T port map(A1 => n_426, A2 => n_431, ZN => n_470);
  g17088 : ND2D0BWP7T port map(A1 => n_435, A2 => frame_count(3), ZN => n_751);
  g17089 : NR2D1BWP7T port map(A1 => n_419, A2 => n_354, ZN => n_469);
  g17090 : CKAN2D1BWP7T port map(A1 => n_434, A2 => n_418, Z => n_468);
  g17091 : IND2D1BWP7T port map(A1 => n_414, B1 => n_417, ZN => n_467);
  g17092 : ND2D0BWP7T port map(A1 => n_439, A2 => frame_count(3), ZN => n_753);
  g17093 : NR2D1BWP7T port map(A1 => n_426, A2 => n_322, ZN => n_466);
  g17094 : INR2D1BWP7T port map(A1 => n_415, B1 => n_434, ZN => n_464);
  g17095 : AN2D1BWP7T port map(A1 => n_415, A2 => n_384, Z => n_463);
  g17096 : AN2D1BWP7T port map(A1 => n_436, A2 => n_415, Z => n_462);
  g17097 : AN2D1BWP7T port map(A1 => n_436, A2 => n_413, Z => n_461);
  g17098 : NR2D1BWP7T port map(A1 => n_423, A2 => n_341, ZN => n_460);
  g17099 : ND2D1BWP7T port map(A1 => n_427, A2 => n_440, ZN => n_459);
  g17100 : INVD0BWP7T port map(I => n_453, ZN => n_452);
  g17101 : IAO21D0BWP7T port map(A1 => n_344, A2 => frame_count(0), B => n_439, ZN => n_450);
  g17102 : NR3D0BWP7T port map(A1 => n_752, A2 => n_344, A3 => frame_count(3), ZN => n_449);
  g17103 : ND2D4BWP7T port map(A1 => n_424, A2 => n_404, ZN => bg_select(0));
  g17104 : AN3D1BWP7T port map(A1 => n_760, A2 => n_758, A3 => n_401, Z => n_448);
  g17105 : OA211D0BWP7T port map(A1 => n_334, A2 => n_364, B => n_395, C => n_749, Z => n_447);
  g17106 : AOI31D0BWP7T port map(A1 => n_761, A2 => n_757, A3 => n_375, B => n_438, ZN => n_446);
  g17107 : AOI21D0BWP7T port map(A1 => n_349, A2 => frame_count(2), B => frame_count(3), ZN => n_445);
  g17108 : AOI21D0BWP7T port map(A1 => n_374, A2 => frame_count(2), B => n_435, ZN => n_444);
  g17109 : AOI21D0BWP7T port map(A1 => n_358, A2 => n_742, B => n_743, ZN => n_443);
  g17110 : OAI21D0BWP7T port map(A1 => n_350, A2 => n_739, B => n_741, ZN => n_442);
  g17111 : ND3D0BWP7T port map(A1 => n_765, A2 => n_764, A3 => n_410, ZN => n_457);
  g17112 : MOAI22D0BWP7T port map(A1 => n_369, A2 => n_358, B1 => n_369, B2 => n_358, ZN => n_456);
  g17113 : INR2D1BWP7T port map(A1 => n_413, B1 => n_434, ZN => n_455);
  g17114 : INR2D1BWP7T port map(A1 => n_413, B1 => n_429, ZN => n_454);
  g17115 : NR3D0BWP7T port map(A1 => n_426, A2 => n_389, A3 => n_354, ZN => n_453);
  g17116 : AOI22D0BWP7T port map(A1 => n_382, A2 => xplayer(0), B1 => n_361, B2 => n_403, ZN => n_451);
  g17118 : INVD0BWP7T port map(I => n_431, ZN => n_430);
  g17119 : INVD0BWP7T port map(I => n_429, ZN => n_428);
  g17120 : INVD1BWP7T port map(I => n_427, ZN => n_426);
  g17121 : OR2D1BWP7T port map(A1 => n_760, A2 => n_401, Z => n_425);
  g17122 : IND2D1BWP7T port map(A1 => level_abs(0), B1 => bg_select(2), ZN => n_424);
  g17123 : ND2D1BWP7T port map(A1 => n_385, A2 => n_370, ZN => n_441);
  g17124 : NR2D1BWP7T port map(A1 => n_390, A2 => n_343, ZN => n_440);
  g17125 : NR2D0BWP7T port map(A1 => n_349, A2 => frame_count(2), ZN => n_439);
  g17126 : OR2D1BWP7T port map(A1 => n_762, A2 => n_388, Z => n_438);
  g17127 : NR2XD0BWP7T port map(A1 => n_397, A2 => yposition(0), ZN => n_437);
  g17129 : NR2D1BWP7T port map(A1 => n_384, A2 => yposition(0), ZN => n_436);
  g17130 : INR2D0BWP7T port map(A1 => n_344, B1 => frame_count(0), ZN => n_435);
  g17131 : ND2D1BWP7T port map(A1 => n_383, A2 => yposition(0), ZN => n_434);
  g17132 : NR2D1BWP7T port map(A1 => n_398, A2 => n_373, ZN => n_433);
  g17133 : ND2D1BWP7T port map(A1 => n_387, A2 => yposition(0), ZN => n_432);
  g17134 : ND2D1BWP7T port map(A1 => n_399, A2 => yposition(0), ZN => n_431);
  g17135 : ND2D1BWP7T port map(A1 => n_399, A2 => n_331, ZN => n_429);
  g17136 : NR2D1BWP7T port map(A1 => n_397, A2 => n_331, ZN => n_427);
  g17137 : INVD0BWP7T port map(I => n_420, ZN => n_421);
  g17138 : CKND1BWP7T port map(I => n_417, ZN => n_416);
  g17139 : INVD0BWP7T port map(I => n_412, ZN => n_411);
  g17140 : INVD1BWP7T port map(I => n_410, ZN => n_409);
  g17141 : MAOI22D0BWP7T port map(A1 => n_355, A2 => frame_count(3), B1 => n_374, B2 => n_326, ZN => n_408);
  g17142 : AOI32D1BWP7T port map(A1 => n_359, A2 => n_343, A3 => n_332, B1 => n_365, B2 => n_357, ZN => n_407);
  g17143 : AN3D0BWP7T port map(A1 => n_761, A2 => n_757, A3 => n_376, Z => n_406);
  g17144 : OAI221D0BWP7T port map(A1 => n_326, A2 => frame_count(1), B1 => n_333, B2 => frame_count(2), C => frame_count(0), ZN => n_405);
  g17145 : IOA21D1BWP7T port map(A1 => n_366, A2 => level_abs(1), B => level_abs(0), ZN => n_404);
  g17146 : ND4D0BWP7T port map(A1 => n_359, A2 => n_334, A3 => xposition(0), A4 => xposition(4), ZN => n_423);
  g17147 : NR2D0BWP7T port map(A1 => n_344, A2 => n_325, ZN => n_422);
  g17148 : AOI32D1BWP7T port map(A1 => n_352, A2 => n_343, A3 => n_332, B1 => n_365, B2 => n_342, ZN => n_420);
  g17149 : ND3D0BWP7T port map(A1 => n_365, A2 => n_334, A3 => xposition(0), ZN => n_419);
  g17150 : ND3D0BWP7T port map(A1 => n_371, A2 => n_331, A3 => yposition(1), ZN => n_418);
  g17151 : NR2D1BWP7T port map(A1 => n_395, A2 => n_373, ZN => n_417);
  g17152 : NR2D1BWP7T port map(A1 => n_391, A2 => n_341, ZN => n_415);
  g17153 : AN2D1BWP7T port map(A1 => n_387, A2 => n_331, Z => n_414);
  g17154 : NR2D1BWP7T port map(A1 => n_400, A2 => n_341, ZN => n_413);
  g17155 : INR2D1BWP7T port map(A1 => n_749, B1 => n_395, ZN => n_412);
  g17156 : NR2D1BWP7T port map(A1 => n_393, A2 => n_341, ZN => n_410);
  g17157 : INVD0BWP7T port map(I => n_350, ZN => n_403);
  g17158 : INVD1BWP7T port map(I => n_394, ZN => n_393);
  g17159 : OR2D1BWP7T port map(A1 => n_757, A2 => n_376, Z => n_392);
  g17160 : ND2D4BWP7T port map(A1 => n_366, A2 => n_338, ZN => bg_select(1));
  g17161 : NR2D0BWP7T port map(A1 => n_374, A2 => n_356, ZN => n_402);
  g17162 : OR2D1BWP7T port map(A1 => n_757, A2 => n_375, Z => n_401);
  g17163 : ND2D1BWP7T port map(A1 => n_379, A2 => n_332, ZN => n_400);
  g17164 : NR2XD0BWP7T port map(A1 => n_378, A2 => yposition(1), ZN => n_399);
  g17165 : IND2D1BWP7T port map(A1 => n_364, B1 => n_357, ZN => n_398);
  g17166 : OR2D1BWP7T port map(A1 => n_378, A2 => n_327, Z => n_397);
  g17167 : ND2D1BWP7T port map(A1 => n_371, A2 => yposition(0), ZN => n_396);
  g17168 : ND2D1BWP7T port map(A1 => n_377, A2 => n_332, ZN => n_395);
  g17169 : NR2D1BWP7T port map(A1 => n_379, A2 => xposition(4), ZN => n_394);
  g17171 : INVD0BWP7T port map(I => n_386, ZN => n_385);
  g17172 : INVD1BWP7T port map(I => n_384, ZN => n_383);
  g17173 : AO31D1BWP7T port map(A1 => n_738, A2 => vcount(5), A3 => vcount(8), B => vcount(9), Z => vga_done_out);
  g17174 : CKMUX2D1BWP7T port map(I0 => n_357, I1 => n_348, S => xplayer(1), Z => n_382);
  g17175 : AOI21D0BWP7T port map(A1 => n_355, A2 => frame_count(2), B => frame_count(3), ZN => n_381);
  g17176 : OA21D0BWP7T port map(A1 => n_355, A2 => n_326, B => n_374, Z => n_380);
  g17177 : ND2D4BWP7T port map(A1 => n_366, A2 => n_339, ZN => bg_select(2));
  g17178 : ND2D1BWP7T port map(A1 => n_377, A2 => xposition(4), ZN => n_391);
  g17179 : IND2D1BWP7T port map(A1 => n_364, B1 => n_749, ZN => n_390);
  g17180 : ND2D1BWP7T port map(A1 => n_365, A2 => n_348, ZN => n_389);
  g17181 : OA31D1BWP7T port map(A1 => n_758, A2 => n_759, A3 => n_760, B => n_761, Z => n_388);
  g17182 : NR2D1BWP7T port map(A1 => n_370, A2 => yposition(1), ZN => n_387);
  g17183 : NR3D0BWP7T port map(A1 => n_360, A2 => yposition(1), A3 => yposition(0), ZN => n_386);
  g17184 : ND3D0BWP7T port map(A1 => n_346, A2 => n_24, A3 => yposition(1), ZN => n_384);
  g17185 : INVD0BWP7T port map(I => n_373, ZN => n_372);
  g17186 : INVD1BWP7T port map(I => n_371, ZN => n_370);
  g17187 : IND2D0BWP7T port map(A1 => n_782, B1 => frame_count(2), ZN => n_746);
  g17188 : CKAN2D1BWP7T port map(A1 => n_352, A2 => n_342, Z => n_379);
  g17189 : ND2D1BWP7T port map(A1 => n_346, A2 => yposition(2), ZN => n_378);
  g17190 : CKAN2D1BWP7T port map(A1 => n_359, A2 => n_342, Z => n_377);
  g17191 : IND2D1BWP7T port map(A1 => n_756, B1 => n_351, ZN => n_376);
  g17192 : INR2XD0BWP7T port map(A1 => n_756, B1 => n_351, ZN => n_375);
  g17193 : INR2D0BWP7T port map(A1 => n_782, B1 => frame_count(3), ZN => n_374);
  g17194 : NR2XD0BWP7T port map(A1 => n_748, A2 => n_345, ZN => n_373);
  g17195 : NR2D1BWP7T port map(A1 => n_360, A2 => yposition(2), ZN => n_371);
  g17196 : IND2D1BWP7T port map(A1 => n_739, B1 => n_741, ZN => n_361);
  g17197 : MAOI22D0BWP7T port map(A1 => yposition(1), A2 => yplayer(1), B1 => yposition(1), B2 => yplayer(1), ZN => n_369);
  g17198 : OAI21D0BWP7T port map(A1 => n_333, A2 => frame_count(0), B => n_349, ZN => n_752);
  g17199 : MOAI22D0BWP7T port map(A1 => yposition(3), A2 => yplayer(3), B1 => yposition(3), B2 => yplayer(3), ZN => n_368);
  g17200 : MOAI22D0BWP7T port map(A1 => xposition(3), A2 => xplayer(3), B1 => xposition(3), B2 => xplayer(3), ZN => n_367);
  g17201 : NR3D0BWP7T port map(A1 => level_abs(3), A2 => level_abs(4), A3 => level_abs(2), ZN => n_366);
  g17202 : NR3D0BWP7T port map(A1 => n_28, A2 => xposition(2), A3 => xposition(4), ZN => n_365);
  g17203 : ND3D0BWP7T port map(A1 => n_28, A2 => n_332, A3 => xposition(2), ZN => n_364);
  g17204 : MAOI22D0BWP7T port map(A1 => xposition(0), A2 => xplayer(0), B1 => xposition(0), B2 => xplayer(0), ZN => n_363);
  g17205 : MOAI22D0BWP7T port map(A1 => yposition(0), A2 => yplayer(0), B1 => yposition(0), B2 => yplayer(0), ZN => n_362);
  g17207 : INVD1BWP7T port map(I => n_354, ZN => n_748);
  g17208 : IND2D0BWP7T port map(A1 => xplayer(3), B1 => xposition(3), ZN => n_353);
  g17209 : AN2D1BWP7T port map(A1 => vcount(6), A2 => vcount(7), Z => n_738);
  g17210 : IND2D1BWP7T port map(A1 => yposition(4), B1 => yposition(3), ZN => n_360);
  g17211 : NR2D1BWP7T port map(A1 => n_327, A2 => yplayer(1), ZN => n_743);
  g17212 : INR2D1BWP7T port map(A1 => xplayer(1), B1 => xposition(1), ZN => n_739);
  g17213 : NR2XD0BWP7T port map(A1 => xposition(2), A2 => xposition(3), ZN => n_359);
  g17214 : ND2D1BWP7T port map(A1 => n_331, A2 => yplayer(0), ZN => n_358);
  g17215 : IND2D1BWP7T port map(A1 => xplayer(1), B1 => xposition(1), ZN => n_741);
  g17216 : ND2D0BWP7T port map(A1 => frame_count(0), A2 => frame_count(1), ZN => n_782);
  g17217 : NR2XD0BWP7T port map(A1 => xposition(0), A2 => xposition(1), ZN => n_357);
  g17218 : NR2D0BWP7T port map(A1 => frame_count(2), A2 => frame_count(3), ZN => n_356);
  g17219 : ND2D0BWP7T port map(A1 => n_328, A2 => n_333, ZN => n_355);
  g17220 : CKND2D1BWP7T port map(A1 => game_state(1), A2 => game_state(0), ZN => n_354);
  g17221 : INVD1BWP7T port map(I => n_343, ZN => n_342);
  g17222 : INVD0BWP7T port map(I => n_341, ZN => n_340);
  g17223 : CKAN2D1BWP7T port map(A1 => xposition(3), A2 => xposition(2), Z => n_352);
  g17224 : ND2D1BWP7T port map(A1 => n_327, A2 => yplayer(1), ZN => n_742);
  g17225 : NR2XD0BWP7T port map(A1 => n_754, A2 => n_755, ZN => n_351);
  g17226 : INR2D1BWP7T port map(A1 => xplayer(0), B1 => xposition(0), ZN => n_350);
  g17227 : ND2D0BWP7T port map(A1 => n_333, A2 => frame_count(0), ZN => n_349);
  g17228 : NR2D1BWP7T port map(A1 => n_334, A2 => xposition(0), ZN => n_348);
  g17229 : NR2XD0BWP7T port map(A1 => n_767, A2 => n_766, ZN => n_347);
  g17230 : NR2D1BWP7T port map(A1 => yposition(3), A2 => yposition(4), ZN => n_346);
  g17231 : NR2D0BWP7T port map(A1 => game_state(0), A2 => game_state(1), ZN => n_345);
  g17232 : INR2D1BWP7T port map(A1 => game_state(1), B1 => game_state(0), ZN => n_749);
  g17233 : NR2D0BWP7T port map(A1 => frame_count(2), A2 => frame_count(1), ZN => n_344);
  g17234 : ND2D1BWP7T port map(A1 => xposition(0), A2 => xposition(1), ZN => n_343);
  g17235 : IND2D1BWP7T port map(A1 => game_state(1), B1 => game_state(0), ZN => n_341);
  g17236 : INVD1BWP7T port map(I => level_abs(1), ZN => n_339);
  g17237 : INVD1BWP7T port map(I => level_abs(0), ZN => n_338);
  g17245 : INVD0BWP7T port map(I => n_763, ZN => n_330);
  g2 : INR2D1BWP7T port map(A1 => n_596, B1 => n_607, ZN => n_324);
  g17251 : INR3D0BWP7T port map(A1 => n_433, B1 => n_470, B2 => n_437, ZN => n_323);
  g17252 : IND2D1BWP7T port map(A1 => n_390, B1 => n_348, ZN => n_322);
  g17253 : INR3D0BWP7T port map(A1 => n_355, B1 => n_452, B2 => n_356, ZN => n_321);
  hvis_reg_3 : DFQD1BWP7T port map(CP => clk, D => n_211, Q => hvis(3));
  hvis_reg_4 : DFQD1BWP7T port map(CP => clk, D => n_212, Q => hvis(4));
  hvis_reg_6 : DFQD1BWP7T port map(CP => clk, D => n_225, Q => hvis(6));
  vcount_reg_8 : DFXQD1BWP7T port map(CP => clk, DA => n_254, DB => n_229, SA => vcount(8), Q => vcount(8));
  vvis_reg_1 : DFQD1BWP7T port map(CP => clk, D => n_302, Q => vvis(1));
  vvis_reg_2 : DFQD1BWP7T port map(CP => clk, D => n_310, Q => vvis(2));
  vvis_reg_3 : DFQD1BWP7T port map(CP => clk, D => n_311, Q => vvis(3));
  vvis_reg_6 : DFQD1BWP7T port map(CP => clk, D => n_308, Q => vvis(6));
  xposition_reg_0 : DFQD1BWP7T port map(CP => clk, D => n_248, Q => xposition(0));
  xposition_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => n_219, D => n_252, Q => xposition(2));
  yposition_reg_4 : DFKCNQD1BWP7T port map(CP => clk, CN => n_232, D => n_319, Q => yposition(4));
  g11428 : MOAI22D0BWP7T port map(A1 => n_317, A2 => timer2_out(5), B1 => n_317, B2 => n_66, ZN => n_320);
  g11432 : MOAI22D0BWP7T port map(A1 => n_313, A2 => yposition(4), B1 => n_313, B2 => yposition(4), ZN => n_319);
  g11433 : MOAI22D0BWP7T port map(A1 => n_312, A2 => n_65, B1 => n_312, B2 => timer2_out(4), ZN => n_318);
  g11435 : IND2D0BWP7T port map(A1 => n_312, B1 => n_65, ZN => n_317);
  g11442 : OAI211D1BWP7T port map(A1 => n_45, A2 => n_304, B => n_301, C => n_269, ZN => n_316);
  g11443 : MOAI22D0BWP7T port map(A1 => n_293, A2 => n_64, B1 => n_293, B2 => timer2_out(3), ZN => n_315);
  g11444 : MOAI22D0BWP7T port map(A1 => n_294, A2 => yposition(3), B1 => n_294, B2 => yposition(3), ZN => n_314);
  g11447 : IND2D1BWP7T port map(A1 => n_294, B1 => yposition(3), ZN => n_313);
  g11451 : OAI211D1BWP7T port map(A1 => vvis(3), A2 => n_283, B => n_303, C => n_239, ZN => n_311);
  g11452 : ND3D0BWP7T port map(A1 => n_300, A2 => n_275, A3 => n_239, ZN => n_310);
  g11453 : AO21D0BWP7T port map(A1 => n_290, A2 => hcount_out(8), B => hcount_out(9), Z => n_309);
  g11454 : OAI221D0BWP7T port map(A1 => n_291, A2 => vvis(6), B1 => n_105, B2 => n_239, C => n_306, ZN => n_308);
  g11455 : IND2D0BWP7T port map(A1 => n_293, B1 => n_64, ZN => n_312);
  g11458 : OAI211D1BWP7T port map(A1 => n_38, A2 => n_286, B => n_292, C => n_239, ZN => n_307);
  g11459 : OAI21D0BWP7T port map(A1 => n_295, A2 => n_279, B => vvis(6), ZN => n_306);
  g11460 : MOAI22D0BWP7T port map(A1 => n_278, A2 => xposition(4), B1 => n_278, B2 => xposition(4), ZN => n_305);
  g11461 : AOI21D0BWP7T port map(A1 => n_267, A2 => n_38, B => n_295, ZN => n_304);
  g11462 : OAI21D0BWP7T port map(A1 => n_289, A2 => n_280, B => vvis(3), ZN => n_303);
  g11463 : OAI211D1BWP7T port map(A1 => n_113, A2 => n_268, B => n_285, C => n_239, ZN => n_302);
  g11467 : AOI32D1BWP7T port map(A1 => n_277, A2 => n_45, A3 => vvis(4), B1 => n_240, B2 => yplayer(0), ZN => n_301);
  g11468 : AOI22D0BWP7T port map(A1 => n_289, A2 => vvis(2), B1 => n_267, B2 => n_158, ZN => n_300);
  g11469 : MOAI22D0BWP7T port map(A1 => n_262, A2 => yposition(2), B1 => n_262, B2 => yposition(2), ZN => n_299);
  g11470 : MOAI22D0BWP7T port map(A1 => n_264, A2 => row_out(2), B1 => n_264, B2 => n_74, ZN => n_298);
  g11471 : MOAI22D0BWP7T port map(A1 => n_263, A2 => n_63, B1 => n_263, B2 => timer2_out(2), ZN => n_297);
  g11472 : MOAI22D0BWP7T port map(A1 => n_290, A2 => n_23, B1 => n_290, B2 => n_23, ZN => n_296);
  g11477 : MAOI22D0BWP7T port map(A1 => n_277, A2 => n_38, B1 => n_261, B2 => n_156, ZN => n_292);
  g11478 : AOI22D0BWP7T port map(A1 => n_260, A2 => n_177, B1 => n_277, B2 => n_745, ZN => n_291);
  g11479 : OAI21D0BWP7T port map(A1 => n_261, A2 => n_149, B => n_286, ZN => n_295);
  g11480 : IND2D1BWP7T port map(A1 => n_262, B1 => yposition(2), ZN => n_294);
  g11481 : IND2D0BWP7T port map(A1 => n_263, B1 => n_63, ZN => n_293);
  g11482 : HA1D0BWP7T port map(A => hcount_out(7), B => n_256, CO => n_290, S => n_288);
  g11483 : AO221D0BWP7T port map(A1 => n_253, A2 => n_26, B1 => n_219, B2 => vvis(0), C => n_240, Z => n_287);
  g11484 : OAI21D0BWP7T port map(A1 => n_261, A2 => n_102, B => n_218, ZN => n_289);
  g11490 : AOI22D0BWP7T port map(A1 => n_260, A2 => n_113, B1 => n_219, B2 => vvis(1), ZN => n_285);
  g11491 : OAI21D0BWP7T port map(A1 => n_265, A2 => n_44, B => n_259, ZN => n_284);
  g11492 : OA21D0BWP7T port map(A1 => n_268, A2 => n_163, B => n_275, Z => n_283);
  g11493 : MOAI22D0BWP7T port map(A1 => n_241, A2 => n_128, B1 => n_266, B2 => n_77, ZN => n_282);
  g11494 : MOAI22D0BWP7T port map(A1 => n_246, A2 => xposition(3), B1 => n_246, B2 => xposition(3), ZN => n_281);
  g11495 : MOAI22D0BWP7T port map(A1 => n_268, A2 => n_164, B1 => n_260, B2 => vvis(2), ZN => n_280);
  g11496 : OAI22D0BWP7T port map(A1 => n_268, A2 => n_745, B1 => n_261, B2 => n_45, ZN => n_279);
  g11497 : AOI21D0BWP7T port map(A1 => n_267, A2 => n_170, B => n_219, ZN => n_286);
  g11498 : AO21D0BWP7T port map(A1 => n_255, A2 => column_out(0), B => n_258, Z => n_276);
  g11499 : IND2D1BWP7T port map(A1 => n_246, B1 => xposition(3), ZN => n_278);
  g11500 : NR2XD0BWP7T port map(A1 => n_268, A2 => n_170, ZN => n_277);
  g11505 : MOAI22D0BWP7T port map(A1 => n_235, A2 => n_62, B1 => n_235, B2 => timer2_out(1), ZN => n_274);
  g11506 : MOAI22D0BWP7T port map(A1 => n_234, A2 => n_73, B1 => n_234, B2 => n_73, ZN => n_273);
  g11507 : AO32D1BWP7T port map(A1 => n_214, A2 => n_40, A3 => vcount(6), B1 => n_251, B2 => vcount(7), Z => n_272);
  g11508 : AO22D0BWP7T port map(A1 => n_254, A2 => vcount(9), B1 => vcount(8), B2 => n_229, Z => n_271);
  g11509 : MOAI22D0BWP7T port map(A1 => n_233, A2 => yposition(1), B1 => n_233, B2 => yposition(1), ZN => n_270);
  g11510 : IND3D1BWP7T port map(A1 => vvis(2), B1 => n_102, B2 => n_260, ZN => n_275);
  g11511 : ND2D1BWP7T port map(A1 => n_260, A2 => n_177, ZN => n_269);
  g11512 : INVD1BWP7T port map(I => n_268, ZN => n_267);
  g11518 : ND2D1BWP7T port map(A1 => n_253, A2 => n_184, ZN => n_268);
  g11519 : CKND1BWP7T port map(I => n_265, ZN => n_266);
  g11520 : INVD1BWP7T port map(I => n_261, ZN => n_260);
  g11521 : IND3D1BWP7T port map(A1 => n_241, B1 => n_75, B2 => n_44, ZN => n_259);
  g11522 : NR2XD0BWP7T port map(A1 => n_258, A2 => n_255, ZN => n_265);
  g11523 : IND2D1BWP7T port map(A1 => n_234, B1 => row_out(1), ZN => n_264);
  g11524 : IND2D0BWP7T port map(A1 => n_235, B1 => n_62, ZN => n_263);
  g11525 : IND2D1BWP7T port map(A1 => n_233, B1 => yposition(1), ZN => n_262);
  g11526 : IND2D1BWP7T port map(A1 => n_184, B1 => n_253, ZN => n_261);
  g11527 : HA1D0BWP7T port map(A => hcount_out(6), B => n_216, CO => n_256, S => n_257);
  g11528 : NR2XD0BWP7T port map(A1 => n_241, A2 => n_75, ZN => n_258);
  g11536 : MOAI22D0BWP7T port map(A1 => n_209, A2 => xposition(2), B1 => n_209, B2 => xposition(2), ZN => n_252);
  g11537 : AO21D0BWP7T port map(A1 => n_207, A2 => n_36, B => n_243, Z => n_251);
  g11538 : OAI22D0BWP7T port map(A1 => n_228, A2 => n_30, B1 => n_206, B2 => n_144, ZN => n_250);
  g11539 : OAI32D1BWP7T port map(A1 => vcount(5), A2 => n_148, A3 => n_206, B1 => n_27, B2 => n_231, ZN => n_249);
  g11540 : OAI31D0BWP7T port map(A1 => xposition(0), A2 => n_195, A3 => n_218, B => n_245, ZN => n_248);
  g11541 : OAI32D1BWP7T port map(A1 => vcount_out(2), A2 => n_84, A3 => n_206, B1 => n_25, B2 => n_228, ZN => n_247);
  g11542 : AN2D1BWP7T port map(A1 => n_241, A2 => n_227, Z => n_255);
  g11543 : OAI21D0BWP7T port map(A1 => n_206, A2 => n_738, B => n_242, ZN => n_254);
  g11544 : OAI22D0BWP7T port map(A1 => n_215, A2 => reset, B1 => n_230, B2 => n_180, ZN => n_253);
  g11545 : ND2D0BWP7T port map(A1 => n_227, A2 => xposition(0), ZN => n_245);
  g11546 : IND2D1BWP7T port map(A1 => n_209, B1 => xposition(2), ZN => n_246);
  g11552 : INVD0BWP7T port map(I => n_243, ZN => n_242);
  g11553 : INVD1BWP7T port map(I => n_240, ZN => n_239);
  g11554 : MOAI22D0BWP7T port map(A1 => n_220, A2 => n_72, B1 => n_220, B2 => n_72, ZN => n_238);
  g11555 : MOAI22D0BWP7T port map(A1 => n_221, A2 => yposition(0), B1 => n_221, B2 => yposition(0), ZN => n_237);
  g11556 : MOAI22D0BWP7T port map(A1 => n_202, A2 => n_61, B1 => n_202, B2 => timer2_out(0), ZN => n_236);
  g11557 : AOI21D0BWP7T port map(A1 => n_218, A2 => n_172, B => n_160, ZN => n_244);
  g11558 : OAI21D0BWP7T port map(A1 => n_206, A2 => vcount(5), B => n_231, ZN => n_243);
  g11559 : IND2D1BWP7T port map(A1 => n_85, B1 => n_227, ZN => n_241);
  g11560 : INR2XD0BWP7T port map(A1 => n_180, B1 => n_230, ZN => n_240);
  g11561 : IND2D0BWP7T port map(A1 => n_202, B1 => n_61, ZN => n_235);
  g11562 : IND2D1BWP7T port map(A1 => n_220, B1 => row_out(0), ZN => n_234);
  g11563 : IND2D1BWP7T port map(A1 => n_221, B1 => yposition(0), ZN => n_233);
  g11566 : IOA21D1BWP7T port map(A1 => n_173, A2 => n_78, B => n_218, ZN => n_232);
  g11570 : OAI222D0BWP7T port map(A1 => n_200, A2 => n_186, B1 => xplayer(1), B2 => n_1, C1 => n_185, C2 => n_198, ZN => n_225);
  g11571 : MOAI22D0BWP7T port map(A1 => n_206, A2 => n_110, B1 => n_201, B2 => n_47, ZN => n_224);
  g11572 : MOAI22D0BWP7T port map(A1 => n_206, A2 => n_151, B1 => n_201, B2 => vcount_out(4), ZN => n_223);
  g11573 : OAI222D0BWP7T port map(A1 => n_198, A2 => n_191, B1 => xplayer(0), B2 => n_1, C1 => n_165, C2 => n_200, ZN => n_222);
  g11574 : AOI21D0BWP7T port map(A1 => n_207, A2 => n_148, B => n_201, ZN => n_231);
  g11575 : ND3D0BWP7T port map(A1 => n_208, A2 => n_91, A3 => n_78, ZN => n_230);
  g11576 : AN2D1BWP7T port map(A1 => n_214, A2 => n_738, Z => n_229);
  g11577 : AOI21D0BWP7T port map(A1 => n_207, A2 => n_84, B => n_201, ZN => n_228);
  g11578 : AN2D1BWP7T port map(A1 => n_219, A2 => n_195, Z => n_227);
  g11579 : AOI31D0BWP7T port map(A1 => n_203, A2 => n_60, A3 => n_59, B => reset, ZN => n_226);
  g11580 : INVD1BWP7T port map(I => n_219, ZN => n_218);
  g11581 : HA1D0BWP7T port map(A => n_56, B => n_196, CO => n_216, S => n_217);
  g11582 : OAI211D1BWP7T port map(A1 => yposition(4), A2 => n_179, B => n_208, C => n_92, ZN => n_215);
  g11583 : IND2D1BWP7T port map(A1 => n_148, B1 => n_208, ZN => n_221);
  g11584 : IND2D1BWP7T port map(A1 => n_84, B1 => n_208, ZN => n_220);
  g11585 : NR2XD0BWP7T port map(A1 => n_208, A2 => reset, ZN => n_219);
  g11586 : MOAI22D0BWP7T port map(A1 => n_204, A2 => xposition(1), B1 => n_204, B2 => xposition(1), ZN => n_213);
  g11587 : OAI22D0BWP7T port map(A1 => n_198, A2 => n_178, B1 => n_200, B2 => n_136, ZN => n_212);
  g11588 : OAI22D0BWP7T port map(A1 => n_200, A2 => n_152, B1 => n_198, B2 => n_155, ZN => n_211);
  g11589 : OAI22D0BWP7T port map(A1 => n_200, A2 => n_125, B1 => n_198, B2 => n_122, ZN => n_210);
  g11590 : NR3D0BWP7T port map(A1 => n_206, A2 => n_148, A3 => n_27, ZN => n_214);
  g11591 : IND2D1BWP7T port map(A1 => n_204, B1 => xposition(1), ZN => n_209);
  g11593 : INVD1BWP7T port map(I => n_207, ZN => n_206);
  g11594 : MOAI22D0BWP7T port map(A1 => n_188, A2 => n_71, B1 => n_188, B2 => timer1_out(5), ZN => n_205);
  g11595 : AN4D1BWP7T port map(A1 => n_196, A2 => n_120, A3 => hcount_out(9), A4 => hcount_out(8), Z => n_208);
  g11596 : NR3D0BWP7T port map(A1 => n_192, A2 => n_160, A3 => reset, ZN => n_207);
  g11597 : ND2D1BWP7T port map(A1 => n_195, A2 => n_120, ZN => n_203);
  g11598 : ND2D1BWP7T port map(A1 => n_196, A2 => xposition(0), ZN => n_204);
  g11600 : INVD0BWP7T port map(I => n_200, ZN => n_199);
  g11601 : INVD0BWP7T port map(I => n_198, ZN => n_197);
  g11602 : IND2D0BWP7T port map(A1 => n_188, B1 => n_71, ZN => n_202);
  g11603 : AN2D1BWP7T port map(A1 => n_192, A2 => n_78, Z => n_201);
  g11604 : IND2D1BWP7T port map(A1 => n_183, B1 => n_194, ZN => n_200);
  g11605 : ND2D1BWP7T port map(A1 => n_194, A2 => n_183, ZN => n_198);
  g11606 : INVD0BWP7T port map(I => n_196, ZN => n_195);
  g11607 : HA1D0BWP7T port map(A => n_55, B => n_181, CO => n_196, S => n_193);
  g11608 : NR2XD0BWP7T port map(A1 => n_190, A2 => reset, ZN => n_194);
  g11609 : MAOI22D0BWP7T port map(A1 => n_175, A2 => hvis(5), B1 => n_175, B2 => hvis(5), ZN => n_191);
  g11610 : ND4D0BWP7T port map(A1 => n_0, A2 => n_23, A3 => hcount_out(9), A4 => n_58, ZN => n_192);
  g11612 : OAI31D0BWP7T port map(A1 => n_89, A2 => xposition(4), A3 => n_153, B => n_187, ZN => n_190);
  g11613 : MOAI22D0BWP7T port map(A1 => n_169, A2 => timer1_out(4), B1 => n_169, B2 => timer1_out(4), ZN => n_189);
  g11614 : IND2D0BWP7T port map(A1 => n_169, B1 => timer1_out(4), ZN => n_188);
  g11617 : MAOI22D0BWP7T port map(A1 => n_159, A2 => hvis(6), B1 => n_159, B2 => hvis(6), ZN => n_186);
  g11618 : MAOI22D0BWP7T port map(A1 => n_176, A2 => hvis(6), B1 => n_176, B2 => hvis(6), ZN => n_185);
  g11619 : IND4D0BWP7T port map(A1 => n_60, B1 => n_89, B2 => n_23, B3 => n_166, ZN => n_187);
  g11620 : HA1D0BWP7T port map(A => n_54, B => n_162, CO => n_181, S => n_182);
  g11622 : AOI211XD0BWP7T port map(A1 => vcount(8), A2 => n_79, B => n_168, C => vcount(9), ZN => n_184);
  g11623 : NR2D1BWP7T port map(A1 => n_174, A2 => n_60, ZN => n_183);
  g11624 : OAI221D0BWP7T port map(A1 => n_24, A2 => yplayer(3), B1 => n_94, B2 => n_139, C => n_167, ZN => n_179);
  g11625 : MAOI22D0BWP7T port map(A1 => n_150, A2 => hvis(4), B1 => n_150, B2 => hvis(4), ZN => n_178);
  g11626 : INR4D0BWP7T port map(A1 => n_161, B1 => vcount(9), B2 => n_49, B3 => n_48, ZN => n_180);
  g11627 : CKAN2D1BWP7T port map(A1 => n_149, A2 => n_45, Z => n_177);
  g11628 : OR2D1BWP7T port map(A1 => n_150, A2 => n_740, Z => n_176);
  g11629 : IND2D1BWP7T port map(A1 => n_150, B1 => hvis(4), ZN => n_175);
  g11630 : MAOI222D1BWP7T port map(A => n_154, B => n_23, C => xplayer(3), ZN => n_174);
  g11631 : IND3D1BWP7T port map(A1 => n_100, B1 => vcount(9), B2 => n_161, ZN => n_173);
  g11632 : CKND2D0BWP7T port map(A1 => n_148, A2 => n_78, ZN => n_172);
  g11633 : MOAI22D0BWP7T port map(A1 => n_142, A2 => n_70, B1 => n_142, B2 => timer1_out(3), ZN => n_171);
  g11634 : ND2D1BWP7T port map(A1 => n_164, A2 => vvis(3), ZN => n_170);
  g11635 : IND2D0BWP7T port map(A1 => n_142, B1 => n_70, ZN => n_169);
  g11637 : MAOI22D0BWP7T port map(A1 => n_146, A2 => n_124, B1 => vcount(8), B2 => n_79, ZN => n_168);
  g11638 : AO31D1BWP7T port map(A1 => n_139, A2 => n_24, A3 => n_94, B => n_80, Z => n_167);
  g11639 : NR4D0BWP7T port map(A1 => n_138, A2 => n_51, A3 => hcount_out(4), A4 => n_54, ZN => n_166);
  g11640 : OA21D0BWP7T port map(A1 => n_131, A2 => n_31, B => n_159, Z => n_165);
  g11641 : INVD0BWP7T port map(I => n_164, ZN => n_163);
  g11643 : HA1D0BWP7T port map(A => vvis(2), B => n_95, CO => n_164, S => n_158);
  g11644 : HA1D0BWP7T port map(A => n_53, B => n_132, CO => n_162, S => n_157);
  g11645 : AOI21D0BWP7T port map(A1 => n_143, A2 => vvis(4), B => n_149, ZN => n_156);
  g11646 : NR4D0BWP7T port map(A1 => n_126, A2 => vcount(6), A3 => n_46, A4 => n_47, ZN => n_161);
  g11647 : AOI31D0BWP7T port map(A1 => n_127, A2 => n_100, A3 => n_36, B => n_41, ZN => n_160);
  g11648 : ND2D1BWP7T port map(A1 => n_131, A2 => n_31, ZN => n_159);
  g11649 : MAOI22D0BWP7T port map(A1 => n_119, A2 => hvis(3), B1 => n_119, B2 => hvis(3), ZN => n_155);
  g11650 : AOI222D0BWP7T port map(A1 => n_130, A2 => n_116, B1 => hcount_out(7), B2 => n_81, C1 => n_117, C2 => hcount_out(6), ZN => n_154);
  g11651 : AOI21D0BWP7T port map(A1 => n_115, A2 => n_28, B => n_147, ZN => n_153);
  g11652 : MAOI22D0BWP7T port map(A1 => n_118, A2 => hvis(3), B1 => n_118, B2 => hvis(3), ZN => n_152);
  g11653 : MAOI22D0BWP7T port map(A1 => n_141, A2 => n_50, B1 => n_141, B2 => vcount_out(4), ZN => n_151);
  g11658 : IND2D1BWP7T port map(A1 => n_119, B1 => hvis(3), ZN => n_150);
  g11659 : AOI221D0BWP7T port map(A1 => xposition(2), A2 => xplayer(2), B1 => xposition(3), B2 => n_88, C => n_129, ZN => n_147);
  g11660 : MAOI22D0BWP7T port map(A1 => n_123, A2 => n_109, B1 => n_40, B2 => yplayer(2), ZN => n_146);
  g11661 : MOAI22D0BWP7T port map(A1 => n_87, A2 => n_69, B1 => n_87, B2 => timer1_out(2), ZN => n_145);
  g11662 : AOI32D1BWP7T port map(A1 => n_133, A2 => n_30, A3 => vcount_out(2), B1 => n_25, B2 => vcount_out(3), ZN => n_144);
  g11663 : NR2D1BWP7T port map(A1 => n_143, A2 => vvis(4), ZN => n_149);
  g11664 : IND2D1BWP7T port map(A1 => n_141, B1 => n_50, ZN => n_148);
  g11665 : IOA21D0BWP7T port map(A1 => n_112, A2 => n_752, B => n_101, ZN => n_140);
  g11666 : ND2D1BWP7T port map(A1 => n_737, A2 => n_102, ZN => n_143);
  g11667 : IND2D0BWP7T port map(A1 => n_87, B1 => n_69, ZN => n_142);
  g11668 : OR2D1BWP7T port map(A1 => n_100, A2 => n_84, Z => n_141);
  g11670 : IND3D1BWP7T port map(A1 => hcount_out(1), B1 => n_32, B2 => n_120, ZN => n_138);
  g11671 : IOA21D0BWP7T port map(A1 => n_112, A2 => n_108, B => n_101, ZN => n_137);
  g11672 : AOI21D0BWP7T port map(A1 => n_121, A2 => hvis(4), B => n_131, ZN => n_136);
  g11673 : OAI21D0BWP7T port map(A1 => n_111, A2 => frame_count(0), B => n_101, ZN => n_135);
  g11674 : MOAI22D0BWP7T port map(A1 => n_753, A2 => n_82, B1 => n_112, B2 => n_107, ZN => n_134);
  g11675 : OAI221D0BWP7T port map(A1 => yposition(2), A2 => yplayer(2), B1 => n_98, B2 => n_743, C => n_742, ZN => n_139);
  g11676 : INVD0BWP7T port map(I => n_84, ZN => n_133);
  g11677 : INVD0BWP7T port map(I => n_85, ZN => n_132);
  g11678 : OAI21D0BWP7T port map(A1 => n_97, A2 => xplayer(0), B => n_90, ZN => n_130);
  g11679 : AOI21D0BWP7T port map(A1 => n_741, A2 => n_83, B => n_739, ZN => n_129);
  g11680 : AOI32D1BWP7T port map(A1 => n_34, A2 => column_out(1), A3 => column_out(0), B1 => n_44, B2 => column_out(2), ZN => n_128);
  g11681 : NR2XD0BWP7T port map(A1 => n_121, A2 => hvis(4), ZN => n_131);
  g11682 : INVD0BWP7T port map(I => n_126, ZN => n_127);
  g11683 : OA21D0BWP7T port map(A1 => n_86, A2 => n_42, B => n_118, Z => n_125);
  g11684 : IND3D1BWP7T port map(A1 => yplayer(1), B1 => vcount(6), B2 => n_96, ZN => n_124);
  g11685 : MOAI22D0BWP7T port map(A1 => n_93, A2 => yplayer(0), B1 => vcount(5), B2 => n_50, ZN => n_123);
  g11686 : MAOI22D0BWP7T port map(A1 => n_99, A2 => hvis(2), B1 => n_99, B2 => hvis(2), ZN => n_122);
  g11687 : IND3D1BWP7T port map(A1 => vcount(8), B1 => n_40, B2 => n_93, ZN => n_126);
  g11688 : NR2D0BWP7T port map(A1 => n_103, A2 => xplayer(1), ZN => n_117);
  g11689 : AOI21D0BWP7T port map(A1 => n_37, A2 => xplayer(1), B => n_103, ZN => n_116);
  g11690 : OAI21D0BWP7T port map(A1 => xposition(2), A2 => xplayer(2), B => n_88, ZN => n_115);
  g11691 : IND2D1BWP7T port map(A1 => n_744, B1 => n_86, ZN => n_121);
  g11692 : IND2D1BWP7T port map(A1 => n_86, B1 => n_99, ZN => n_114);
  g11693 : NR3D0BWP7T port map(A1 => n_57, A2 => n_56, A3 => n_58, ZN => n_120);
  g11694 : OR2D1BWP7T port map(A1 => n_99, A2 => n_42, Z => n_119);
  g11695 : ND2D1BWP7T port map(A1 => n_86, A2 => n_42, ZN => n_118);
  g11696 : INVD0BWP7T port map(I => n_111, ZN => n_112);
  g11697 : AOI22D0BWP7T port map(A1 => n_43, A2 => n_46, B1 => n_39, B2 => vcount_out(1), ZN => n_110);
  g11698 : AOI22D0BWP7T port map(A1 => n_40, A2 => yplayer(2), B1 => n_36, B2 => yplayer(1), ZN => n_109);
  g11699 : MOAI22D0BWP7T port map(A1 => n_782, A2 => frame_count(2), B1 => n_782, B2 => frame_count(2), ZN => n_108);
  g11700 : MOAI22D0BWP7T port map(A1 => n_746, A2 => frame_count(3), B1 => n_746, B2 => frame_count(3), ZN => n_107);
  g11701 : CKXOR2D0BWP7T port map(A1 => n_68, A2 => timer1_out(0), Z => n_106);
  g11702 : MAOI22D0BWP7T port map(A1 => yplayer(0), A2 => yplayer(1), B1 => yplayer(0), B2 => yplayer(1), ZN => n_105);
  g11703 : MOAI22D0BWP7T port map(A1 => n_29, A2 => n_52, B1 => n_29, B2 => hcount_out(1), ZN => n_104);
  g11704 : MAOI22D0BWP7T port map(A1 => n_26, A2 => vvis(1), B1 => n_26, B2 => vvis(1), ZN => n_113);
  g11705 : AOI22D0BWP7T port map(A1 => n_751, A2 => n_748, B1 => n_753, B2 => n_749, ZN => n_111);
  g11706 : INR2D1BWP7T port map(A1 => yposition(0), B1 => yplayer(0), ZN => n_98);
  g11707 : NR2XD0BWP7T port map(A1 => n_55, A2 => hcount_out(5), ZN => n_97);
  g11708 : NR2XD0BWP7T port map(A1 => n_58, A2 => n_81, ZN => n_103);
  g11709 : ND2D1BWP7T port map(A1 => n_40, A2 => yplayer(2), ZN => n_96);
  g11710 : CKAN2D1BWP7T port map(A1 => vvis(1), A2 => vvis(0), Z => n_95);
  g11711 : NR2XD0BWP7T port map(A1 => vvis(0), A2 => vvis(1), ZN => n_102);
  g11712 : IND2D0BWP7T port map(A1 => n_751, B1 => n_748, ZN => n_101);
  g11713 : ND2D1BWP7T port map(A1 => n_49, A2 => n_48, ZN => n_100);
  g11714 : ND2D1BWP7T port map(A1 => hvis(1), A2 => hvis(0), ZN => n_99);
  g11716 : INVD0BWP7T port map(I => n_91, ZN => n_92);
  g11717 : IND2D1BWP7T port map(A1 => xplayer(0), B1 => xposition(0), ZN => n_83);
  g11718 : AN2D1BWP7T port map(A1 => yplayer(2), A2 => yplayer(3), Z => n_94);
  g11719 : NR2XD0BWP7T port map(A1 => vcount_out(4), A2 => vcount(5), ZN => n_93);
  g11720 : NR2XD0BWP7T port map(A1 => yplayer(2), A2 => yplayer(3), ZN => n_91);
  g11721 : ND2D1BWP7T port map(A1 => hcount_out(5), A2 => hcount_out(4), ZN => n_90);
  g11722 : NR2D1BWP7T port map(A1 => xplayer(2), A2 => xplayer(3), ZN => n_89);
  g11723 : ND2D0BWP7T port map(A1 => xplayer(2), A2 => xplayer(3), ZN => n_88);
  g11724 : ND2D0BWP7T port map(A1 => n_67, A2 => timer1_out(1), ZN => n_87);
  g11725 : NR2XD0BWP7T port map(A1 => hvis(0), A2 => hvis(1), ZN => n_86);
  g11726 : ND2D1BWP7T port map(A1 => hcount_out(0), A2 => n_52, ZN => n_85);
  g11727 : ND2D1BWP7T port map(A1 => vcount_out(1), A2 => n_46, ZN => n_84);
  g11728 : INVD0BWP7T port map(I => n_749, ZN => n_82);
  g11734 : INVD1BWP7T port map(I => xplayer(2), ZN => n_81);
  g11780 : INVD0BWP7T port map(I => yplayer(3), ZN => n_79);
  g11808 : INVD1BWP7T port map(I => reset, ZN => n_78);
  column_reg_0 : DFD0BWP7T port map(CP => clk, D => n_276, Q => n_75, QN => n_17);
  column_reg_1 : DFD0BWP7T port map(CP => clk, D => n_284, Q => n_76, QN => n_44);
  column_reg_2 : DFD0BWP7T port map(CP => clk, D => n_282, Q => n_77, QN => n_34);
  hcount_reg_0 : DFKCND0BWP7T port map(CP => clk, CN => n_29, D => n_226, Q => n_51, QN => n_29);
  hcount_reg_1 : DFKCND0BWP7T port map(CP => clk, CN => n_104, D => n_226, Q => n_52, QN => n_16);
  hcount_reg_2 : DFKCND0BWP7T port map(CP => clk, CN => n_157, D => n_226, Q => n_53, QN => n_32);
  hcount_reg_3 : DFKCND0BWP7T port map(CP => clk, CN => n_182, D => n_226, Q => n_54, QN => n_2);
  hcount_reg_4 : DFKCND0BWP7T port map(CP => clk, CN => n_193, D => n_226, Q => n_55, QN => n_19);
  hcount_reg_5 : DFKCND0BWP7T port map(CP => clk, CN => n_217, D => n_226, Q => n_56, QN => n_18);
  hcount_reg_6 : DFKCND0BWP7T port map(CP => clk, CN => n_257, D => n_226, Q => n_57, QN => n_37);
  hcount_reg_7 : DFKCND0BWP7T port map(CP => clk, CN => n_288, D => n_226, Q => n_58, QN => n_20);
  hcount_reg_8 : DFKCND0BWP7T port map(CP => clk, CN => n_226, D => n_296, Q => n_59, QN => n_23);
  hcount_reg_9 : DFKCND0BWP7T port map(CP => clk, CN => n_226, D => n_309, Q => n_60, QN => n_21);
  hvis_reg_0 : DFKCND1BWP7T port map(CP => clk, CN => n_35, D => n_194, Q => hvis(0), QN => n_35);
  hvis_reg_2 : DFD1BWP7T port map(CP => clk, D => n_210, Q => hvis(2), QN => n_42);
  hvis_reg_5 : DFD1BWP7T port map(CP => clk, D => n_222, Q => hvis(5), QN => n_31);
  row_reg_0 : DFKCND0BWP7T port map(CP => clk, CN => n_238, D => n_244, Q => n_72, QN => n_13);
  row_reg_1 : DFKCND0BWP7T port map(CP => clk, CN => n_273, D => n_244, Q => n_73, QN => n_14);
  row_reg_2 : DFKCND0BWP7T port map(CP => clk, CN => n_244, D => n_298, Q => n_74, QN => n_3);
  timer1_reg_0 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_33, Q => n_67, QN => n_33);
  timer1_reg_1 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_106, Q => n_68, QN => n_5);
  timer1_reg_2 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_145, Q => n_69, QN => n_9);
  timer1_reg_3 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_171, Q => n_70, QN => n_7);
  timer1_reg_5 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_205, Q => n_71, QN => n_15);
  timer2_reg_0 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_236, Q => n_61, QN => n_12);
  timer2_reg_1 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_274, Q => n_62, QN => n_10);
  timer2_reg_2 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_297, Q => n_63, QN => n_11);
  timer2_reg_3 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_315, Q => n_64, QN => n_6);
  timer2_reg_4 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_318, Q => n_65, QN => n_8);
  timer2_reg_5 : DFCND0BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_320, Q => n_66, QN => n_4);
  vcount_reg_0 : DFXD0BWP7T port map(CP => clk, DA => n_201, DB => n_207, SA => n_46, Q => n_46, QN => n_39);
  vcount_reg_1 : DFD0BWP7T port map(CP => clk, D => n_224, Q => n_47, QN => n_43);
  vcount_reg_2 : DFD0BWP7T port map(CP => clk, D => n_247, Q => n_48, QN => n_25);
  vcount_reg_3 : DFD0BWP7T port map(CP => clk, D => n_250, Q => n_49, QN => n_30);
  vcount_reg_4 : DFD0BWP7T port map(CP => clk, D => n_223, Q => n_50, QN => n_22);
  vcount_reg_5 : DFD1BWP7T port map(CP => clk, D => n_249, Q => vcount(5), QN => n_27);
  vcount_reg_6 : DFXD1BWP7T port map(CP => clk, DA => n_243, DB => n_214, SA => vcount(6), Q => vcount(6), QN => n_36);
  vcount_reg_7 : DFD1BWP7T port map(CP => clk, D => n_272, Q => vcount(7), QN => n_40);
  vcount_reg_9 : DFD1BWP7T port map(CP => clk, D => n_271, Q => vcount(9), QN => n_41);
  vvis_reg_0 : DFD1BWP7T port map(CP => clk, D => n_287, Q => vvis(0), QN => n_26);
  vvis_reg_4 : DFD1BWP7T port map(CP => clk, D => n_307, Q => vvis(4), QN => n_38);
  vvis_reg_5 : DFD1BWP7T port map(CP => clk, D => n_316, Q => vvis(5), QN => n_45);
  xposition_reg_3 : DFKCND1BWP7T port map(CP => clk, CN => n_219, D => n_281, Q => xposition(3), QN => n_28);
  yposition_reg_2 : DFKCND1BWP7T port map(CP => clk, CN => n_232, D => n_299, Q => yposition(2), QN => n_24);
  drc_bufs17254 : INVD4BWP7T port map(I => n_33, ZN => timer1_out(0));
  drc_bufs11813 : INVD4BWP7T port map(I => n_22, ZN => vcount_out(4));
  drc_bufs11817 : INVD4BWP7T port map(I => n_21, ZN => hcount_out(9));
  drc_bufs11820 : INVD4BWP7T port map(I => n_37, ZN => hcount_out(6));
  drc_bufs11824 : INVD4BWP7T port map(I => n_20, ZN => hcount_out(7));
  drc_bufs11828 : INVD4BWP7T port map(I => n_25, ZN => vcount_out(2));
  drc_bufs11832 : INVD4BWP7T port map(I => n_43, ZN => vcount_out(1));
  drc_bufs11837 : INVD4BWP7T port map(I => n_19, ZN => hcount_out(4));
  drc_bufs11841 : INVD4BWP7T port map(I => n_18, ZN => hcount_out(5));
  drc_bufs11844 : INVD4BWP7T port map(I => n_30, ZN => vcount_out(3));
  drc_bufs11848 : INVD4BWP7T port map(I => n_17, ZN => column_out(0));
  drc_bufs11853 : INVD4BWP7T port map(I => n_16, ZN => hcount_out(1));
  drc_bufs11857 : INVD4BWP7T port map(I => n_23, ZN => hcount_out(8));
  drc_bufs11860 : INVD4BWP7T port map(I => n_15, ZN => timer1_out(5));
  drc_bufs11864 : INVD4BWP7T port map(I => n_29, ZN => hcount_out(0));
  drc_bufs11868 : INVD4BWP7T port map(I => n_34, ZN => column_out(2));
  drc_bufs11872 : INVD4BWP7T port map(I => n_14, ZN => row_out(1));
  drc_bufs11876 : INVD4BWP7T port map(I => n_13, ZN => row_out(0));
  drc_bufs11880 : INVD4BWP7T port map(I => n_12, ZN => timer2_out(0));
  drc_bufs11884 : INVD4BWP7T port map(I => n_11, ZN => timer2_out(2));
  drc_bufs11888 : INVD4BWP7T port map(I => n_10, ZN => timer2_out(1));
  drc_bufs11892 : INVD4BWP7T port map(I => n_9, ZN => timer1_out(2));
  drc_bufs11896 : INVD4BWP7T port map(I => n_8, ZN => timer2_out(4));
  drc_bufs11900 : INVD4BWP7T port map(I => n_7, ZN => timer1_out(3));
  drc_bufs11904 : INVD4BWP7T port map(I => n_6, ZN => timer2_out(3));
  drc_bufs11909 : INVD4BWP7T port map(I => n_44, ZN => column_out(1));
  drc_bufs11913 : INVD4BWP7T port map(I => n_5, ZN => timer1_out(1));
  drc_bufs11917 : INVD4BWP7T port map(I => n_4, ZN => timer2_out(5));
  drc_bufs11921 : INVD4BWP7T port map(I => n_3, ZN => row_out(2));
  drc_bufs11925 : INVD4BWP7T port map(I => n_32, ZN => hcount_out(2));
  drc_bufs11929 : INVD4BWP7T port map(I => n_2, ZN => hcount_out(3));
  drc_bufs11933 : INVD4BWP7T port map(I => n_39, ZN => vcount_out(0));
  g17255 : IND2D1BWP7T port map(A1 => n_187, B1 => n_78, ZN => n_1);
  g12024 : INR4D0BWP7T port map(A1 => n_162, B1 => n_90, B2 => n_57, B3 => n_54, ZN => n_0);
  timer1_reg_4 : DFCND1BWP7T port map(CDN => n_78, CP => vga_done_out, D => n_189, Q => timer1_out(4), QN => n_719);
  hvis_reg_1 : DFXD1BWP7T port map(CP => clk, DA => n_199, DB => n_197, SA => n_114, Q => hvis(1), QN => n_718);
  yposition_reg_3 : DFKCND1BWP7T port map(CP => clk, CN => n_232, D => n_314, Q => yposition(3), QN => n_80);
  xposition_reg_1 : DFKCND1BWP7T port map(CP => clk, CN => n_213, D => n_219, Q => xposition(1), QN => n_334);
  frame_count_reg_1 : DFCND1BWP7T port map(CDN => n_78, CP => timer1_out(4), D => n_140, Q => frame_count(1), QN => n_333);
  xposition_reg_4 : DFKCND1BWP7T port map(CP => clk, CN => n_219, D => n_305, Q => xposition(4), QN => n_332);
  yposition_reg_0 : DFKCND1BWP7T port map(CP => clk, CN => n_237, D => n_232, Q => yposition(0), QN => n_331);
  frame_count_reg_0 : DFCND1BWP7T port map(CDN => n_78, CP => timer1_out(4), D => n_135, Q => frame_count(0), QN => n_328);
  yposition_reg_1 : DFKCND1BWP7T port map(CP => clk, CN => n_232, D => n_270, Q => yposition(1), QN => n_327);
  frame_count_reg_2 : DFCND1BWP7T port map(CDN => n_78, CP => timer1_out(4), D => n_137, Q => frame_count(2), QN => n_326);
  frame_count_reg_3 : DFCND1BWP7T port map(CDN => n_78, CP => timer1_out(4), D => n_134, Q => frame_count(3), QN => n_325);
  csa_tree_add_99_11_groupi_g1145 : MOAI22D0BWP7T port map(A1 => csa_tree_add_99_11_groupi_n_142, A2 => csa_tree_add_99_11_groupi_n_111, B1 => csa_tree_add_99_11_groupi_n_142, B2 => csa_tree_add_99_11_groupi_n_111, ZN => n_767);
  csa_tree_add_99_11_groupi_g1146 : MAOI222D1BWP7T port map(A => csa_tree_add_99_11_groupi_n_140, B => csa_tree_add_99_11_groupi_n_115, C => csa_tree_add_99_11_groupi_n_96, ZN => csa_tree_add_99_11_groupi_n_142);
  csa_tree_add_99_11_groupi_g1147 : MOAI22D0BWP7T port map(A1 => csa_tree_add_99_11_groupi_n_140, A2 => csa_tree_add_99_11_groupi_n_120, B1 => csa_tree_add_99_11_groupi_n_140, B2 => csa_tree_add_99_11_groupi_n_120, ZN => n_766);
  csa_tree_add_99_11_groupi_g1148 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_123, B => csa_tree_add_99_11_groupi_n_114, CI => csa_tree_add_99_11_groupi_n_137, CO => csa_tree_add_99_11_groupi_n_140, S => n_765);
  csa_tree_add_99_11_groupi_g1149 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_125, B => csa_tree_add_99_11_groupi_n_124, CI => csa_tree_add_99_11_groupi_n_135, CO => csa_tree_add_99_11_groupi_n_137, S => n_764);
  csa_tree_add_99_11_groupi_g1150 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_121, B => csa_tree_add_99_11_groupi_n_126, CI => csa_tree_add_99_11_groupi_n_133, CO => csa_tree_add_99_11_groupi_n_135, S => n_763);
  csa_tree_add_99_11_groupi_g1151 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_122, B => csa_tree_add_99_11_groupi_n_118, CI => csa_tree_add_99_11_groupi_n_131, CO => csa_tree_add_99_11_groupi_n_133, S => n_762);
  csa_tree_add_99_11_groupi_g1152 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_119, B => csa_tree_add_99_11_groupi_n_112, CI => csa_tree_add_99_11_groupi_n_129, CO => csa_tree_add_99_11_groupi_n_131, S => n_761);
  csa_tree_add_99_11_groupi_g1153 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_113, B => csa_tree_add_99_11_groupi_n_105, CI => csa_tree_add_99_11_groupi_n_127, CO => csa_tree_add_99_11_groupi_n_129, S => n_760);
  csa_tree_add_99_11_groupi_g1154 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_106, B => csa_tree_add_99_11_groupi_n_84, CI => csa_tree_add_99_11_groupi_n_116, CO => csa_tree_add_99_11_groupi_n_127, S => n_759);
  csa_tree_add_99_11_groupi_g1155 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_109, B => csa_tree_add_99_11_groupi_n_94, CI => csa_tree_add_99_11_groupi_n_108, CO => csa_tree_add_99_11_groupi_n_125, S => csa_tree_add_99_11_groupi_n_126);
  csa_tree_add_99_11_groupi_g1156 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_98, B => csa_tree_add_99_11_groupi_n_93, CI => csa_tree_add_99_11_groupi_n_107, CO => csa_tree_add_99_11_groupi_n_123, S => csa_tree_add_99_11_groupi_n_124);
  csa_tree_add_99_11_groupi_g1157 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_101, B => csa_tree_add_99_11_groupi_n_92, CI => csa_tree_add_99_11_groupi_n_110, CO => csa_tree_add_99_11_groupi_n_121, S => csa_tree_add_99_11_groupi_n_122);
  csa_tree_add_99_11_groupi_g1158 : XNR2D1BWP7T port map(A1 => csa_tree_add_99_11_groupi_n_115, A2 => csa_tree_add_99_11_groupi_n_96, ZN => csa_tree_add_99_11_groupi_n_120);
  csa_tree_add_99_11_groupi_g1159 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_90, B => csa_tree_add_99_11_groupi_n_99, CI => csa_tree_add_99_11_groupi_n_102, CO => csa_tree_add_99_11_groupi_n_118, S => csa_tree_add_99_11_groupi_n_119);
  csa_tree_add_99_11_groupi_g1160 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_103, B => csa_tree_add_99_11_groupi_n_76, CI => csa_tree_add_99_11_groupi_n_85, CO => csa_tree_add_99_11_groupi_n_116, S => n_758);
  csa_tree_add_99_11_groupi_g1161 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_80, B => csa_tree_add_99_11_groupi_n_63, CI => csa_tree_add_99_11_groupi_n_97, CO => csa_tree_add_99_11_groupi_n_115, S => csa_tree_add_99_11_groupi_n_114);
  csa_tree_add_99_11_groupi_g1162 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_60, B => csa_tree_add_99_11_groupi_n_66, CI => csa_tree_add_99_11_groupi_n_100, CO => csa_tree_add_99_11_groupi_n_112, S => csa_tree_add_99_11_groupi_n_113);
  csa_tree_add_99_11_groupi_g1163 : MOAI22D0BWP7T port map(A1 => csa_tree_add_99_11_groupi_n_95, A2 => csa_tree_add_99_11_groupi_n_73, B1 => csa_tree_add_99_11_groupi_n_95, B2 => csa_tree_add_99_11_groupi_n_73, ZN => csa_tree_add_99_11_groupi_n_111);
  csa_tree_add_99_11_groupi_g1164 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_62, B => csa_tree_add_99_11_groupi_n_89, CI => csa_tree_add_99_11_groupi_n_70, CO => csa_tree_add_99_11_groupi_n_109, S => csa_tree_add_99_11_groupi_n_110);
  csa_tree_add_99_11_groupi_g1165 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_68, B => csa_tree_add_99_11_groupi_n_69, CI => csa_tree_add_99_11_groupi_n_91, CO => csa_tree_add_99_11_groupi_n_107, S => csa_tree_add_99_11_groupi_n_108);
  csa_tree_add_99_11_groupi_g1166 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_75, B => csa_tree_add_99_11_groupi_n_48, CI => csa_tree_add_99_11_groupi_n_83, CO => csa_tree_add_99_11_groupi_n_105, S => csa_tree_add_99_11_groupi_n_106);
  csa_tree_add_99_11_groupi_g1167 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_56, B => csa_tree_add_99_11_groupi_n_71, CI => csa_tree_add_99_11_groupi_n_86, CO => csa_tree_add_99_11_groupi_n_103, S => n_757);
  csa_tree_add_99_11_groupi_g1168 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_59, B => csa_tree_add_99_11_groupi_n_65, CI => csa_tree_add_99_11_groupi_n_78, CO => csa_tree_add_99_11_groupi_n_101, S => csa_tree_add_99_11_groupi_n_102);
  csa_tree_add_99_11_groupi_g1169 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_54, B => csa_tree_add_99_11_groupi_n_47, CI => csa_tree_add_99_11_groupi_n_82, CO => csa_tree_add_99_11_groupi_n_99, S => csa_tree_add_99_11_groupi_n_100);
  csa_tree_add_99_11_groupi_g1170 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_67, B => csa_tree_add_99_11_groupi_n_57, CI => csa_tree_add_99_11_groupi_n_64, CO => csa_tree_add_99_11_groupi_n_97, S => csa_tree_add_99_11_groupi_n_98);
  csa_tree_add_99_11_groupi_g1171 : MOAI22D0BWP7T port map(A1 => csa_tree_add_99_11_groupi_n_81, A2 => csa_tree_add_99_11_groupi_n_79, B1 => csa_tree_add_99_11_groupi_n_81, B2 => csa_tree_add_99_11_groupi_n_79, ZN => csa_tree_add_99_11_groupi_n_96);
  csa_tree_add_99_11_groupi_g1172 : MAOI222D1BWP7T port map(A => csa_tree_add_99_11_groupi_n_88, B => csa_tree_add_99_11_groupi_n_74, C => csa_tree_add_99_11_groupi_n_41, ZN => csa_tree_add_99_11_groupi_n_95);
  csa_tree_add_99_11_groupi_g1173 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_6, B => csa_tree_add_99_11_groupi_n_49, CI => csa_tree_add_99_11_groupi_n_61, CO => csa_tree_add_99_11_groupi_n_93, S => csa_tree_add_99_11_groupi_n_94);
  csa_tree_add_99_11_groupi_g1174 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_51, B => csa_tree_add_99_11_groupi_n_50, CI => csa_tree_add_99_11_groupi_n_77, CO => csa_tree_add_99_11_groupi_n_91, S => csa_tree_add_99_11_groupi_n_92);
  csa_tree_add_99_11_groupi_g1175 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_22, B => csa_tree_add_99_11_groupi_n_53, CI => csa_tree_add_99_11_groupi_n_52, CO => csa_tree_add_99_11_groupi_n_89, S => csa_tree_add_99_11_groupi_n_90);
  csa_tree_add_99_11_groupi_g1176 : INVD0BWP7T port map(I => csa_tree_add_99_11_groupi_n_79, ZN => csa_tree_add_99_11_groupi_n_88);
  csa_tree_add_99_11_groupi_g1177 : HA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_10, B => csa_tree_add_99_11_groupi_n_72, CO => csa_tree_add_99_11_groupi_n_86, S => n_756);
  csa_tree_add_99_11_groupi_g1178 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_8, B => csa_tree_add_99_11_groupi_n_46, CI => csa_tree_add_99_11_groupi_n_55, CO => csa_tree_add_99_11_groupi_n_84, S => csa_tree_add_99_11_groupi_n_85);
  csa_tree_add_99_11_groupi_g1179 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_26, B => csa_tree_add_99_11_groupi_n_45, CI => csa_tree_add_99_11_groupi_n_0, CO => csa_tree_add_99_11_groupi_n_82, S => csa_tree_add_99_11_groupi_n_83);
  csa_tree_add_99_11_groupi_g1180 : CKXOR2D1BWP7T port map(A1 => csa_tree_add_99_11_groupi_n_74, A2 => csa_tree_add_99_11_groupi_n_41, Z => csa_tree_add_99_11_groupi_n_81);
  csa_tree_add_99_11_groupi_g1181 : MOAI22D0BWP7T port map(A1 => csa_tree_add_99_11_groupi_n_42, A2 => csa_tree_add_99_11_groupi_n_58, B1 => csa_tree_add_99_11_groupi_n_42, B2 => csa_tree_add_99_11_groupi_n_58, ZN => csa_tree_add_99_11_groupi_n_80);
  csa_tree_add_99_11_groupi_g1182 : MAOI222D1BWP7T port map(A => csa_tree_add_99_11_groupi_n_58, B => csa_tree_add_99_11_groupi_n_20, C => csa_tree_add_99_11_groupi_n_40, ZN => csa_tree_add_99_11_groupi_n_79);
  csa_tree_add_99_11_groupi_g1183 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_16, B => csa_tree_add_99_11_groupi_n_27, CI => csa_tree_add_99_11_groupi_n_2, CO => csa_tree_add_99_11_groupi_n_77, S => csa_tree_add_99_11_groupi_n_78);
  csa_tree_add_99_11_groupi_g1184 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_14, B => csa_tree_add_99_11_groupi_n_29, CI => csa_tree_add_99_11_groupi_n_25, CO => csa_tree_add_99_11_groupi_n_75, S => csa_tree_add_99_11_groupi_n_76);
  csa_tree_add_99_11_groupi_g1185 : FA1D0BWP7T port map(A => n_781, B => n_774, CI => csa_tree_add_99_11_groupi_n_19, CO => csa_tree_add_99_11_groupi_n_73, S => csa_tree_add_99_11_groupi_n_74);
  csa_tree_add_99_11_groupi_g1186 : FA1D0BWP7T port map(A => n_776, B => n_769, CI => csa_tree_add_99_11_groupi_n_36, CO => csa_tree_add_99_11_groupi_n_71, S => csa_tree_add_99_11_groupi_n_72);
  csa_tree_add_99_11_groupi_g1187 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_4, B => csa_tree_add_99_11_groupi_n_33, CI => csa_tree_add_99_11_groupi_n_23, CO => csa_tree_add_99_11_groupi_n_69, S => csa_tree_add_99_11_groupi_n_70);
  csa_tree_add_99_11_groupi_g1188 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_11, B => csa_tree_add_99_11_groupi_n_1, CI => csa_tree_add_99_11_groupi_n_7, CO => csa_tree_add_99_11_groupi_n_67, S => csa_tree_add_99_11_groupi_n_68);
  csa_tree_add_99_11_groupi_g1189 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_35, B => n_778, CI => csa_tree_add_99_11_groupi_n_5, CO => csa_tree_add_99_11_groupi_n_65, S => csa_tree_add_99_11_groupi_n_66);
  csa_tree_add_99_11_groupi_g1190 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_28, B => csa_tree_add_99_11_groupi_n_31, CI => csa_tree_add_99_11_groupi_n_3, CO => csa_tree_add_99_11_groupi_n_63, S => csa_tree_add_99_11_groupi_n_64);
  csa_tree_add_99_11_groupi_g1191 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_30, B => n_779, CI => csa_tree_add_99_11_groupi_n_15, CO => csa_tree_add_99_11_groupi_n_61, S => csa_tree_add_99_11_groupi_n_62);
  csa_tree_add_99_11_groupi_g1192 : FA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_38, B => csa_tree_add_99_11_groupi_n_24, CI => csa_tree_add_99_11_groupi_n_21, CO => csa_tree_add_99_11_groupi_n_59, S => csa_tree_add_99_11_groupi_n_60);
  csa_tree_add_99_11_groupi_g1193 : FA1D0BWP7T port map(A => n_780, B => n_773, CI => csa_tree_add_99_11_groupi_n_34, CO => csa_tree_add_99_11_groupi_n_58, S => csa_tree_add_99_11_groupi_n_57);
  csa_tree_add_99_11_groupi_g1194 : HA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_39, B => csa_tree_add_99_11_groupi_n_13, CO => csa_tree_add_99_11_groupi_n_55, S => csa_tree_add_99_11_groupi_n_56);
  csa_tree_add_99_11_groupi_g1195 : HA1D0BWP7T port map(A => n_771, B => csa_tree_add_99_11_groupi_n_18, CO => csa_tree_add_99_11_groupi_n_53, S => csa_tree_add_99_11_groupi_n_54);
  csa_tree_add_99_11_groupi_g1196 : HA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_12, B => csa_tree_add_99_11_groupi_n_32, CO => csa_tree_add_99_11_groupi_n_51, S => csa_tree_add_99_11_groupi_n_52);
  csa_tree_add_99_11_groupi_g1197 : HA1D0BWP7T port map(A => n_772, B => csa_tree_add_99_11_groupi_n_17, CO => csa_tree_add_99_11_groupi_n_49, S => csa_tree_add_99_11_groupi_n_50);
  csa_tree_add_99_11_groupi_g1198 : HA1D0BWP7T port map(A => csa_tree_add_99_11_groupi_n_37, B => csa_tree_add_99_11_groupi_n_9, CO => csa_tree_add_99_11_groupi_n_47, S => csa_tree_add_99_11_groupi_n_48);
  csa_tree_add_99_11_groupi_g1199 : HA1D0BWP7T port map(A => n_770, B => n_777, CO => csa_tree_add_99_11_groupi_n_45, S => csa_tree_add_99_11_groupi_n_46);
  csa_tree_add_99_11_groupi_g1200 : HA1D0BWP7T port map(A => n_775, B => n_768, CO => n_755, S => n_754);
  csa_tree_add_99_11_groupi_g1201 : XNR2D1BWP7T port map(A1 => csa_tree_add_99_11_groupi_n_20, A2 => csa_tree_add_99_11_groupi_n_40, ZN => csa_tree_add_99_11_groupi_n_42);
  csa_tree_add_99_11_groupi_g1202 : CKAN2D1BWP7T port map(A1 => n_770, A2 => n_768, Z => csa_tree_add_99_11_groupi_n_39);
  csa_tree_add_99_11_groupi_g1203 : CKAN2D1BWP7T port map(A1 => n_773, A2 => n_768, Z => csa_tree_add_99_11_groupi_n_38);
  csa_tree_add_99_11_groupi_g1204 : CKAN2D1BWP7T port map(A1 => n_771, A2 => n_769, Z => csa_tree_add_99_11_groupi_n_37);
  csa_tree_add_99_11_groupi_g1205 : CKAN2D1BWP7T port map(A1 => n_769, A2 => n_768, Z => csa_tree_add_99_11_groupi_n_36);
  csa_tree_add_99_11_groupi_g1206 : CKAN2D1BWP7T port map(A1 => n_772, A2 => n_769, Z => csa_tree_add_99_11_groupi_n_35);
  csa_tree_add_99_11_groupi_g1207 : CKAN2D1BWP7T port map(A1 => n_773, A2 => n_772, Z => csa_tree_add_99_11_groupi_n_34);
  csa_tree_add_99_11_groupi_g1208 : CKAN2D1BWP7T port map(A1 => n_773, A2 => n_770, Z => csa_tree_add_99_11_groupi_n_33);
  csa_tree_add_99_11_groupi_g1209 : CKAN2D1BWP7T port map(A1 => n_779, A2 => n_777, Z => csa_tree_add_99_11_groupi_n_32);
  csa_tree_add_99_11_groupi_g1210 : CKAN2D1BWP7T port map(A1 => n_774, A2 => n_771, Z => csa_tree_add_99_11_groupi_n_31);
  csa_tree_add_99_11_groupi_g1211 : CKAN2D1BWP7T port map(A1 => n_779, A2 => n_778, Z => csa_tree_add_99_11_groupi_n_30);
  csa_tree_add_99_11_groupi_g1212 : AN2D1BWP7T port map(A1 => n_770, A2 => n_769, Z => csa_tree_add_99_11_groupi_n_29);
  csa_tree_add_99_11_groupi_g1213 : CKAN2D1BWP7T port map(A1 => n_780, A2 => n_779, Z => csa_tree_add_99_11_groupi_n_28);
  csa_tree_add_99_11_groupi_g1214 : CKAN2D1BWP7T port map(A1 => n_773, A2 => n_769, Z => csa_tree_add_99_11_groupi_n_27);
  csa_tree_add_99_11_groupi_g1215 : CKAN2D1BWP7T port map(A1 => n_778, A2 => n_776, Z => csa_tree_add_99_11_groupi_n_26);
  csa_tree_add_99_11_groupi_g1216 : CKAN2D1BWP7T port map(A1 => n_777, A2 => n_776, Z => csa_tree_add_99_11_groupi_n_25);
  csa_tree_add_99_11_groupi_g1217 : CKAN2D1BWP7T port map(A1 => n_781, A2 => n_780, Z => csa_tree_add_99_11_groupi_n_41);
  csa_tree_add_99_11_groupi_g1218 : CKAN2D1BWP7T port map(A1 => n_778, A2 => n_777, Z => csa_tree_add_99_11_groupi_n_24);
  csa_tree_add_99_11_groupi_g1219 : CKAN2D1BWP7T port map(A1 => n_781, A2 => n_776, Z => csa_tree_add_99_11_groupi_n_23);
  csa_tree_add_99_11_groupi_g1220 : CKAN2D1BWP7T port map(A1 => n_781, A2 => n_775, Z => csa_tree_add_99_11_groupi_n_22);
  csa_tree_add_99_11_groupi_g1221 : CKAN2D1BWP7T port map(A1 => n_774, A2 => n_772, Z => csa_tree_add_99_11_groupi_n_40);
  csa_tree_add_99_11_groupi_g1222 : CKAN2D1BWP7T port map(A1 => n_780, A2 => n_775, Z => csa_tree_add_99_11_groupi_n_21);
  csa_tree_add_99_11_groupi_g1223 : CKAN2D1BWP7T port map(A1 => n_774, A2 => n_773, Z => csa_tree_add_99_11_groupi_n_19);
  csa_tree_add_99_11_groupi_g1224 : CKAN2D1BWP7T port map(A1 => n_771, A2 => n_770, Z => csa_tree_add_99_11_groupi_n_18);
  csa_tree_add_99_11_groupi_g1225 : CKAN2D1BWP7T port map(A1 => n_772, A2 => n_771, Z => csa_tree_add_99_11_groupi_n_17);
  csa_tree_add_99_11_groupi_g1226 : CKAN2D1BWP7T port map(A1 => n_774, A2 => n_768, Z => csa_tree_add_99_11_groupi_n_16);
  csa_tree_add_99_11_groupi_g1227 : CKAN2D1BWP7T port map(A1 => n_774, A2 => n_769, Z => csa_tree_add_99_11_groupi_n_15);
  csa_tree_add_99_11_groupi_g1228 : CKAN2D1BWP7T port map(A1 => n_771, A2 => n_768, Z => csa_tree_add_99_11_groupi_n_14);
  csa_tree_add_99_11_groupi_g1229 : CKAN2D1BWP7T port map(A1 => n_777, A2 => n_775, Z => csa_tree_add_99_11_groupi_n_13);
  csa_tree_add_99_11_groupi_g1230 : CKAN2D1BWP7T port map(A1 => n_772, A2 => n_770, Z => csa_tree_add_99_11_groupi_n_12);
  csa_tree_add_99_11_groupi_g1231 : CKAN2D1BWP7T port map(A1 => n_774, A2 => n_770, Z => csa_tree_add_99_11_groupi_n_11);
  csa_tree_add_99_11_groupi_g1232 : AN2D1BWP7T port map(A1 => n_776, A2 => n_775, Z => csa_tree_add_99_11_groupi_n_10);
  csa_tree_add_99_11_groupi_g1233 : CKAN2D1BWP7T port map(A1 => n_772, A2 => n_768, Z => csa_tree_add_99_11_groupi_n_9);
  csa_tree_add_99_11_groupi_g1234 : CKAN2D1BWP7T port map(A1 => n_781, A2 => n_779, Z => csa_tree_add_99_11_groupi_n_20);
  csa_tree_add_99_11_groupi_g1235 : CKAN2D1BWP7T port map(A1 => n_778, A2 => n_775, Z => csa_tree_add_99_11_groupi_n_8);
  csa_tree_add_99_11_groupi_g1236 : CKAN2D1BWP7T port map(A1 => n_780, A2 => n_778, Z => csa_tree_add_99_11_groupi_n_7);
  csa_tree_add_99_11_groupi_g1237 : CKAN2D1BWP7T port map(A1 => n_781, A2 => n_777, Z => csa_tree_add_99_11_groupi_n_6);
  csa_tree_add_99_11_groupi_g1238 : CKAN2D1BWP7T port map(A1 => n_779, A2 => n_776, Z => csa_tree_add_99_11_groupi_n_5);
  csa_tree_add_99_11_groupi_g1239 : CKAN2D1BWP7T port map(A1 => n_780, A2 => n_777, Z => csa_tree_add_99_11_groupi_n_4);
  csa_tree_add_99_11_groupi_g1240 : CKAN2D1BWP7T port map(A1 => n_781, A2 => n_778, Z => csa_tree_add_99_11_groupi_n_3);
  csa_tree_add_99_11_groupi_g1241 : CKAN2D1BWP7T port map(A1 => n_780, A2 => n_776, Z => csa_tree_add_99_11_groupi_n_2);
  csa_tree_add_99_11_groupi_g1242 : CKAN2D1BWP7T port map(A1 => n_773, A2 => n_771, Z => csa_tree_add_99_11_groupi_n_1);
  csa_tree_add_99_11_groupi_g1243 : CKAN2D1BWP7T port map(A1 => n_779, A2 => n_775, Z => csa_tree_add_99_11_groupi_n_0);

end synthesised;
