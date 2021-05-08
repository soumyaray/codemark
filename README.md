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

There is only one test currently, and it ensures that fixtures are processed accurately (i.e., a given Rmd file is correctly converted into a given R file).

```shell
rake spec
```

If the R file is accurately produced, `minitest` helpfully shows line diffs between the fixture R file and the generated R script.

If you deliberately change the behavior of CodeMark so that it produces different R output, then you must update the R script fixture:

```shell
rake install      # builds and reinstalls codemark gem locally
cd spec/fixtures
codemark sem-intro.Rmd
```



## Contribute

Pull requests and issues are welcome on Github
