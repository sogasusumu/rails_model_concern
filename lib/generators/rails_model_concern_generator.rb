# frozen_string_literal: true

class RailsModelConcernGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def valid!
    RailsModelConcern.valid!(name)
  end

  def generate
    template template_name, file_path
  end

  private

  # @return [String]
  def template_name
    'rails_concern.rb.erb'
  end

  using RailsConstNormalizer

  # @return [String]
  def klass
    name.to(:model_concern, :klass)
  end

  # @return [Pathname]
  def file_path
    Rails.root.join('app').join(name.to(:model_concern, :file_path))
  end
end
