return {
	"sphamba/smear-cursor.nvim",
	opts = {
		cursor_color = "#FFD700", -- Bright Yellow
		stiffness = 0.6, -- Snappier than before, less "lag"
		trailing_stiffness = 0.3,

		-- VISIBILITY FIX:
		never_draw_over_target = true, -- Text is always visible immediately

		-- KITTY STYLE:
		hide_target_cursor = true, -- The smear BECOMES the cursor
	},
}
