class TodosController < ApplicationController
# GET /todos
  # GET /todos.json
  respond_to :json, :html
  def index
  	@todos = Todos.where( :user_id =>current_user.id)
    respond_with(@todos)
  end
  
  
  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todos.find(params[:id])
    respond_with(@todo)
  end 
  
 
  # todo /todos
  # todo /todos.json
  def create
		@todo_find = Todos.find_by_task(params[:task])
		if @todo_find.nil?
	    @todo = Todos.new({:task => params[:task], :description => params[:description], :user_id => current_user.id })
  	  @todo.save
  	  respond_with(@todo)
		else
			respond_with(@todo_find)
		end
  end



  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes({:task => params[:task], :description => params[:description]})
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
    @todo = Todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end
end
