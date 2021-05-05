# NOTE: 
#   sti_class_for is a public method which means we can be confident 
#   it won't be changed or removed in the future (rails/activerecord/lib/active_record/inheritance.rb)
module CustomStiName
  extend ActiveSupport::Concern

  class_methods do
    def sti_class_for(type_name)
      super("#{base_class}::#{type_name.classify}")
    end
  end
end