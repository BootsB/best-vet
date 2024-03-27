class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def memberships
    @memberships = Membership.all
  end
end
