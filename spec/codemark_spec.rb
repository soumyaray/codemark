require_relative 'spec_helper'

describe 'Create correct R file' do
  describe 'When we convert a known Rmd file' do
    it 'should create known R output' do
       rmd = Redcarpet::Markdown.new(CodeMark::MarkdownToR.new, extensions = {})
       r_script = rmd.render(INTRO_RMD)

       _(r_script).must_equal(INTRO_R)
    end
  end
end
