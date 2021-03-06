class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /steps
  # GET /steps.json
  def index
    if current_user.admin == true
    @steps = Step.all
    else
      redirect_to root_path
    end
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
    if current_user.admin == false
      redirect_to root_path
    end
  end

  # GET /steps/new
  def new
    if current_user.admin == true
      @step = Step.new
    else
      redirect_to root_path
    end
  end

  # GET /steps/1/edit
  def edit
    if current_user.admin == false
      redirect_to root_path
    end
  end

  # POST /steps
  # POST /steps.json
  def create
    @step = Step.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to @step, notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    if current_user.admin == true
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    if current_user.admin == true
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def step_params
      params.require(:step).permit(:step_name)
    end
end
