
----------------------------------------------
------------MOD CODE -------------------------
ReZeroMod = {}

ReZeroMod.config = SMODS.current_mod.config

assert(SMODS.load_file("Config_tab.lua"))()

local cie_ref = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
  if key == 'saved' then
    G.GAME.deaths = (G.GAME.deaths or 0) + 1
  end
  return cie_ref(effect, scored_card, key, amount, from_edition)
end


SMODS.Atlas {
	key = "jokers",
	path = "RBD-crop.png",
	px = 71,
	py = 95
}

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

SMODS.Joker {
    key = 'rbdj',
    loc_txt = {
        name = 'Return By Death',
        text = {
            "Gain {X:mult,C:white} X#1# {} Mult everytime",
			"{C:attention}Mr. Bones{} is used.",
			"Creates {C:attention}Mr. Bones{} when",
			"{C:attention}Boss Blind{} is selected.",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
    },
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
	atlas = 'jokers',
    pos = { x = 0, y = 0 },
    config = { extra = { xmult = 1, xmult_gain = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain,1 + (G.GAME.deaths or 0) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then 
			return { xmult = 1 + (G.GAME.deaths or 0) }
		end
		if context.setting_blind and context.blind.boss then
			if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then 
				SMODS.add_card({key = "j_mr_bones"})
			end
        end
    end,
}


----------------------------------------------
------------MOD CODE END----------------------