# -*- encoding: utf-8 -*-
$:.unshift(File.expand_path('../../support/', __FILE__))

require 'erb'
require 'thor'

require 'constants'
require 'base'

require 'generator/app_delegate'
require 'generator/sprite'
require 'generator/layer'
require 'generator/scene'
require 'generator/generator'

require 'setup/setup'

require 'tasks'