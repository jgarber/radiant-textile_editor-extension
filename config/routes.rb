ActionController::Routing::Routes.draw do |map|
  map.connect 'admin/textile_editor/:action', :controller => 'admin/textile_editor'
end
