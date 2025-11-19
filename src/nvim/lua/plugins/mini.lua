return {
	"nvim-mini/mini.nvim",
	version = "*",

	require("mini.pairs").setup(),
	require("mini.surround").setup(),
	require("mini.statusline").setup(),
	require("mini.comment").setup(),
	require("mini.align").setup(),
	require("mini.pick").setup(),
}
