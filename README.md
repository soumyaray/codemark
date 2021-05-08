# CodeMark Gem

Ruby gem to convert RMarkdown (.Rmd) files to pure R scripts (.R)

## Main Features

- Strips out Rmd headers
- Converts Rmd regular text to R comments
  - Converts headers to comment, marking the header level
  - Wraps text to 80 chars/line and makes each line a comment
  - Converts horizontal rules to commented series of many dashes
- Converts Rmd code chunks to regular R code
  - Does not copy over non-echoed code (i.e., ignores `echo={FALSE|false|F}`)

## Usage

Execute in shell using:

```shell
codemark <filename.Rmd> 
```

CodeMark will produce a corresponding file called `filename.R`

## Testing

Not yet implemented

## Contribute

Pull requests and issues are welcome on Github
