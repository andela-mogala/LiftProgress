class LiftsController < ApplicationController
  def index
    @lifts = Lift.all
  end

  def create
    @lift = Lift.new(lift_params)
    if @lift.save
      render json: @lift
    else
      render json: @lift.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @lift = Lift.find(params[:id])
    @lift.destroy
    head :no_content
  end

  private
  def lift_params
    params
      .require(:lift)
      .permit(
        :date,
        :lift_name,
        :is_metric,
        :weight_lifted,
        :reps_performed,
        :one_rm
      )
    end
end
