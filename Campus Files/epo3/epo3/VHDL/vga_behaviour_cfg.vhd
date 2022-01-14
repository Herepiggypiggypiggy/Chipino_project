configuration vga_behaviour_cfg of vga is
   for behaviour
      for all: texture_ctrl use configuration work.texture_ctrl_behaviour_cfg;
      end for;
      for all: tile_ctrl use configuration work.tile_ctrl_behavioural_cfg;
      end for;
      for all: color_ctrl use configuration work.color_ctrl_behavioural_cfg;
      end for;
      for all: display_ctrl use configuration work.display_ctrl_behavioural_cfg;
      end for;
   end for;
end vga_behaviour_cfg;
