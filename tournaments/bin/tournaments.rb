#!/usr/bin/env ruby
require "require_all"
require "pry"

require_all "./lib/"

CLI.new.call

