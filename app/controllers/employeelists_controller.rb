class EmployeelistsController < ApplicationController
  before_action :set_employeelist, only: [:show, :edit, :update, :update_salaries]

  def index
    @employeelists = Employeelist.all

    @employeelists = @employeelists.where("concat(first_name, ' ', last_name) LIKE ?", "%#{params[:name]}%") if params[:name].present?
    @employeelists = @employeelists.where(status: params[:status]) if params[:status].present?
    @employeelists = @employeelists.where("salary >= ?", params[:salary]) if params[:salary].present?
    @employeelists = @employeelists.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.json { render json: @employeelists }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @employeelist }
    end
  end

  def new
    @employeelist = Employeelist.new
  end

  def create
    @employeelist = Employeelist.new(employeelist_params)

    respond_to do |format|
      if @employeelist.save
        format.html { redirect_to employeelist_url(@employeelist), notice: 'Employeelist was successfully created.' }
        format.json { render :show, status: :created, location: @employeelist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employeelist.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @employeelist.update(employeelist_params)
      respond_to do |format|
        format.html { redirect_to @employeelist, notice: 'Employeelist was successfully updated.' }
        format.json { render json: @employeelist, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @employeelist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_salaries
    if @employeelist.update(employeelist_params)
      render json: { message: 'Salaries updated successfully' }, status: :ok
    else
      render json: { errors: @employeelist.errors.full_messages }, status: :unprocessable_entity
    end
  end

 def calculate
    extra_leaves = params[:extra_leaves].to_f
    salary = params[:salary].to_f

    script_path = Rails.root.join('app', 'javascript', 'salary.js')
    command = "node -e 'console.log(JSON.stringify(require(\\\"#{script_path}\\\")(\"#{extra_leaves}\", \"#{salary}\")))'"

    output, status = Open3.capture2(command)

    if status.success?
      result = JSON.parse(output)
      render json: result
    else
      render json: { error: 'Calculation error' }, status: 500
    end
  end

  def destroy
    @employeelist.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employeelist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def employeelist_params
    params.require(:employeelist).permit(:first_name, :last_name, :phone_no, :email, :date_of_birth, :aadhaar_input, :designation, :status, :salary, :extra_leaves, :salary_disbursed, :deductions, :adjusted_salary, :total_annual_salary)
  end

  def set_employeelist
    @employeelist = Employeelist.find(params[:id])
  end
end
