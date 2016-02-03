class ItemsController < ApplicationController

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
			redirect_to :items => :index
		else
			render :text => "Item not saved."
		end
		
	end
	
	def show
		@item = Item.find_by_id(:id)
		
	end

	def edit
		@lists = List.all
	end

	private

	def item_params
		params.require(:item).permit(:name, :quantity, :list_id)		
	end


end
