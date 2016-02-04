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
			redirect_to controller: "lists", action: "show", id: @item.list_id
		else
			render :text => "Item not saved."
		end
		
	end
	
	def show
		@item = Item.find(params[:id])		
	end

	def edit
		@lists = List.all
	end

	def update
		@item = Item.find(params[:id])
		@id = @item.list_id
			if @item.state == "complete"
				@item.state = "active"
			else
				@item.state = "complete"
			end
		@item.save
		redirect_to controller: "lists", action: "show", id: @id
	end

	def destroy
		@item = Item.find(params[:id])
		@id = @item.list_id
    @item.destroy
    redirect_to controller: "lists", action: "show", id: @id
  end

	private

	def item_params
		params.require(:item).permit(:name, :quantity, :list_id, :state)		
	end


end
