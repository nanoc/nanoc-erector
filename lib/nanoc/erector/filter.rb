# encoding: utf-8

require 'erector'

module Nanoc::Erector

  class Filter < Nanoc::Filter

    class OutsideLayoutError < ::Nanoc::Errors::GenericTrivial

      def message
        'The erector filter can only be used as a layout filter.'
      end

    end

    identifier :erector

    def run(content, params={})
      if @assigns[:layout].nil?
        raise OutsideLayoutError
      end

      template = params.fetch(:class, 'ErectorTemplate')
      options = params.fetch(:erector, {})

      eval(@assigns[:layout].raw_content, TOPLEVEL_BINDING, filename)
      Object.const_get(template).new(assigns).to_html(options)
    end

  end

end
