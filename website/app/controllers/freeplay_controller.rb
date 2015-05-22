class FreeplayController < ApplicationController
  
  $database
  
  def index
    
    $database = params[:id]
    
  end
  
  def load
    @snapId = params[:id]
    
    @snap = Snapshot.find(@snapId)

    @db = Database.find(@snap.db_id)

    redirect_to '/freeplay/' + @db.db_image.to_s

  end
  
end
