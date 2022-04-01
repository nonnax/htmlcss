#!/usr/bin/env ruby
# Id$ nonnax 2022-04-01 11:47:29 +0800
require 'rubytools/fzf'
require 'pathname'

ROOT='/home/setir0x/github/css'

f=Dir[File.join(ROOT, '*')].fzf_preview('bat -p --color=always {}').first
f=Pathname.new(f)
IO.popen("xsel -b < #{f}", &:read) if f.exist? && !f.directory?
