class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy, :add_single_month, :remove_single_month]

  # GET /incomes
  # GET /incomes.json
  def index
    @incomes = Income.all

  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
  end

  # GET /incomes/new
  def new
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(income_params)

    respond_to do |format|
      if @income.save
        format.html { redirect_to edit_income_path(@income), notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to edit_income_path(@income), notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_url, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clone
    income = Income.find(params[:id])
    @income = income.dup
    render 'new'
  end

  def add_single_month
    # render plain: params[:bill].inspect
    params[:income][:month_ids] = params[:income][:month_ids].reject(&:empty?)
    @income.add_month_to_item(Month.find(params[:income][:month_ids]), @income)
    redirect_to edit_income_path(@income)
  end
  
  def remove_single_month
#     render plain: params[:income].inspect
    @income.months.destroy(params[:income][:month_ids])
    redirect_to edit_income_path(@income)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_income 
    @income = Income.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def income_params
    params.require(:income).permit(:source, :pay_date, :gross_amount, :use_month, :start_date, :end_date, :recurring, :federal_tax, :state_tax, :social_sec_tax, :medicare_tax, :net_amount, :annual_budget_id, :month_ids => [])
  end
end
