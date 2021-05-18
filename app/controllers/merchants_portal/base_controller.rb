class MerchantsPortal::BaseController < ApplicationController
  layout :set_layout
  
  private
    def set_layout
      "merchants_portal"
    end
end
