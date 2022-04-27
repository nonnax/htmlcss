#!/usr/bin/env ruby
# Id$ nonnax 2022-04-01 11:47:29 +0800
require 'rubytools/fzf'
require 'pathname'

p ROOT=File.expand_path( "../", __dir__)

f=Dir[File.join(ROOT, '*')].fzf_preview('bat -p --color=always {}').first
f=Pathname.new(f)
puts f.read
IO.popen("xsel -b < #{f}", &:read) if f.exist? && !f.directory?
