class ListsController < ApplicationController

	def index
		@lists = List.all		
	end

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_params)

		if @list.save
			redirect_to :lists => :index
		else
			render :text => "List not saved."
		end
	end

	def show
		@list = List.find_by_id(params[:id])
		@items = Item.all
		
	end

	def edit
		@list = List.find_by_id(params[:id])
		@items = Item.all
	end

	def destroy
		@list = List.find_by_id(params[:id])
    @list.destroy
    redirect_to :lists
  end

private

	def list_params
		params.require(:list).permit(:name)		
	end
end
