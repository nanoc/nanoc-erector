# encoding: utf-8

require 'erector'

module Nanoc::Erector

  class Filter < Nanoc::Filter

    class OutsideLayoutError < ::StandardError

      def message
        'The erector filter can only be used as a layout filter.'
      end

    end

    identifier :erector

    def run(content, params={})
      if @assigns[:layout].nil?
        raise OutsideLayoutError
      end

      class_name = params.fetch(:class, 'ErectorTemplate').to_sym
      options = params.fetch(:erector, {})

      begin
        klass = Object.const_get(class_name)
        Object.send(:remove_const, class_name)
      rescue NameError
      end

      eval(@assigns[:layout].content.string, TOPLEVEL_BINDING, filename)
      Object.const_get(class_name).new(assigns).to_html(options)
    end

  end

end
