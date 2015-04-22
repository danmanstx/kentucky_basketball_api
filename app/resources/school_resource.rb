require 'jsonapi/resource'

module Api
  module V1
    class SchoolResource < JSONAPI::Resource
      attributes :name, :location, :founded, :mascot
      model_name 'School'

      has_many :teams
    end
  end
end
