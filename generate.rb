#!/usr/bin/env ruby
# just run me: ./generate.rb
require "erb"
template = ERB.new(File.read("index.erb"), nil, '-') #trim empty with -%>
rotated = %w[ IMG_0682.JPG IMG_1083.JPG IMG_1120.JPG IMG_1121.JPG IMG_1127.JPG IMG_1128.JPG IMG_1130.JPG ]

images = `ls -tr -1 | grep 'JPG\\|JPEG\\|jpg\\|jpeg'`.lines.map{ |filename|
  {rotate: rotated.include?(filename.strip),
    src:  filename.strip}
}

File.open("index.html", "w"){ |f| f.write(template.result) }
