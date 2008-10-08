require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/page/edit" do
  scenario :users_and_pages
  
  before do
    assigns[:page] = pages(:home)
    assigns[:meta] = []
    assigns[:buttons_partials] = []
    render '/admin/page/edit'
  end
  
  it "should have image and link popups" do
    response[:popups].should have_image_popup
    response[:popups].should have_link_popup
  end
  
  it "should not show attachments in the popups without the page_attachments extension" do
     response[:popups].should have_image_popup do
       response[:popups].should_not have_attachment_radio_button
       response[:popups].should_not have_image_select
     end
     response[:popups].should have_link_popup do
       response[:popups].should_not have_attachment_radio_button
       response[:popups].should_not have_attachment_select
     end
   end
end

describe '/admin/page/edit when page_attachments extension is installed' do
  scenario :users_and_pages
  
  before do
    @page = pages(:home)
    assigns[:page] = @page
    assigns[:meta] = []
    assigns[:buttons_partials] = []
  end
  
  it "should display attachment options in the link and image popups" do
    @attachment = mock("attachment one")
    @attachment.stub!(:filename).and_return("test.jpg")
    assigns[:page].stub!(:attachments).and_return([@attachment])
    render '/admin/page/edit'
    
    response[:popups].should have_image_popup do
      response[:popups].should have_attachment_radio_button
      response[:popups].should have_image_select
    end
    response[:popups].should have_link_popup do
      response[:popups].should have_attachment_radio_button
      response[:popups].should have_attachment_select
    end
  end
  
  it "should show a helpful message instead of a select because there are no attachments" do
    assigns[:page].stub!(:attachments).and_return([])
    render '/admin/page/edit'
    
    response[:popups].should have_image_popup do
      response[:popups].should have_attachment_radio_button
      response[:popups].should_not have_image_select
      response[:popups].should have_tag("div#image_transform_input_attachment", /There are no images attached to this page./)
    end
    response[:popups].should have_link_popup do
      response[:popups].should have_attachment_radio_button
      response[:popups].should_not have_attachment_select
      response[:popups].should have_tag("div#transform_input_attachment", /There are no files attached to this page./)
      
    end
  end
end

def have_image_popup
  have_tag('div#image-popup')
end
def have_link_popup
  have_tag("div#link-popup")
end
def have_attachment_radio_button
  have_tag("input[name=?][value=?]", "transform_choice", "attachment")
end
def have_image_select
  have_tag("select#img_attachment_text")
end
def have_attachment_select
  have_tag("select#attachment_text")
end