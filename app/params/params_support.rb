module ParamsSupport
  def format_params(params, keys = [])
    params.reduce({}) do |acc, (key, val)|
      key = key.to_sym
      keys.push(key)  

      if val.is_a?(Hash)
        acc[key] = format_params(val, keys)
        keys.pop
        next acc
      end

      if val.is_a?(Array)
        acc[key] = format_array(val, keys)
        keys.pop
        next acc
      end

      acc[key] = val
      acc[key] = to_boolean(val) if convert_to_boolean?(keys)
      acc[key] = to_integer(val) if convert_to_integer?(keys)

      keys.pop
      acc
    end
  end

  def format_array(arr, keys)
    arr.map do |el|
      next format_params(el, keys) if el.is_a?(Hash)
      next to_boolean(el) if convert_to_boolean?(keys)
      next to_integer(el) if convert_to_integer?(keys)
      el
    end
  end

  def to_boolean(value)
    value.present? ? ActiveModel::Type::Boolean.new.cast(value) : value
  end

  def to_integer(value)
    value.present? ? value.to_i : value
  end

  # TODO: Find a way of memoizing this call
  def convert_to_boolean?(keys)
    boolean_keys.any? { |boolean_key| boolean_key == keys }
  end

  # TODO: Find a way of memoizing this call
  def convert_to_integer?(keys)
    integer_keys.any? { |integer_key| integer_key == keys }
  end
end