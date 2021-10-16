# frozen_string_literal: true

module V1
  class Base < APIBase
    version 'v1', using: :path

    mount Users
  end
end
