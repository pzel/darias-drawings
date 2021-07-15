#!/usr/bin/env ruby
# just run me: ./generate.rb
require "erb"
template = ERB.new(File.read("index.erb"), nil, '-') #trim empty with -%>
flipped = %w[ 894BF616-4304-4426-B9DB-73B8267286D8.jpg IMG_0980.JPG IMG_1106.JPG IMG_1122.JPG IMG_1123.JPG IMG_1124.JPG IMG_1697.JPG ]
tipped = %w[ ]

images = `ls -tr -1 | grep 'JPG\\|JPEG\\|jpg\\|jpeg'`.lines.map{ |filename|
  {flip: flipped.include?(filename.strip),
    tip: tipped.include?(filename.strip),
    src:  filename.strip}
}

File.open("index.html", "w"){ |f| f.write(template.result) }
