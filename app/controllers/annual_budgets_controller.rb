class AnnualBudgetsController < ApplicationController
  before_action :set_annual_budget, only: [:show, :edit, :update, :destroy, :make_months]

  # GET /annual_budgets
  # GET /annual_budgets.json
  def index
    @annual_budgets = AnnualBudget.all
  end

  # GET /annual_budgets/1
  # GET /annual_budgets/1.json
  def show
    @months = Month.where(annual_budget_id: @annual_budget.id)
    @leftovers = @annual_budget.incomes.sum(&:net_amount) - (@annual_budget.bills.sum(&:amount) + @annual_budget.savings.sum(&:amount))
  end

  # GET /annual_budgets/new
  def new
    @annual_budget = AnnualBudget.new
  end

  # GET /annual_budgets/1/edit
  def edit
  end

  # POST /annual_budgets
  # POST /annual_budgets.json
  def create
    @annual_budget = AnnualBudget.new(annual_budget_params)
    # render plain: params[:annual_budget].inspect

    respond_to do |format|
      if @annual_budget.save
        @annual_budget.generate_months
        format.html { redirect_to @annual_budget, notice: 'Annual budget was successfully created.' }
        format.json { render :show, status: :created, location: @annual_budget }
      else
        format.html { render :new }
        format.json { render json: @annual_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annual_budgets/1
  # PATCH/PUT /annual_budgets/1.json
  def update
    respond_to do |format|
      if @annual_budget.update(annual_budget_params)
        format.html { redirect_to @annual_budget, notice: 'Annual budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @annual_budget }
      else
        format.html { render :edit }
        format.json { render json: @annual_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annual_budgets/1
  # DELETE /annual_budgets/1.json
  def destroy
    @annual_budget.destroy
    respond_to do |format|
      format.html { redirect_to annual_budgets_url, notice: 'Annual budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annual_budget
      @annual_budget = AnnualBudget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annual_budget_params
      params.require(:annual_budget).permit(:name, :year)
    end
end
