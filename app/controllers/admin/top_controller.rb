class Admin::TopController < ApplicationController
  def index
#    raise Forbidden
    raise IpAddressRejected

    render action: 'index'
  end
end
