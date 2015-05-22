class ForumController < ApplicationController
  
  $currentForumId
  
  def index

    @themes = Theme.all
    @forums = Forum
    
  end
  
  def question
    @questionid = params[:id]
    
    @forum = Forum.find(@questionid)
    
    $currentForumId = @forum.id
    
    @interactions = Interaction.where(:forum_id => @questionid)
  end
  
  def new
    @themes = Theme.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end
  
  def save
    @description = params[:description]
    @name = params[:name]
    @question = params[:question]
    @snap = params[:snap]
    @theme = params[:theme]
    
    @forum = Forum.new
    @forum.name = @name
    @forum.description = @description
    @forum.theme_id = Theme.where(:name => @theme).first.id
    @forum.save
    
    @interaction = Interaction.new
    @interaction.user_id = $currentUserId
    if(@snap != nil)
      @interaction.snap_id = Snapshot.where(:user_id => $currentUserId).order("id DESC").first.id
    end
    @interaction.description = @question
    @interaction.forum_id = @forum.id
    @interaction.save
    
    respond_to do |format|
        format.html { redirect_to "/forum"}
      end
  end
  
end
