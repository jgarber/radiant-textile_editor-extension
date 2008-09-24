class TextileEditorController < ApplicationController

  def link_popup
    render :update do |page|
      page.insert_html :bottom, 'popups', :partial => 'link_popup'
      page << "center($('link-popup'));"
      page.show 'link-popup'
    end
  end

end