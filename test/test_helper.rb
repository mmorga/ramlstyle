require 'simplecov'
SimpleCov.start do
  minimum_coverage 88
  coverage_dir 'tmp/coverage'
  add_filter "/vendor\/raml_ruby/"
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ramlstyle'

require 'minitest/autorun'
require "mocha/mini_test"
