
class ManualsController < ApplicationController
  def index
    # @manuals = Manual.all
  end

  def new
    # @manual = Manual.new
  end

  # def create
  #   @manual = Manual.create(manual_params)
  #   if @manual.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # private
  # def manual_params
  #   params.require(:manual).permit(:name, :question, :answer)

  # end
end