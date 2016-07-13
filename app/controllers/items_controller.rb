class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to :back
  	else
  		redirect_to :back
  	end
  end

  def complete
  	@item = Item.find(params[:id])
  	@item.update_attributes(is_completed: @item.is_completed ^ true)
  	redirect_to :back
  end

  def destroy
  	@item = Item.find(params[:id])
  	@item.delete
  	redirect_to :back
  end

  private

  def item_params
  	params.require(:item).permit(:content , :is_completed , :user_id)
  end

end
