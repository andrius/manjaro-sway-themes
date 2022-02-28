#!/usr/bin/env ruby

require "pp"
require "erb"
require "fileutils"

filename = ARGV[0]
theme = filename.split("/").last.gsub(/\..*/, "")

xrdb_theme = File.read(filename).split("\n")
colors = xrdb_theme.map { |rec|
                          _, k, v = rec.split
                          { k.downcase.to_sym => v.gsub("#", "") }
                        }.inject(:merge)

erb = ERB.new(File.read("/code/foot-ini.erb"))
foot_ini = erb.result(binding)

FileUtils.mkdir_p("/themes/foot/#{theme}")
file = File.open("/themes/foot/#{theme}/foot.ini", "w")
file.puts foot_ini
file.close

# require "irb"; binding.irb
# vim: set ft=ruby ts=2 sts=2 sw=2 et fileencoding=utf-8 ff=unix:
