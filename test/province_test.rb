gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  def test_province_shortfall
    asia = Province.new(sample_province_data)
    assert_equal(5, asia.shortfall)
  end

  def test_province_profit
  	asia = Province.new(sample_province_data)
  	assert_equal(230, asia.profit)
  end

  def test_province_shortfall_after_production_change
  	asia = Province.new(sample_province_data)
  	asia.producers[0].production = 20
  	assert_equal(-6, asia.shortfall)
  end

   def test_province_profit_after_production_change
  	asia = Province.new(sample_province_data)
  	asia.producers[0].production = 20
  	assert_equal(292, asia.profit)
  end

  def test_province_shortfall_with_no_producers
  	no_producers = Province.new(sample_province_data_no_producers)
  	assert_equal(30, no_producers.shortfall)
  end

  def test_province_profit_with_no_producers
  	no_producers = Province.new(sample_province_data_no_producers)
  	assert_equal(0, no_producers.profit)
  end

end
