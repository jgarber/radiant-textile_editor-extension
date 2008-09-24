require File.dirname(__FILE__) + '/../test_helper'

class TextileWithEditorExtensionTest < Test::Unit::TestCase
  
  # Replace this with your real tests.
  def test_this_extension
    flunk
  end
  
  def test_initialization
    assert_equal File.join(File.expand_path(RAILS_ROOT), 'vendor', 'extensions', 'textile_with_editor'), TextileWithEditorExtension.root
    assert_equal 'Textile With Editor', TextileWithEditorExtension.extension_name
  end
  
end
