class ItemsController < ApplicationController

  def new
      @item = Item.new
  end

  def index
    @items = Item.all
  end


      def create
      @item = Item.new(item_params)
        if @item.save
          flash[:notice] = "Item was saved."
          render @items
        else 
          flash[:error] = "There was an error saving your item. Please try again."
          render :new
        end
      end

def destroy
     @item = Item.find(params[:id])
 
          if @item.destroy
            flash[:notice] = "Item was deleted."
            render :index
          end
   end



  private

  def item_params
    params.require(:item).permit(:name)
  end

end
