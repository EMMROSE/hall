class ShopCategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @shop_categories = ShopCategory.all
  end

  def new
    @shop_category = ShopCategory.new
  end

  def create
    @shop_category = ShopCategory.new(shop_category_params)
    if @shop_category.save
      redirect_to root_path
      flash[:notice] = "Cette nouvelle catégorie a bien été enregistrée."
    else
      render :new
      flash[:alert] = "Attention, votre nouvelle catégorie n'a pas été enregistrée."
    end
  end


  def destroy
    @shop_category = ShopCategory.find(params[:id])
    @shop_category.destroy
    redirect_to shop_categories_path
    flash[:notice] = "Cette catégorie a été supprimée."
  end

  private

  def shop_category_params
    params.require(:shop_category).permit(:name)
  end

end
