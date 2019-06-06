# frozen_string_literal: true

module RailsModelConcern
  module Extender
    refine String do
      def valid?
        [valid_format?, valid_route_counts?, valid_model_counts?].all?
      end

      def valid_format?
        match?(format_reg)
      end

      def format_reg
        /.+#.+-.+/
      end

      def route_counts
        match(/#/).length
      end

      def valid_route_counts?
        route_counts == 1
      end

      def model_counts
        match(/-/).length
      end

      def valid_model_counts?
        model_counts == 1
      end
    end
  end
end
