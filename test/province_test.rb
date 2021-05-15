gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  def test_shortfall
    asia = Province.new(sample_province_data)
    assert_equal(5, asia.shortfall)
  end

  def test_profit
  	asia = Province.new(sample_province_data)
  	assert_equal(230, asia.profit)
  end

  def test_shortfall_after_production_change
  	asia = Province.new(sample_province_data)
  	asia.producers[0].production = 20
  	assert_equal(-6, asia.shortfall)
  end

   def test_profit_after_production_change
  	asia = Province.new(sample_province_data)
  	asia.producers[0].production = 20
  	assert_equal(292, asia.profit)
  end

  def test_shortfall_with_no_producers
  	no_producers = Province.new(sample_province_data_no_producers)
  	assert_equal(30, no_producers.shortfall)
  end

  def test_profit_with_no_producers
  	no_producers = Province.new(sample_province_data_no_producers)
  	assert_equal(0, no_producers.profit)
  end

  def test_shortfall_with_0_demand
  	asia = Province.new(sample_province_data)
  	asia.demand = 0
  	assert_equal(-25, asia.shortfall)
  end

  def test_profit_with_0_demand
  	asia = Province.new(sample_province_data)
  	asia.demand = 0
  	assert_equal(0, asia.profit)
  end

  def test_shortfall_with_negative_demand
  	asia = Province.new(sample_province_data)
  	asia.demand = -1
  	assert_equal(-26, asia.shortfall)
  end

  def test_profit_with_negative_demand
  	asia = Province.new(sample_province_data)
  	asia.demand = -1
  	assert_equal(-10, asia.profit)
  end

  def test_shortfall_with_empty_string_demand
  	assert_raises NoMethodError do
  	  asia = Province.new(sample_province_data)
  	  asia.demand = ""
  	  asia.shortfall
	end
  end

  def test_profit_with_empty_string_demand
  	assert_raises ArgumentError do
  	  asia = Province.new(sample_province_data)
  	  asia.demand = ""
  	  asia.profit
	end
  end

  def test_shortfall_with_string_for_producers
  	# I have no idea if this test is even testing the right thing..
  	# Should maybe have edited Province class to properly handle a string for producers
  	assert_raises NoMethodError do
	  asia = Province.new(sample_province_data_string_producers)
	  assert_equal(0, asia.shortfall)
	end
  end

end
