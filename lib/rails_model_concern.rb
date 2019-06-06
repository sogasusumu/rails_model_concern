# frozen_string_literal: true

require 'rails_model_concern/railtie'
require 'rails_model_concern/extender'

module RailsModelConcern
  class << self

    using RailsModelConcern::Extender

    def valid!(name)
      name.valid? ? name : raise("invalid argument.")
    end
  end
end
