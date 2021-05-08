require 'minitest/autorun'
require 'minitest/rg'

require './lib/codemark.rb'

INTRO_RMD = File.read("./spec/fixtures/sem-intro.Rmd")
INTRO_R = File.read("./spec/fixtures/sem-intro.R")
