module Admin
  class DashboardController < ApplicationController
    def index
    @total_users = ::User.count
    end
  end
end
