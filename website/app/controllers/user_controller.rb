class UserController < ApplicationController
  
  $currentUserId
  
  def changeUser
    @userId = params[:id]
    
    $currentUserId = @userId
    
    redirect_to :back
  end
  
end
