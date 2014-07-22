require File.join(File.dirname(__FILE__), 'helper')

class MappableTest < Test::Unit::TestCase #:nodoc: all
  class TestMappable
    include Geokit::Mappable
  end

  def test_math_error_classes
    error_case = 0.49 * 180
    from = Geokit::LatLng.new(error_case, error_case)
    to   = Geokit::LatLng.new(error_case, error_case)
    assert_equal 0.0, Geokit::LatLng.distance_between_sphere(from, to, :kms)
  end

  def test_units_sphere_multiplier
    delta = 0.001
    assert_in_delta 3963.190, TestMappable.units_sphere_multiplier(:miles), delta
    assert_in_delta 6376.773, TestMappable.units_sphere_multiplier(:kms), delta
    assert_in_delta 3443.918, TestMappable.units_sphere_multiplier(:nms), delta
  end

  def test_units_per_latitude_degree
    delta = 0.00001
    assert_in_delta  69.10000, TestMappable.units_per_latitude_degree(:miles), delta
    assert_in_delta 111.18190, TestMappable.units_per_latitude_degree(:kms), delta
    assert_in_delta  60.04625, TestMappable.units_per_latitude_degree(:nms), delta
  end

  def test_units_per_longitude_degree_miles
    delta = 0.00001
    assert_in_delta 57.354410, TestMappable.units_per_longitude_degree(  0, :miles), delta
    assert_in_delta 55.400110, TestMappable.units_per_longitude_degree( 15, :miles), delta
    assert_in_delta 49.670379, TestMappable.units_per_longitude_degree( 30, :miles), delta
    assert_in_delta 40.555695, TestMappable.units_per_longitude_degree( 45, :miles), delta
    assert_in_delta 28.677207, TestMappable.units_per_longitude_degree( 60, :miles), delta
    assert_in_delta 14.844415, TestMappable.units_per_longitude_degree( 75, :miles), delta
    assert_in_delta  0.000000, TestMappable.units_per_longitude_degree( 90, :miles), delta
  end

  def test_units_per_longitude_degree_kms
    delta = 0.00001
    assert_in_delta 92.283252, TestMappable.units_per_longitude_degree(  0, :kms), delta
    assert_in_delta 89.138776, TestMappable.units_per_longitude_degree( 15, :kms), delta
    assert_in_delta 79.919641, TestMappable.units_per_longitude_degree( 30, :kms), delta
    assert_in_delta 65.254113, TestMappable.units_per_longitude_degree( 45, :kms), delta
    assert_in_delta 46.141626, TestMappable.units_per_longitude_degree( 60, :kms), delta
    assert_in_delta 23.884663, TestMappable.units_per_longitude_degree( 75, :kms), delta
    assert_in_delta  0.000000, TestMappable.units_per_longitude_degree( 90, :kms), delta
  end

  def test_units_per_longitude_degree_nms
    delta = 0.00001
    assert_in_delta 49.839623, TestMappable.units_per_longitude_degree(  0, :nms), delta
    assert_in_delta 35.241935, TestMappable.units_per_longitude_degree( 45, :nms), delta
    assert_in_delta  0.000000, TestMappable.units_per_longitude_degree( 90, :nms), delta
  end

end
