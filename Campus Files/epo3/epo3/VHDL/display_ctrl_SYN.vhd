
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of display_ctrl is

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component AOI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component CKND4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AN4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component INR4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component IIND4D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component MUX2D1BWP7T
    port(I0, I1, S : in std_logic; Z : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFD0BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal display_state : std_logic_vector(2 downto 0);
  signal blue_0_312, blue_1_313, blue_2_314, blue_3_315, green_0_308 : std_logic;
  signal green_1_309, green_2_310, green_3_311, n_0, n_1 : std_logic;
  signal n_2, n_3, n_4, n_5, n_6 : std_logic;
  signal n_7, n_8, n_9, n_10, n_11 : std_logic;
  signal n_12, n_13, n_14, n_15, n_16 : std_logic;
  signal n_17, n_18, n_19, n_20, n_21 : std_logic;
  signal n_22, n_23, n_24, n_25, n_26 : std_logic;
  signal n_27, n_28, n_29, n_30, n_31 : std_logic;
  signal n_32, n_33, n_34, n_35, n_36 : std_logic;
  signal n_37, n_38, n_39, n_40, n_41 : std_logic;
  signal n_42, n_43, n_44, n_45, n_46 : std_logic;
  signal n_47, n_48, n_49, n_50, n_51 : std_logic;
  signal n_52, n_53, n_54, n_55, n_56 : std_logic;
  signal n_57, n_58, n_59, n_60, n_61 : std_logic;
  signal n_62, n_63, n_65, n_68, n_69 : std_logic;
  signal n_70, n_71, n_72, n_73, n_74 : std_logic;
  signal n_75, n_76, n_77, n_78, n_79 : std_logic;
  signal n_80, n_81, n_82, n_83, n_84 : std_logic;
  signal n_85, n_86, n_87, n_88, n_89 : std_logic;
  signal n_90, n_91, n_92, n_93, n_94 : std_logic;
  signal n_95, n_96, n_97, n_98, n_99 : std_logic;
  signal n_100, n_101, n_102, n_103, n_104 : std_logic;
  signal n_105, n_106, n_107, n_108, n_109 : std_logic;
  signal n_110, n_111, n_112, n_113, n_152 : std_logic;
  signal n_155, n_161, n_167, n_173, n_179 : std_logic;
  signal n_185, n_191, n_197, n_203, n_209 : std_logic;
  signal n_215, n_221, red_0_304, red_1_305, red_2_306 : std_logic;
  signal red_3_307 : std_logic;

begin

  g2381 : AO221D0BWP7T port map(A1 => n_103, A2 => n_28, B1 => red_1_305, B2 => reset, C => n_96, Z => n_111);
  g2376 : AO221D0BWP7T port map(A1 => n_91, A2 => n_39, B1 => green_1_309, B2 => reset, C => n_105, Z => n_110);
  g2384 : AO221D0BWP7T port map(A1 => red_0_304, A2 => reset, B1 => n_76, B2 => n_25, C => n_104, Z => n_109);
  g2382 : AO221D0BWP7T port map(A1 => n_101, A2 => n_30, B1 => blue_1_313, B2 => reset, C => n_100, Z => n_108);
  g2383 : AO221D0BWP7T port map(A1 => blue_0_312, A2 => reset, B1 => n_78, B2 => n_26, C => n_102, Z => n_107);
  g2380 : AO221D0BWP7T port map(A1 => green_0_308, A2 => reset, B1 => n_80, B2 => n_38, C => n_93, Z => n_106);
  g2385 : AOI211D0BWP7T port map(A1 => n_81, A2 => n_89, B => n_37, C => n_92, ZN => n_105);
  g2396 : OA21D0BWP7T port map(A1 => n_8, A2 => n_95, B => n_103, Z => n_104);
  g2395 : OA21D0BWP7T port map(A1 => n_3, A2 => n_99, B => n_101, Z => n_102);
  g2386 : AOI211D0BWP7T port map(A1 => n_79, A2 => n_87, B => n_32, C => n_99, ZN => n_100);
  g2389 : AO221D0BWP7T port map(A1 => blue_2_314, A2 => reset, B1 => n_88, B2 => n_53, C => n_71, Z => n_98);
  g2388 : AO221D0BWP7T port map(A1 => green_2_310, A2 => reset, B1 => n_90, B2 => n_50, C => n_73, Z => n_97);
  g2387 : AOI211D0BWP7T port map(A1 => n_77, A2 => n_85, B => n_31, C => n_95, ZN => n_96);
  g2390 : AO221D0BWP7T port map(A1 => red_2_306, A2 => reset, B1 => n_86, B2 => n_44, C => n_72, Z => n_94);
  g2394 : OA21D0BWP7T port map(A1 => n_35, A2 => n_92, B => n_91, Z => n_93);
  g2397 : IND2D1BWP7T port map(A1 => n_90, B1 => n_89, ZN => n_91);
  g2398 : IND2D1BWP7T port map(A1 => n_88, B1 => n_87, ZN => n_101);
  g2399 : IND2D1BWP7T port map(A1 => n_86, B1 => n_85, ZN => n_103);
  g2400 : MOAI22D0BWP7T port map(A1 => n_61, A2 => n_89, B1 => green_3_311, B2 => reset, ZN => n_84);
  g2401 : MOAI22D0BWP7T port map(A1 => n_58, A2 => n_87, B1 => blue_3_315, B2 => reset, ZN => n_83);
  g2402 : MOAI22D0BWP7T port map(A1 => n_49, A2 => n_85, B1 => red_3_307, B2 => reset, ZN => n_82);
  g2403 : CKND1BWP7T port map(I => n_80, ZN => n_81);
  g2404 : CKND1BWP7T port map(I => n_78, ZN => n_79);
  g2409 : CKND1BWP7T port map(I => n_76, ZN => n_77);
  g2407 : NR2D0BWP7T port map(A1 => n_75, A2 => n_60, ZN => n_80);
  g2406 : NR2D0BWP7T port map(A1 => n_74, A2 => n_56, ZN => n_88);
  g2405 : NR2D0BWP7T port map(A1 => n_75, A2 => n_59, ZN => n_90);
  g2408 : NR2D0BWP7T port map(A1 => n_74, A2 => n_57, ZN => n_78);
  g2412 : NR2D0BWP7T port map(A1 => n_52, A2 => n_89, ZN => n_73);
  g2411 : NR2D0BWP7T port map(A1 => n_45, A2 => n_85, ZN => n_72);
  g2410 : NR2D0BWP7T port map(A1 => n_55, A2 => n_87, ZN => n_71);
  g2414 : NR2D0BWP7T port map(A1 => n_70, A2 => n_48, ZN => n_76);
  g2413 : NR2D0BWP7T port map(A1 => n_70, A2 => n_47, ZN => n_86);
  g2415 : ND2D1BWP7T port map(A1 => n_69, A2 => IN_BLUE(3), ZN => n_87);
  g2416 : ND2D1BWP7T port map(A1 => n_69, A2 => IN_GREEN(3), ZN => n_89);
  g2417 : ND2D1BWP7T port map(A1 => n_69, A2 => IN_RED(3), ZN => n_85);
  g2418 : AOI21D0BWP7T port map(A1 => n_68, A2 => IN_BLUE(3), B => n_69, ZN => n_74);
  g2419 : AOI21D0BWP7T port map(A1 => n_68, A2 => IN_GREEN(3), B => n_69, ZN => n_75);
  g2420 : AOI21D0BWP7T port map(A1 => n_68, A2 => IN_RED(3), B => n_69, ZN => n_70);
  g2421 : INR2D1BWP7T port map(A1 => n_68, B1 => dim(3), ZN => n_69);
  g2422 : NR2D1BWP7T port map(A1 => display_state(0), A2 => reset, ZN => n_68);
  display_state_reg_0 : DFQD1BWP7T port map(CP => clk, D => n_152, Q => display_state(0));
  g2426 : CKND4BWP7T port map(I => n_113, ZN => vsync);
  g2427 : AOI211XD0BWP7T port map(A1 => Hcount(8), A2 => Hcount(9), B => n_62, C => Vcount(9), ZN => n_65);
  g2431 : CKND4BWP7T port map(I => n_112, ZN => hsync);
  vsync_state_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => n_63, D => n_46, Q => n_113);
  hsync_state_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => n_63, D => n_43, Q => n_112);
  g2429 : MOAI22D0BWP7T port map(A1 => n_34, A2 => n_42, B1 => n_41, B2 => Vcount(8), ZN => n_62);
  g2433 : OA21D0BWP7T port map(A1 => n_51, A2 => n_60, B => n_59, Z => n_61);
  g2434 : OA21D0BWP7T port map(A1 => n_54, A2 => n_57, B => n_56, Z => n_58);
  g2435 : AOI22D0BWP7T port map(A1 => n_54, A2 => n_20, B1 => n_53, B2 => n_57, ZN => n_55);
  g2436 : AOI22D0BWP7T port map(A1 => n_51, A2 => n_14, B1 => n_50, B2 => n_60, ZN => n_52);
  g2437 : OA21D0BWP7T port map(A1 => n_40, A2 => n_48, B => n_47, Z => n_49);
  g2428 : OAI31D0BWP7T port map(A1 => Vcount(2), A2 => n_23, A3 => n_33, B => n_63, ZN => n_46);
  g2438 : MAOI22D0BWP7T port map(A1 => n_44, A2 => n_48, B1 => n_44, B2 => n_16, ZN => n_45);
  g2439 : OAI31D0BWP7T port map(A1 => Hcount(8), A2 => n_42, A3 => n_22, B => n_63, ZN => n_43);
  g2432 : AN4D0BWP7T port map(A1 => n_24, A2 => Vcount(6), A3 => Vcount(7), A4 => Vcount(5), Z => n_41);
  g2442 : INVD0BWP7T port map(I => n_44, ZN => n_40);
  g2441 : INVD0BWP7T port map(I => n_53, ZN => n_54);
  g2445 : MOAI22D0BWP7T port map(A1 => n_36, A2 => n_92, B1 => n_17, B2 => n_92, ZN => n_39);
  g2449 : MOAI22D0BWP7T port map(A1 => n_37, A2 => n_6, B1 => n_36, B2 => n_35, ZN => n_38);
  g2443 : INVD0BWP7T port map(I => n_50, ZN => n_51);
  g2444 : INR4D0BWP7T port map(A1 => n_18, B1 => Hcount(6), B2 => Hcount(5), B3 => Hcount(4), ZN => n_34);
  g2440 : IIND4D0BWP7T port map(A1 => n_12, A2 => Vcount(4), B1 => Vcount(3), B2 => Vcount(5), ZN => n_33);
  g2446 : OAI21D0BWP7T port map(A1 => n_29, A2 => n_99, B => n_32, ZN => n_53);
  g2447 : AOI21D0BWP7T port map(A1 => n_31, A2 => n_95, B => n_27, ZN => n_44);
  g2451 : MUX2D1BWP7T port map(I0 => n_29, I1 => n_13, S => n_99, Z => n_30);
  g2450 : MUX2D1BWP7T port map(I0 => n_27, I1 => n_15, S => n_95, Z => n_28);
  g2453 : OAI22D0BWP7T port map(A1 => n_32, A2 => n_5, B1 => n_29, B2 => n_4, ZN => n_26);
  g2452 : OAI22D0BWP7T port map(A1 => n_31, A2 => n_7, B1 => n_27, B2 => n_9, ZN => n_25);
  g2448 : AOI21D0BWP7T port map(A1 => n_37, A2 => n_92, B => n_21, ZN => n_50);
  g2454 : ND2D0BWP7T port map(A1 => n_19, A2 => n_23, ZN => n_24);
  g2458 : AOI222D0BWP7T port map(A1 => n_0, A2 => Hcount(5), B1 => Hcount(4), B2 => n_2, C1 => n_1, C2 => Hcount(6), ZN => n_22);
  g2455 : INVD0BWP7T port map(I => n_21, ZN => n_36);
  g2465 : MOAI22D0BWP7T port map(A1 => dim(2), A2 => IN_BLUE(2), B1 => dim(2), B2 => IN_BLUE(2), ZN => n_20);
  g2457 : NR4D0BWP7T port map(A1 => Vcount(4), A2 => Vcount(3), A3 => Vcount(2), A4 => Vcount(0), ZN => n_19);
  g2459 : NR4D0BWP7T port map(A1 => Hcount(1), A2 => Hcount(0), A3 => Hcount(2), A4 => Hcount(3), ZN => n_18);
  g2460 : MOAI22D0BWP7T port map(A1 => dim(1), A2 => IN_GREEN(1), B1 => dim(1), B2 => IN_GREEN(1), ZN => n_17);
  g2461 : MAOI22D0BWP7T port map(A1 => dim(2), A2 => IN_RED(2), B1 => dim(2), B2 => IN_RED(2), ZN => n_16);
  g2462 : MOAI22D0BWP7T port map(A1 => dim(1), A2 => IN_RED(1), B1 => dim(1), B2 => IN_RED(1), ZN => n_15);
  g2463 : MOAI22D0BWP7T port map(A1 => dim(2), A2 => IN_GREEN(2), B1 => dim(2), B2 => IN_GREEN(2), ZN => n_14);
  g2464 : MOAI22D0BWP7T port map(A1 => dim(1), A2 => IN_BLUE(1), B1 => dim(1), B2 => IN_BLUE(1), ZN => n_13);
  g2456 : IND4D0BWP7T port map(A1 => Vcount(9), B1 => Vcount(6), B2 => Vcount(8), B3 => Vcount(7), ZN => n_12);
  g2487 : NR2XD0BWP7T port map(A1 => IN_GREEN(2), A2 => n_11, ZN => n_60);
  g2488 : NR2XD0BWP7T port map(A1 => IN_BLUE(1), A2 => n_10, ZN => n_29);
  g2486 : NR2XD0BWP7T port map(A1 => n_11, A2 => IN_RED(2), ZN => n_48);
  g2485 : ND2D0BWP7T port map(A1 => n_10, A2 => IN_RED(1), ZN => n_31);
  g2466 : INVD0BWP7T port map(I => n_8, ZN => n_9);
  g2467 : INVD0BWP7T port map(I => n_95, ZN => n_7);
  g2468 : INVD0BWP7T port map(I => n_92, ZN => n_6);
  g2479 : INVD0BWP7T port map(I => n_99, ZN => n_5);
  g2478 : INVD0BWP7T port map(I => n_3, ZN => n_4);
  g2481 : ND2D1BWP7T port map(A1 => n_11, A2 => IN_GREEN(2), ZN => n_59);
  g2474 : NR2D0BWP7T port map(A1 => n_10, A2 => IN_GREEN(1), ZN => n_21);
  g2483 : ND2D1BWP7T port map(A1 => n_11, A2 => IN_RED(2), ZN => n_47);
  g2480 : ND2D1BWP7T port map(A1 => n_11, A2 => IN_BLUE(2), ZN => n_56);
  g2472 : ND2D0BWP7T port map(A1 => n_10, A2 => IN_GREEN(1), ZN => n_37);
  g2484 : NR2D0BWP7T port map(A1 => n_10, A2 => IN_RED(1), ZN => n_27);
  g2475 : NR2XD0BWP7T port map(A1 => IN_BLUE(2), A2 => n_11, ZN => n_57);
  g2473 : ND2D0BWP7T port map(A1 => n_10, A2 => IN_BLUE(1), ZN => n_32);
  g2470 : ND2D0BWP7T port map(A1 => Hcount(9), A2 => Hcount(7), ZN => n_42);
  g2489 : INR2XD0BWP7T port map(A1 => dim(0), B1 => IN_BLUE(0), ZN => n_99);
  g2476 : INR2D1BWP7T port map(A1 => dim(0), B1 => IN_RED(0), ZN => n_95);
  g2471 : INR2D0BWP7T port map(A1 => IN_GREEN(0), B1 => dim(0), ZN => n_35);
  g2469 : INR2D0BWP7T port map(A1 => IN_RED(0), B1 => dim(0), ZN => n_8);
  g2482 : INR2D0BWP7T port map(A1 => IN_BLUE(0), B1 => dim(0), ZN => n_3);
  g2477 : INR2D1BWP7T port map(A1 => dim(0), B1 => IN_GREEN(0), ZN => n_92);
  g2493 : INVD0BWP7T port map(I => Hcount(6), ZN => n_2);
  g2494 : INVD0BWP7T port map(I => Hcount(5), ZN => n_1);
  g2495 : INVD1BWP7T port map(I => dim(2), ZN => n_11);
  g2490 : INVD0BWP7T port map(I => Hcount(4), ZN => n_0);
  g2492 : INVD0BWP7T port map(I => Vcount(1), ZN => n_23);
  g2496 : INVD1BWP7T port map(I => reset, ZN => n_63);
  g2491 : CKND1BWP7T port map(I => dim(1), ZN => n_10);
  g2 : NR2D1BWP7T port map(A1 => n_65, A2 => reset, ZN => n_152);
  drc_bufs2512 : INVD4BWP7T port map(I => n_155, ZN => blue(3));
  drc_bufs2518 : INVD4BWP7T port map(I => n_161, ZN => green(3));
  drc_bufs2524 : INVD4BWP7T port map(I => n_167, ZN => red(3));
  drc_bufs2530 : INVD4BWP7T port map(I => n_173, ZN => red(1));
  drc_bufs2536 : INVD4BWP7T port map(I => n_179, ZN => red(0));
  drc_bufs2542 : INVD4BWP7T port map(I => n_185, ZN => blue(1));
  drc_bufs2548 : INVD4BWP7T port map(I => n_191, ZN => green(2));
  drc_bufs2554 : INVD4BWP7T port map(I => n_197, ZN => blue(2));
  drc_bufs2560 : INVD4BWP7T port map(I => n_203, ZN => green(0));
  drc_bufs2566 : INVD4BWP7T port map(I => n_209, ZN => blue(0));
  drc_bufs2572 : INVD4BWP7T port map(I => n_215, ZN => red(2));
  drc_bufs2578 : INVD4BWP7T port map(I => n_221, ZN => green(1));
  blue_reg_3 : DFD0BWP7T port map(CP => clk, D => n_83, Q => blue_3_315, QN => n_155);
  green_reg_3 : DFD0BWP7T port map(CP => clk, D => n_84, Q => green_3_311, QN => n_161);
  red_reg_3 : DFD0BWP7T port map(CP => clk, D => n_82, Q => red_3_307, QN => n_167);
  red_reg_1 : DFD0BWP7T port map(CP => clk, D => n_111, Q => red_1_305, QN => n_173);
  red_reg_0 : DFD0BWP7T port map(CP => clk, D => n_109, Q => red_0_304, QN => n_179);
  blue_reg_1 : DFD0BWP7T port map(CP => clk, D => n_108, Q => blue_1_313, QN => n_185);
  green_reg_2 : DFD0BWP7T port map(CP => clk, D => n_97, Q => green_2_310, QN => n_191);
  blue_reg_2 : DFD0BWP7T port map(CP => clk, D => n_98, Q => blue_2_314, QN => n_197);
  green_reg_0 : DFD0BWP7T port map(CP => clk, D => n_106, Q => green_0_308, QN => n_203);
  blue_reg_0 : DFD0BWP7T port map(CP => clk, D => n_107, Q => blue_0_312, QN => n_209);
  red_reg_2 : DFD0BWP7T port map(CP => clk, D => n_94, Q => red_2_306, QN => n_215);
  green_reg_1 : DFD0BWP7T port map(CP => clk, D => n_110, Q => green_1_309, QN => n_221);

end synthesised;
