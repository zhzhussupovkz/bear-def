#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"
require "singleton"

require_relative "game/players/bee"
require_relative "game/players/bear"
require_relative "game/objects/home"
require_relative "game/objects/weapon"
require_relative "game/level"
require_relative "game/mygame"

Mygame.instance.show