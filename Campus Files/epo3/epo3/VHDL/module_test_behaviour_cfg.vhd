configuration module_test_behaviour_cfg of module_test is
   for behaviour
      for all: player_fsm use configuration work.player_fsm_behaviour_cfg;
      end for;
      for all: vga use configuration work.vga_behaviour_cfg;
      end for;
      for all: spi_v3 use configuration work.spi_v3_behaviour_cfg;
      end for;
      for all: stable_map use configuration work.stable_map_behaviour_cfg;
      end for;
   end for;
end module_test_behaviour_cfg;
