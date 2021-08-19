# NOTE: 
#   sti_class_for is a public method which means we can be confident 
#   if changed in the future, there will be a changelog and deprecation notice.
#   (rails/activerecord/lib/active_record/inheritance.rb)
module CustomStiName
  extend ActiveSupport::Concern

  class_methods do
    def sti_class_for(type_name)
      super("#{base_class}::#{type_name.classify}")
    end
  end
end