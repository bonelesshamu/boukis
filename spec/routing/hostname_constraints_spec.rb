require 'rails_helper'

describe 'routing' do
  example 'staff top page' do
    expect(get: 'http://boukis.example.com').to route_to(
      host: 'boukis.example.com',
      controller: 'staff/top',
      action: 'index'
    )
  end
    
  example 'admin login form' do
    expect(get: 'http://boukis.example.com/admin/login').to route_to(
      host: 'boukis.example.com',
      controller: 'admin/sessions',
      action: 'new'
    )
  end

  example 'customer top page' do
    expect(get: 'http://example.com/mypage').to route_to(
      host: 'example.com',
      controller: 'customer/top',
      action: 'index'
    )
  end
  
  example 'host is out of scope' do
    expect(get: 'http://foo.example.jp').to route_to(
      controller: 'errors',
      action: 'routing_error'
    )
  end

  example 'route does not exist' do
    expect(get: 'http://boukis.example.com/xyz').to route_to(
      controller: 'errors',
      action: 'routing_error',
      anything: 'xyz'
    )
  end

end