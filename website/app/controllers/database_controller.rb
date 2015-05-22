class DatabaseController < ApplicationController
  
  def execute
    @query = params[:command]
    
    @query = @query.sub('\n','')

    @result = ActiveRecord::Base.establish_connection("postgres://student:123@localhost/" + $database).connection.execute(@query)
    ActiveRecord::Base.establish_connection("postgres://daniel:12345@localhost/dbonline")
    
    if @result.cmd_tuples > 0 && !(@query.start_with?("select"))
      #Faz um snapshot do banco atual
      @newsnap = Snapshot.create(:user_id => $currentUserId, :description => @query.to_s, 
                                 :db_id => Database.where(:db_image => $database).first.id)
      @final= "<table class='table table-bordered table-striped'><tr><td><b>Table updated!</b></td></tr></table>"
      
    else
      #Inicia tabela
      @final = "<table class='table table-bordered table-striped'>"
      @final += "<tr>"

      #Cria codigo da tabela para colunas
      (0..(@result.nfields-1)).each do |i|
        @final += "<td><b>"
        @final += @result.fields[i].to_s
        @final += "</b></td>"
      end

      @final += "</tr>"

      #Cria codigo da tabela para os dados
      (0..(@result.cmd_tuples-1)).each do |i|
        @final += "<tr>"
        (0..(@result.nfields-1)).each do |j|
          @final += "<td>"
          @final += @result.getvalue(i,j).to_s
          @final += "</td>"
        end
        @final += "</tr>"
      end

      @final += "</table>"
    
    end
    
    #Responde como html
    respond_to do |format|
      format.html { render :inline => @final }
    end  
  end
end
