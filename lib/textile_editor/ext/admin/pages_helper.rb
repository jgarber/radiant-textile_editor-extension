module TextileEditor
  module Ext
    module Admin::PagesHelper
      
      def self.included(receiver)
        receiver.send :alias_method_chain, :page_edit_javascripts, :textile_editor
      end
      
      def page_edit_javascripts_with_textile_editor
        page_edit_javascripts_without_textile_editor + <<-CODE
        if (typeof partAdded === 'function') {
          partAdded = partAdded.wrap(
            function(partAdded_without_textile_editor_observation) {
              var partName = $F('part_name_field');
              var page = 'page_' + partName.toSlug();
              partAdded_without_textile_editor_observation();
              new filterObserver( $(page).getElementsByClassName('textarea')[0] );
            });
        }
        
        CODE
      end
      
    end
  end
end
