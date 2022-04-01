#!/usr/bin/env ruby
# Id$ nonnax 2022-04-01 14:28:37 +0800
require 'erb'
require 'cgi'
require 'tagz'
include Tagz

class String
  def enc
    CGI.escapeHTML(self)
  end
end

def div(**params, &block)
    # doc=%{
      # <li class='item'>
        # <div class="media-object">&#x1F60E;</div>
        # <h1>
          # <%= ['&lbbrk;', 'Title' ,'&star;', '&starf;','&oast;', '&rbbrk;', '&lowast;', '&oplus;' '&ominus;', '&otimes;', '&oast;', '&odot;''&plusb;' '&minusb;', '&timesb;', '&sdotb;'].join %>
        # </h1>
        # <p><%= File.read(block.call).enc %> </p>
        # <p>
          # <%= %w[&phone; &#9993; &check; &cross;].join %>
        # </p>
      # </li>
    # }
    doc=%{
        <li class="media">
          <div class="media-object">&#x1F60E;</div>
          <div class="media-body">
            <h3 class="media-heading">Organically Synthesized</h3>
            <p>Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition.</p>
          </div>
          <%= %w[&phone; &#9993; &check; &cross;].join %>
        </li>      
    }
    ERB.new(doc).result(binding)
end

def render(text)
  ERB.new(text).result(binding)
end

file, times = ARGV
times ||= 1

layout=File.read 'layout.erb'

doc=render(layout) do
  div(class: 'item'){ file } * times.to_i
end

puts doc
