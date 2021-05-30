class MerchantsPortal::BaseController < ApplicationController
  layout :set_layout
  add_breadcrumb "Home", :merchants_portal_home_path
  
  private
    def set_layout
      "merchants_portal"
    end
end
