class UsersController < ApplicationController
    def create
        super do |resource|
          Profile.create(user: resource) if resource.persisted?
        end
      end
end
