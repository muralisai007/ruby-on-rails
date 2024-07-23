class LeaveslistsController < ApplicationController
  before_action :set_leaveslist, only: [:show, :edit, :update, :destroy]

  def index
    @leaveslists = Leaveslist.all
  end

  def show
  end

  def new
    @leaveslist = Leaveslist.new
  end

  def create
    leaves_data = JSON.parse(params[:leaveslist][:leaves_data]) rescue {}
    @leaveslist = Leaveslist.new(employeelist_id: params[:leaveslist][:employeelist_id], leaves_data: leaves_data)

    respond_to do |format|
      if @leaveslist.save
        format.html { redirect_to @leaveslist, notice: 'Leaveslist was successfully created.' }
        format.json { render :show, status: :created, location: @leaveslist }
      else
        format.html { render :new }
        format.json { render json: @leaveslist.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def edit
  end

  def update
    leaves_data = JSON.parse(params[:leaveslist][:leaves_data]) rescue {}
    if @leaveslist.update(employeelist_id: params[:leaveslist][:employeelist_id], leaves_data: leaves_data)
      respond_to do |format|
        format.html { redirect_to @leaveslist, notice: 'Leaveslist was successfully updated.' }
        format.json { render :show, status: :ok, location: @leaveslist }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @leaveslist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @leaveslist.destroy
    respond_to do |format|
      format.html { redirect_to leaveslists_url, notice: 'Leaveslist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_leaveslist
    @leaveslist = Leaveslist.find(params[:id])
  end

  def leaveslist_params
    params.require(:leaveslist).permit(
      :employeelist_id,
      leaves_data: [
        default_leaves: Date::MONTHNAMES.compact.map(&:downcase),
        extra_leaves: Date::MONTHNAMES.compact.map(&:downcase),
        deductions: Date::MONTHNAMES.compact.map(&:downcase)
      ]
    )
  end
end
