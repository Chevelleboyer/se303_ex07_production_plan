gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/producer'
require_relative '../lib/province'
require_relative '../lib/data'

class ProducerTest < Minitest::Test

	def test_change_production
		byzantium = Producer.new(Province.new(sample_province_data), {name: 'Byzantium', cost: 10, production: 9})
		byzantium.production = 20
		assert_equal(20, byzantium.production)
	end

end
