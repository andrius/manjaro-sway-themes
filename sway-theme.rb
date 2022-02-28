#!/usr/bin/env ruby

require "pp"
require "erb"
require "fileutils"

filename = ARGV[0]
theme = filename.split("/").last.gsub(/\..*/, "")

xrdb_theme = File.read(filename).split("\n")
colors = xrdb_theme.map { |rec|
                          _, k, v = rec.split
                          { k.downcase.to_sym => v }
                        }.inject(:merge)

erb = ERB.new(File.read("/code/sway-theme.erb"))
sway_theme = erb.result(binding)

FileUtils.mkdir_p("/themes/sway/#{theme}")
file = File.open("/themes/sway/#{theme}/definitions", "w")
file.puts sway_theme
file.close
# vim: set ft=ruby ts=2 sts=2 sw=2 et fileencoding=utf-8 ff=unix:
