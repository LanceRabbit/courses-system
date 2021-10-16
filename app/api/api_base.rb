# frozen_string_literal: true

class APIBase < Grape::API
  format :json
  content_type :json, "application/json"
  prefix :api

  mount ::V1::Base
end
