class WelcomeController < ApplicationController
  def index
    authenticate_user!
    @user = User.find(current_user)
    @items = @user.items
  end

  def contact
  end

  def destroy

      @user = User.find(current_user)
      @item = @user.items.find(params[:id])
 
          if @item.destroy
            flash[:notice] = "Item was deleted."

          else
       flash[:error] = "There was an error deleting the item."
          end

      respond_to do |format|
       format.html
       format.js
     end
   end


  
end
