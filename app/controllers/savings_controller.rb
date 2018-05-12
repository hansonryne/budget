class SavingsController < ApplicationController
  before_action :set_saving, only: [:show, :edit, :update, :destroy, :distribute, :add_single_month, :remove_single_month]

  # GET /savings
  # GET /savings.json
  def index
    @savings = Saving.all
  end

  # GET /savings/1
  # GET /savings/1.json
  def show
  end

  # GET /savings/new
  def new
    @saving = Saving.new
  end

  # GET /savings/1/edit
  def edit
  end

  # POST /savings
  # POST /savings.json
  def create
    @saving = Saving.new(saving_params)

    respond_to do |format|
      if @saving.save
        format.html { redirect_to edit_saving_path(@saving), notice: 'Saving was successfully created.' }
        format.json { render :show, status: :created, location: @saving }
      else
        format.html { render :new }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savings/1
  # PATCH/PUT /savings/1.json
  def update
    respond_to do |format|
      if @saving.update(saving_params)
        format.html { redirect_to edit_saving_path(@saving), notice: 'Saving was successfully updated.' }
        format.json { render :show, status: :ok, location: @saving }
      else
        format.html { render :edit }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savings/1
  # DELETE /savings/1.json
  def destroy
    @saving.destroy
    respond_to do |format|
      format.html { redirect_to savings_url, notice: 'Saving was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clone
    saving = Saving.find(params[:id])
    @saving = saving.dup
    render 'new'
  end
  
  def distribute
    @saving.distribute_item_across_months(@saving)
    redirect_to edit_saving_path(@saving)
  end

  def add_single_month
    params[:saving][:month_ids] = params[:saving][:month_ids].reject(&:empty?)
    #render plain: params[:saving].inspect
    @saving.add_month_to_item(Month.find(params[:saving][:month_ids]), @saving)
    redirect_to edit_saving_path(@saving)
  end
  
  def remove_single_month
#     render plain: params[:saving].inspect
    @saving.months.destroy(params[:saving][:month_ids])
    redirect_to edit_saving_path(@saving)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving
      @saving = Saving.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saving_params
      params.require(:saving).permit(:category, :amount, :name, :recurring, :save_date, :annual_budget_id, :month_ids => [])
    end
end
