# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_opendiploma_session_id'
  layout 'general'
  include LoginSystem
  model :user
  
  before_filter :disable_link_prefetching
   
private

   def disable_link_prefetching
      if request.env["HTTP_X_MOZ"] == "prefetch" 
         logger.debug "prefetch detected: sending 403 Forbidden" 
         render_nothing "403 Forbidden" 
         return false
      end
   end
  
  
end
