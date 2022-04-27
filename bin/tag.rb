#!/usr/bin/env ruby
# Id$ nonnax 2021-11-02 19:11:52 +0800
s=ARGF.read
md=s.match(/^(\s+)/)
size=Array(md&.captures).first&.size
leading_sp=' '*size if size
puts ["#{leading_sp}<div class=\"class\">",s.chomp,"#{leading_sp}</div>"].join("\n")

