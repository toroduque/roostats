class EarningsController < ApplicationController

  before_action :authenticate_rider!
  before_action :find_rider
  before_action :find_riders, :only => [ :new, :create, :edit, :update ]

  def index
    @earnings = @rider.earnings.sorted
    @totalEarnings = @earnings.sum(:total_earnings)
  end

  def show
    @earning = Earning.find(params[:id])
  end

  def new
    @earning = Earning.new(:rider_id => @rider.id)
  end

  def create
    @earning = Earning.new(earning_params)
    @earning.rider_id = @rider.id
    @earning.total_earnings = (@earning.hours.to_f * @rider.contract.salary_hour.to_f) + (@earning.orders.to_f * 2.5) + (@earning.tips.to_f)
    if @earning.save
      flash[:notice] = "Earning recorded successfuly"
      redirect_to(earnings_path(:rider_id => @rider.id))
    else
      puts(@earning.errors.full_messages)
      render('new')
    end
  end

  def edit
    @earning = Earning.find(params[:id])
  end

  def update
    @earning = Earning.find(params[:id])
    @earning.total_earnings = ((@earning.hours.to_f * @rider.contract.salary_hour) + (@earning.orders * 2.5) + (@earning.tips))
    if @earning.update_attributes(earning_params)
      flash[:notice] = "Record edited successfuly"
      redirect_to(earnings_path(@earning, :rider_id => @rider.id))
    else
      puts(@earning.errors.full_messages)
      render('edit')
    end
  end

  def delete
    @earning = Earning.find(params[:id])
  end

  def destroy
    @earning = Earning.find(params[:id])
    if @earning.destroy
      flash[:notice] = "Record deleted successfuly"
      redirect_to(earnings_path(:rider_id => @rider.id))
    else
      flash[:notice] = "Record could not be deleted"
      render 'delete'
    end
  end

  private

  def find_rider
    @rider = Rider.find(params[:rider_id])
  end

  def find_riders
    @riders = Rider.sorted
  end

  def earning_params
    params.require(:earning).permit(:rider_id,:earnings_date, :hours, :orders, :tips, :total_earnings)
  end

end
