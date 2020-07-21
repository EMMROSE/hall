class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def research
    if params[:query].present?
      @owners = Owner.search_by_name(params[:query])
    else @owners = Owner.all
    end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to root_path
      flash[:notice] = "Propriétaire a été enregistré."
    else
      render :new
      flash[:alert] = "Veuillez compléter le formulaire s'il vous plaît."
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      redirect_to owner_path(@owner)
    else render :edit
    end
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    redirect_to owners_path
    flash[:notice] = "Propriétaire a été supprimé."
  end

  private

  def owner_params
    params.require(:owner).permit(:firstname, :lastname, :address, :email, :phone)
  end
end
