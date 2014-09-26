class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  respond_to :json, :html
  def index
    todo = Todo.find(params[:id])
    respond_with(@comments = todo.comments)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
    respond_with(@comment)
  end

  
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new()
    @comment.comment = params[:comment]
    @comment.todo_id = params[:todo_id]
    @comment.save
    todo = Todo.find(@comment.todo_id)
		@comments = todo.comments.all
    respond_with(todo)
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
  
end
