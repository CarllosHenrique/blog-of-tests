class PeopleController < ApplicationController
  before_action :find_people, only: [:edit, :update, :show, :destroy, :delete]

  def new
    @person = Person.new
  end

  def create
    if admin_signed_in?
      @person = current_admin.person.create(person_params)
    else
      @person = Person.create(person_params)
    end
    
    if @person.save
      flash[:success] = 'A pessoa foi cadastrada com sucesso'
      redirect_to root_path
    else
      flash[:danger] = 'Fudeo negão deu ruim'
      render :new
    end
  end

  def show
  end

  def update
    if admin_signed_in?
      @person.update(person_params)
      flash[:success] = "O usuario #{@person.name} foi editado com sucesso"
      redirect_back_or_to root_path
    else
      redirect_back_or_to root_path
      flash[:danger] = "Você não é um admin para editar"
    end
  end

  def edit
    if not admin_signed_in?
      redirect_back_or_to root_path
      flash[:danger] = "Você não é um admin para excluir"
    end
  end

  def delete
  end

  def destroy
    if admin_signed_in?
      @person.destroy
      flash[:success] = "O usuario #{@person.name} foi removido com sucesso"
      redirect_back_or_to root_path
    else
      redirect_back_or_to root_path
      flash[:danger] = "Você não é um admin para excluir"
    end
  end

  def all
    @all_peoples = Person.all
  end

  private

  def person_params
    params.require(:person).permit(:name, :age, :announcement)
  end

  def find_people
    @person = Person.find(params[:id])
  end
end
