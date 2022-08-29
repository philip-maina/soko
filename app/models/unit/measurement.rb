class Unit::Measurement
  class << self
    def all
      @@all = [
        :pcs,

        :g,
        :kg,
        :lb,
        :oz,

        :ml,
        :l,

        :cm,
        :m,

        :cm2,
        :m2
      ].map { |unit| Unit::Measurement.new(unit: unit) }
    end

    def find
    end

    def as_json
      all.map(&:as_json)
    end

    def aliases_for()
    end
  end

  def initialize(value: nil, unit:)
    @unit = unit
    @value = value
    @aliases = [ unit ]
    @measurement_type = 
  end

  def parse()
  end
  
  def convert_to()
  end

  def as()
  end

  def as_json
    { 
      unit: @unit.to_s,
      measurementType: @measurement_type.to_s 
    }
  end


  def to_cm
  end

  def to_m
  end
end