module TextileEditor
  module Ext
    module ApplicationController

      def include_textile_editor_assets
        include_stylesheet('textile-editor') 
        include_javascript('textile-editor')
        include_javascript('textile-editor-radiant')
        include_stylesheet('transform') 
      end
    end
  end
end