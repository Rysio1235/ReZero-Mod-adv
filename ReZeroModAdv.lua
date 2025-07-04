
----------------------------------------------
------------MOD CODE -------------------------
ReZeroMod = {}

ReZeroMod.config = SMODS.current_mod.config

assert(SMODS.load_file("Config_tab.lua"))()

SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32
})

Filename = "ReZero_Tarot-Balatro_v12.png"


AltTexture({
  key = 'tarot_texture',
  set = 'Tarot',
  path = Filename,
  loc_txt = {
    name = 'ReZero Tarot Texture',
  }
})

AltTexture({
  key = 'planet_texture',
  set = 'Planet',
  path = Filename,
  loc_txt = {
    name = 'ReZero Planet Texture',
  }
})

AltTexture({
  key = 'spectral_texture',
  set = 'Spectral',
  path = Filename,
  original_sheet = true,
  keys = { "c_black_hole", },
  localization = { "c_black_hole", },
  loc_txt = {
    name = 'ReZero Spectral Texture',
  }
})

AltTexture({
    key = "joker_texture",
    set = "Joker",
    path = "Jokers_Subaru_v3.png",
	original_sheet = true,
    keys = {
        "j_joker",
        "j_blueprint",
        "j_brainstorm",
    },

    localization = {
        "j_joker",
        "j_blueprint",
		"j_brainstorm",
	},
	loc_txt = {
		name = 'ReZero Joker Texture',
	}
})



TexturePack({
  key = 'ReZero Tarot Textures', 
  textures = {'Rcma_tarot_texture'},
  loc_txt = {
    name = 'ReZero Tarot Pack',
    text = {
	'ReZero themed', 
	'{C:tarot}Tarot{} cards'}
  }
})

TexturePack({
  key = 'ReZero Planet Textures', 
  textures = {'Rcma_planet_texture'},
  loc_txt = {
    name = 'ReZero Planet Pack',
    text = {
	'ReZero themed', 
	'{C:planet}Planet{} cards'}
  }
})

TexturePack({
  key = 'ReZero Spectral Textures', 
  textures = {'Rcma_spectral_texture'},
  loc_txt = {
    name = 'ReZero Spectral Pack',
    text = {
	'ReZero themed', 
	'{C:spectral}Spectral{} cards'}
  }
})

TexturePack({
  key = 'ReZero Joker Textures', 
  textures = {'Rcma_joker_texture'},
  loc_txt = {
    name = 'ReZero Joker Pack',
    text = {
	'ReZero themed', 
	'{C:joker}Joker{} cards'}
  }
})


if ReZeroMod.config.enable_sound_effect then
	SMODS.Sound{

		path = {
		default= 'Witches_call.ogg'
		},
	key="call",
	replace = "whoosh1",
	pitch = 1,
	volume = 1
	}
end


----------------------------------------------
------------MOD CODE END----------------------