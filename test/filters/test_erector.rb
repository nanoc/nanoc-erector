# encoding: utf-8

require 'helper'

class Nanoc::Erector::FilterTest < Minitest::Test

  TEMPLATE = <<-EOF
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

  def test_filter
    # Create filter
    layout = Nanoc::Int::Layout.new(TEMPLATE, {}, '/default/')
    assigns = { :layout => layout, :content => 'Mr. Payne' }
    filter = ::Nanoc::Erector::Filter.new(assigns)

    # Run filter
    result = filter.setup_and_run("Mr. Payne")
    assert_equal '<html><head><title>My Page</title></head><body><h1>Hi, Mr. Payne!</h1></body></html>', result
  end

  def test_filter_outside_layout
    layout = Nanoc::Int::Layout.new('dontcare', {}, '/default/')
    filter = ::Nanoc::Erector::Filter.new

    # Run filter
    assert_raises(Nanoc::Erector::Filter::OutsideLayoutError) do
      filter.setup_and_run("Mr. Payne")
    end
  end

  def test_filter_undefined_second_time
    # Run once
    layout = Nanoc::Int::Layout.new(TEMPLATE, {}, '/default/')
    assigns = { :layout => layout, :content => 'Mr. Payne' }
    filter = ::Nanoc::Erector::Filter.new(assigns)
    filter.setup_and_run("Mr. Payne")

    # Run again, but fail this time
    layout = Nanoc::Int::Layout.new('$fun = :friday', {}, '/default/')
    assigns = { :layout => layout, :content => 'Mr. Payne' }
    filter = ::Nanoc::Erector::Filter.new(assigns)
    assert_raises(NameError) do
      filter.setup_and_run("Mr. Payne")
    end
  end

  def test_filter_with_undefined_custom_name
    layout = Nanoc::Int::Layout.new(TEMPLATE.sub('ErectorTemplate', 'Foo'), {}, '/default/')
    assigns = { :layout => layout, :content => 'Mr. Payne' }
    filter = ::Nanoc::Erector::Filter.new(assigns)
    assert_raises(NameError) do
      filter.setup_and_run("Mr. Payne")
    end
  end

end
