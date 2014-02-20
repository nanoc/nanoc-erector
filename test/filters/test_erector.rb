# encoding: utf-8

require 'helper'

class Nanoc::Erector::FilterTest < Minitest::Test

  def test_filter
    # Create filter
    template = <<-EOF
      class ErectorTemplate < Erector::Widget
        def content
          html {
            head {
              title "My Page"
            }
            body {
              h1 "Hi, \#{@content}!"
            }
          }
        end
      end
    EOF
    layout = Nanoc::Layout.new(template, {}, '/default/')
    assigns = { :layout => layout, :content => 'Mr. Payne' }
    filter = ::Nanoc::Erector::Filter.new(assigns)

    # Run filter
    result = filter.setup_and_run("Mr. Payne")
    assert_equal '<html><head><title>My Page</title></head><body><h1>Hi, Mr. Payne!</h1></body></html>', result
  end

  def test_filter_outside_layout
    layout = Nanoc::Layout.new('dontcare', {}, '/default/')
    filter = ::Nanoc::Erector::Filter.new

    # Run filter
    assert_raises(Nanoc::Erector::Filter::OutsideLayoutError) do
      filter.setup_and_run("Mr. Payne")
    end
  end

end
