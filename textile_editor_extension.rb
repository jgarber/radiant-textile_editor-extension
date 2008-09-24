# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class TextileEditorExtension < Radiant::Extension
  version "1.0"
  description "Places a toolbar above the textarea when Textile is the current input filter."
  url "http://yourwebsite.com/textile_editor"
  
  define_routes do |map|
    map.connect 'admin/textile_editor/:action', :controller => 'admin/textile_editor'
  end
  
  def activate
    # admin.tabs.add "Textile With Editor", "/admin/textile_with_editor", :after => "Layouts", :visibility => [:all]
    
    ApplicationController.send :include, TextileEditor::Ext::ApplicationController
    [Admin::PageController, Admin::SnippetController].each do |c| 
      c.send :before_filter, :include_textile_editor_assets
    end
    [:page, :snippet].each do |controller|
      admin.send(controller).edit.add :main, 'admin/page/link_popup'
      admin.send(controller).edit.add :main, 'admin/page/image_popup'
    end
    Admin::PageHelper.send :include, TextileEditor::Ext::Admin::PageHelper
  end
  
  def deactivate
    # admin.tabs.remove "Textile With Editor"
  end
  
end