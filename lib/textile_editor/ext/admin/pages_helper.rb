module TextileEditor
  module Ext
    module Admin::PagesHelper
      
      def self.included(receiver)
        receiver.send :alias_method_chain, :page_edit_javascripts, :textile_editor
      end
      
      def page_edit_javascripts_with_textile_editor
        page_edit_javascripts_without_textile_editor + <<-CODE
        part_added_without_textile_editor_observation = part_added;
        function part_added_with_textile_editor_observation() {
          var index = parseInt($('part-index-field').value) + 1;
          var page = 'page-' + index;
          part_added_without_textile_editor_observation();
          new filterObserver( $(page).getElementsByClassName('textarea')[0] );
        }
        part_added = part_added_with_textile_editor_observation;
        
        CODE
      end
      
    end
  end
end