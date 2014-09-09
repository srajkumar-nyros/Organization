class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @sgroups=Organization.first.groups
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
    @skil=@skill
    @sgroups=@skill.group.organization.groups.all
  end

  def s_group_list
    @sgroups=Group.where(:organization_id => params[:orgid])
    render partial: "s_group_list"
  end
  
  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)
    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill }
        format.json { render :show, status: :created, location: @skill }
      else
        @sgroups=Organization.first.groups
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill }
        format.json { render :show, status: :ok, location: @skill }
      else
        @sgroups=@skill.group.organization.groups.all
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:name, :description, :group_id)
    end
end
