class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /collaborators
  # GET /collaborators.json
  def index
    if current_user.admin == true
      @collaborators = Collaborator.all
    else
      redirect_to root_path
    end
  end

  # GET /collaborators/1
  # GET /collaborators/1.json
  def show
    if current_user.admin == false
      redirect_to root_path
    end
  end

  # GET /collaborators/new
  def new
    if current_user.admin == true
      @collaborator = Collaborator.new
    else
      redirect_to root_path
    end
  end

  # GET /collaborators/1/edit
  def edit
    if current_user.admin == false
      redirect_to root_path
    end
  end

  # POST /collaborators
  # POST /collaborators.json
  def create
    @collaborator = Collaborator.new(collaborator_params)

    respond_to do |format|
      if @collaborator.save
        format.html { redirect_to @collaborator, notice: 'Collaborateur créé.' }
        format.json { render :show, status: :created, location: @collaborator }
      else
        format.html { render :new }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collaborators/1
  # PATCH/PUT /collaborators/1.json
  def update
    if current_user.admin == true
      respond_to do |format|
        if @collaborator.update(collaborator_params)
          format.html { redirect_to @collaborator, notice: 'Collaborateur mis à jour.' }
          format.json { render :show, status: :ok, location: @collaborator }
        else
          format.html { render :edit }
          format.json { render json: @collaborator.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /collaborators/1
  # DELETE /collaborators/1.json
  def destroy
    if current_user.admin == true
      @collaborator.destroy
      respond_to do |format|
        format.html { redirect_to collaborators_url, notice: 'Collaborateur supprimé.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collaborator_params
      params.require(:collaborator).permit(:collaborator_name, :collaborator_email, :image)
    end
end
