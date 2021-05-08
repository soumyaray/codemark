# frozen_string_literal: true

require 'redcarpet'

module CodeMark
  class MarkdownToR < Redcarpet::Render::Base
    def preprocess(full_document)
      # strip headers
      headers_rx = "^---\n([a-zA-Z_]*:.[^\n]+\n)+---\n"
      regx = /(?<headers>#{headers_rx})(?<body>.*)/m
      doc = full_document.match(regx)
      doc[:body]
    end

    # def block_code(code, language)
    #   code
    # end

    # def block_quote(quote)
    #   quote
    # end

    # def block_html(raw_html)
    #   raw_html
    # end

    # def footnotes(content)
    #   content
    # end

    # def footnote_def(content, number)
    #   content
    # end

    def header(text, header_level)
      if (@code_started and !@code_ignore)
        "# " + text + "\n"
      else
        "#" + "*"*header_level + " " + text + "\n\n"
      end
    end

    def hrule()
      '#' + '-'*50
    end

    # def list(contents, list_type)
    #   contents
    # end

    # def list_item(text, list_type)
    #   text
    # end

    def paragraph(text)
      return nil if text == '\newpage'


      # codeblock started at this para?
      start_code = text.match(/^```{r(?<code_spec>[^}]*)}[\n]*(?<code>.*)/m)
      if start_code
        @code_started = true
        @code_ignore = false
        if start_code[:code_spec].match(/echo[ ]*=[ ]*(f|F)/)
          @code_ignore = true
        end

        text = start_code[:code]
      end

      # codeblock ends with this para?
      end_code = text.match(/(?<code>.*)\n```$/m)
      if end_code
        text = end_code[:code]
        @code_ends = true
      end

      # Comment out regular text
      unless @code_started
        text = "# " + text

        # Wrap regular text with commented lines
        if text.length > 80
          final = text.split(' ').reduce({full:'', sentence:''}) do |sofar, word|
            possible_sentence = sofar[:sentence] + " " + word
            if (possible_sentence).length <= 80
              sofar[:sentence] = possible_sentence
            else
              sofar[:full] = sofar[:full] + "\n" + sofar[:sentence]
              sofar[:sentence] = "# " + word
            end
            sofar
          end

          text = final[:full].strip + "\n" + final[:sentence]
        end

      end

      if @code_ends
        @code_started = @code_ends = false
      end

      unless @code_ignore
        text + "\n\n"
      end
    end

    # def table(header, body)
    #   header
    # end

    # def table_row(content)
    #   content
    # end

    # def table_cell(content, alignment, header)
    #   content
    # end

    # SPAN LEVEL CALLS
    # def codespan(code)
    #   code
    # end

    # LOW LEVEL CALLS
    # def normal_text(text)
    #   text
    # end
  end
end
