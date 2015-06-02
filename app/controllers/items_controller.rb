class ItemsController < ApplicationController

  def new
      @item = Item.new
  end


      def create
      @user = User.find(params[:user_id])
      @item = @user.items.build(item_params)
        if @item.save
          flash[:notice] = "Item was saved."
          redirect_to :root
        else 
          flash[:error] = "There was an error saving your item. Please try again."
          render :new
        end
      end

def destroy

      @user = User.find(params[:user_id])
      @item = @user.items.find(params[:id])
 
          if @item.destroy
            flash[:notice] = "Item was deleted."
            redirect_to :root
          else
       flash[:error] = "There was an error deleting the item."
          redirect_to :root
          end


   end



  private

  def item_params
    params.require(:item).permit(:name)
  end

end
