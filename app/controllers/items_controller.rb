class ItemsController < ApplicationController
	before_action :set_item, only: [:edit, :show, :update, :destroy]

	def index
		@items = Item.all
	end

	def new
		@item = Item.new

		@lists = List.all
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to list_path(id: @item.list_id)
		else
			render :text => "Item not saved."
		end
		
	end
	
	def show

	end

	def edit
		@lists = List.all
	end

	def update
		if @item.state == "complete"
			@item.state = "active"
		else
			@item.state = "complete"
		end
		@item.save
		redirect_to list_path(id: @item.list_id)
	end

	def destroy
    @item.destroy
    redirect_to list_path(id: @item.list_id)
  end

	private

	def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:name, :quantity, :list_id, :state)		
	end


end
