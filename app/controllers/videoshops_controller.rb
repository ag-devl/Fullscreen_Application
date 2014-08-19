class VideoshopsController < ApplicationController
  before_action :set_videoshop, only: [:show, :edit, :update, :destroy]

  # GET /videoshops
  # GET /videoshops.json
  def index
    @videoshops = Videoshop.all
  end

  # GET /videoshops/1
  # GET /videoshops/1.json
  def show 
    @videoshop = Videoshop.find(params[:id])
    id = @videoshop.id
    x = @videoshop.views
    vw = Videoshop.update(id, :views => x+1)
    vw.save
  end

  # GET /videoshops/new
  def new
    @videoshop = Videoshop.new
  end

  # GET /videoshops/1/edit
  def edit
  end

  # POST /videoshops
  # POST /videoshops.json
  def create
    @videoshop = Videoshop.new(videoshop_params)

    respond_to do |format|
      if @videoshop.save
        format.html { redirect_to @videoshop, notice: 'Videoshop was successfully created.' }
        format.json { render :show, status: :created, location: @videoshop }
      else
        format.html { render :new }
        format.json { render json: @videoshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videoshops/1
  # PATCH/PUT /videoshops/1.json
  def update
    respond_to do |format|
      if @videoshop.update(videoshop_params)
        format.html { redirect_to @videoshop, notice: 'Videoshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @videoshop }
      else
        format.html { render :edit }
        format.json { render json: @videoshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videoshops/1
  # DELETE /videoshops/1.json
  def destroy
    @videoshop.destroy
    respond_to do |format|
      format.html { redirect_to videoshops_url, notice: 'Videoshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_videoshop
      @videoshop = Videoshop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def videoshop_params
      params.require(:videoshop).permit(:name, :videoid, :views, :prerollads)
    end
end
