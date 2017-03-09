require 'rails_helper'

RSpec.describe Dashboard::MembersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      path = { get: '/dashboard/members' }
      expect(path).to route_to('dashboard/members#index')
    end

    it 'routes to #new' do
      path = { get: '/dashboard/members/new' }
      expect(path).to route_to('dashboard/members#new')
    end

    it 'routes to #edit' do
      path = { get: '/dashboard/members/1/edit' }
      expect(path).to route_to('dashboard/members#edit', id: '1')
    end

    it 'routes to #create' do
      path = { post: '/dashboard/members' }
      expect(path).to route_to('dashboard/members#create')
    end

    it 'routes to #update via PUT' do
      path = { put: '/dashboard/members/1' }
      expect(path).to route_to('dashboard/members#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      path = { patch: '/dashboard/members/1' }
      expect(path).to route_to('dashboard/members#update', id: '1')
    end

    it 'routes to #destroy' do
      path = { delete: '/dashboard/members/1' }
      expect(path).to route_to('dashboard/members#destroy', id: '1')
    end
  end
end
