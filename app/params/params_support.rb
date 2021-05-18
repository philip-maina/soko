module ParamsSupport
  def to_boolean(value)
    value.present? ? ActiveModel::Type::Boolean.new.cast(value) : value
  end

  def to_integer(value)
    value.present? ? value.to_i : value
  end

  def format_params(params, keys = [])
    params.each do |key, val|
      keys.push(key)
      
      format_params(val, keys) if val.is_a?(Hash)
      val.each { |el| format_params(el, keys) } if val.is_a?(Array) && val.all? { |el| el.is_a?(Hash) }

      boolean_keys.each { |boolean_key| val.replace(to_boolean(val)) if boolean_key == keys  }
      integer_keys.each { |boolean_key| val.replace(to_int(val)) if boolean_key == keys  }
    end

    params
  end
end