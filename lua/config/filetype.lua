-- Register snakemake extensions
vim.filetype.add({
	extension = { smk = "snakemake" },
	filename = { ["Snakefile"] = "snakemake" },
	pattern = { ["Snakefile%..+"] = "snakemake" },
})
