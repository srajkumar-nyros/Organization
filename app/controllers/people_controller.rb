class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.where( :user_id =>current_user.id)
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    org=Organization.where( :user_id =>current_user.id)
    if org.nil?
    @groups=org.first.groups
    @skills=@groups.first.skills
    else
    @groups=Group.where( :user_id =>current_user.id)
    @skills=Skill.where( :user_id =>current_user.id)
    end
    
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    @prn=@person
    @groups=@person.group.organization.groups.all
    @skills=@person.group.skills.all
  end
   
  def group_list
    @groups=Group.where(:organization_id => params[:orgid])
    render partial: "group_list"
  end
  
  def skill_list
    @skills=Skill.where(:group_id => params[:groupid])
    render partial: "skill_list"
  end  
  
  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    @person.user_id= current_user.id 
    respond_to do |format|
      if @person.save
        if params[:skillid]!=nil
        params[:skillid].each do |i| 
		  @person.skills << Skill.find_by_id(i)
		end
		end
        format.html { redirect_to @person }
        format.json { render :show, status: :created, location: @person }
      else
        org=Organization.where( :user_id =>current_user.id)
		if org.nil?
		@groups=org.first.groups
		@skills=@groups.first.skills
		else
		@groups=Group.where( :user_id =>current_user.id)
		@skills=Skill.where( :user_id =>current_user.id)
        end
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        @person.skills.delete_all
        if params[:skillid]!= nil
        params[:skillid].each do |i| 
		  @person.skills << Skill.find_by_id(i)
		end
		end
        format.html { redirect_to @person }
        format.json { render :show, status: :ok, location: @person }
      else
        @groups=@person.group.organization.groups.all
        @skills=@person.group.skills.all
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.skills.delete_all
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :qualification, :group_id)
    end
end
