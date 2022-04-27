#!/usr/bin/env ruby
# Id$ nonnax 2022-04-27 22:19:57 +0800

@liner=ARGF.readlines

def process(text, depth)
    return if text.empty?
    depth+=1
    print(' '*depth)
    puts "<#{text}>"
    begin print(' '*depth); puts "</#{text}>"; return end if @liner.empty?
    process(@liner.shift.chomp, depth)
    print(' '*depth)
    puts "</#{text}>"
end

until @liner.empty? do
    process(@liner.shift.chomp, 0)
end
