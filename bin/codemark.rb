#!/usr/bin/env ruby

require './codemark'

fail ArgumentError, "Usage:  codemark [filename.Rmd]\n" if ARGV.count == 0

# Read RMarkdown file
filename_rmd = ARGV[0]
rmd_file = File.open(filename_rmd, 'r').read

# Convert Rmd to R
code = Redcarpet::Markdown.new(CodeMark::MarkdownToR.new, extensions = {})
rendered = code.render(rmd_file)

# Output R file
file = filename_rmd.match(/(?<name>.*)\.rmd/i)
File.write("#{file[:name]}.R", rendered)
