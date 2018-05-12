class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy, :distribute, :add_single_month, :remove_single_month]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    # render plain: params[:bill].inspect
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to edit_bill_path(@bill), notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to edit_bill_path(@bill), notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clone
    bill = Bill.find(params[:id])
    @bill = bill.dup
    render 'new'
  end

  def distribute
    @bill.distribute_item_across_months(@bill)
    redirect_to edit_bill_path(@bill)
  end

  def add_single_month
    # render plain: params[:bill].inspect
    params[:bill][:month_ids] = params[:bill][:month_ids].reject(&:empty?)
    @bill.add_month_to_item(Month.find(params[:bill][:month_ids]), @bill)
    redirect_to edit_bill_path(@bill)
  end
  
  def remove_single_month
#     render plain: params[:bill].inspect
    @bill.months.destroy(params[:bill][:month_ids])
    redirect_to edit_bill_path(@bill)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:start_date, :end_date, :withdrawal_date, :amount, :name, :recurring, :annual_budget_id, :month_ids => [])
    end
end
