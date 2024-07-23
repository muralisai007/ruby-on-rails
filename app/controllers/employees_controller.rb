class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy,:employee_list]
  
  # GET /employees
  
    
 
  def index
    @employees = Employee.all
   respond_to do |format|
      format.html { render :index }
      format.js
      format.csv { send_data generate_csv(@employees), filename: "employees-#{Date.today}.csv" }
    end
  end

    
  

 
   
   def search
     @filtered_employees = Employee.where("status=? and salary >=? ", params["status"].to_i, params["salary"])
    
   end
 


  # GET /employees/1
   def show
  @employee = Employee.find(params[:id])
  
  respond_to do |format|
    format.html
    format.js { render partial: 'employee_list', locals: { employee: @employee } }
  end
end



  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
   def set_employee
   
    @employee = Employee.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
    def employee_params
    params.require(:employee).permit(:first_name, :last_name, :phone_no, :email, :date_of_birth, :aadhaar_input, :designation,:status ,:salary )
  end
end


