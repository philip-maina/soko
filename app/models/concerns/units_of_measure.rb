module UnitsOfMeasure
  extend ActiveSupport::Concern

  # Constants
  WEIGHT_UNITS_OF_MEASURE  = { g: "g", kg: "kg", lb: "lb", oz: "oz" }.freeze
  VOLUME_UNITS_OF_MEASURE  = { ml: "ml", l: "l" }.freeze
  TEXTILE_UNITS_OF_MEASURE = { cm: "cm", m: "m", cm2: "cm2", m2: "m2" }.freeze
  UNITS_OF_MEASURE = { pcs: "pcs", g: "g", kg: "kg", lb: "lb", oz: "oz", ml: "ml", l: "l", cm: "cm", m: "m", cm2: "cm2", m2: "m2" }.freeze
end