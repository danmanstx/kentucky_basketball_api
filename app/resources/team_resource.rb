require 'jsonapi/resource'

module Api
  module V1
    class TeamResource < JSONAPI::Resource
      attributes :year, :coach, :conference, :division
      model_name 'Team'

      has_one :school
    end
  end
end
