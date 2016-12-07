class RidersController < ApplicationController

  before_action :authenticate_rider!, :except => [:new, :create]

  def index
    @contracts = Contract.all
    @riders = Rider.sorted
  end

  def profile
    @rider = Rider.find(params[:id])
  end

  def new
    @rider = Rider.new
    @rider.build_contract
  end

  def create
    @rider = Rider.new(rider_params)
    assign_contract_salaries(@rider.contract.vehicle)
    if @rider.save
      flash[:notice] = "Success!"
      redirect_to riders_path
    else
    puts @rider.contract.errors.full_messages
    render 'new'
    end
  end

  def edit
    @rider = Rider.find(params[:id])
  end

  def update
    @rider = Rider.find(params[:id])
    if @rider.update_attributes(rider_params)
      flash[:notice] = "Rider has been updated"
      redirect_to(riders_path)
    else
      render('edit')
    end
  end

  def delete
    @rider = Rider.find(params[:id])
  end

  def destroy
    @rider = Rider.find(params[:id])
    if @rider.destroy
      flash[:notice] = "Rider has been deleted"
      redirect_to(riders_path)
    else
      render('delete')
    end
  end

  private

  def rider_params
    params.require(:rider).permit(:first_name, :last_name, :email, :city, :password, contract_attributes: [:contract_type, :vehicle, :salary_hour, :salary_dropoff] )
  end

  def assign_contract_salaries(vehicle_type)
    if vehicle_type == 'Bicycle'
      then @rider.contract.salary_hour = 16
           @rider.contract.salary_dropoff = 9
    elsif vehicle_type == 'Scooter'
      then @rider.contract.salary_hour = 17
           @rider.contract.salary_dropoff = 10
    end
  end

end
