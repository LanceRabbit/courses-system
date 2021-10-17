# frozen_string_literal: true

module V1
  class Base < APIBase
    version 'v1', using: :path

    helpers V1::Helpers::AuthenticationHelper

    mount Users
    mount Purchases
  end
end
