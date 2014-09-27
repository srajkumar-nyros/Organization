class TodosController < ApplicationController
# GET /todos
  # GET /todos.json
  respond_to :json, :html
  def index
  	@todos = Todo.where( :user_id =>current_user.id)
    respond_with(@todos)
  end
  
  
  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])
    respond_with(@todo)
  end 

  # GET /todos
  # GET /todos.json
  def orgns
    @organizations = Organization.where( :user_id =>current_user.id)
    respond_with(@organizations)
  end 
 
  # GET /todos
  # GET /todos.json
  def persn
  	groups= Group.where(:organization_id => params[:organization_id])
  	@grps=[]
  	groups.each do |group|
  		@grps << group.id
  	end
    @people = Person.where(:group_id => @grps)
    respond_with(@people)
  end 

  # GET /todos
  # GET /todos.json
  def pple
  	org= Todo.where(:id => params[:todo_id]).first
  	groups= Group.where(:organization_id => org.organization_id)
  	@grps=[]
  	groups.each do |group|
  		@grps << group.id
  	end
    @people = Person.where(:group_id => @grps)
    respond_with(@people)
  end 


  # todo /todos
  # todo /todos.json
  def create
		@todo_find = Todo.find_by_task(params[:task])
		if @todo_find.nil?
	    @todo = Todo.new({:task => params[:task], :description => params[:description], :user_id => current_user.id, :organization_id => params[:organization_id], :person_id => params[:person_id] })
  	  @todo.save
  	  respond_with(@todo)
		else
			respond_with(@todo_find)
		end
  end




  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])
    respond_to do |format|
      if @todo.update_attributes({:task => params[:task], :description => params[:description], :organization_id => params[:organization_id], :person_id => params[:person_id] })
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end

end
