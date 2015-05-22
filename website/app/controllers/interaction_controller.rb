class InteractionController < ApplicationController
  
  $upperDescription
  $forumId
  
  def new
    $forumId = params[:forumId]
    $upperDescription = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end
  
  def save
    @description = params[:description]
    @snap = params[:snap]
    
    @interaction = Interaction.new
    @interaction.user_id = $currentUserId
    
    if(@snap != nil)
      if(Snapshot.where(:user_id => $currentUserId).count > 0)
        @interaction.snap_id = Snapshot.where(:user_id => $currentUserId).order(:id).first.id
      end
    end
    if($upperDescription != nil)
      @interaction.upper_interaction = $upperDescription.to_s
    end
    @interaction.description = @description.to_s
    @interaction.forum_id = $forumId.to_s
    @interaction.save
    
    
    respond_to do |format|
        format.html { redirect_to "/forum/" + $forumId }
      end
  end
  
end
