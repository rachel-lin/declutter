class ItemsController < ApplicationController

  def new
      @item = Item.new
  end


      def create
      @item = Item.new(item_params)
        if @item.save
          flash[:notice] = "Item was saved."
          redirect_to @item
        else 
          flash[:error] = "There was an error saving your item. Please try again."
          render :new
        end
      end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
