# frozen_string_literal: true

require 'rails_helper'

module Request
  module Helpers
    def auth_headers
      @auth_headers ||= user.create_new_auth_token
    end
  end
end
