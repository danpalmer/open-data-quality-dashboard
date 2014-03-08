class ScoreCriteriaController < ApplicationController
  before_action :set_score_criterium, only: [:show, :edit, :update, :destroy]

  # GET /score_criteria
  # GET /score_criteria.json
  def index
    @score_criteria = ScoreCriterium.all
  end

  # GET /score_criteria/1
  # GET /score_criteria/1.json
  def show
  end

  # GET /score_criteria/new
  def new
    @score_criterium = ScoreCriterium.new
  end

  # GET /score_criteria/1/edit
  def edit
  end

  # POST /score_criteria
  # POST /score_criteria.json
  def create
    @score_criterium = ScoreCriterium.new(score_criterium_params)

    respond_to do |format|
      if @score_criterium.save
        format.html { redirect_to @score_criterium, notice: 'Score criterium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @score_criterium }
      else
        format.html { render action: 'new' }
        format.json { render json: @score_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /score_criteria/1
  # PATCH/PUT /score_criteria/1.json
  def update
    respond_to do |format|
      if @score_criterium.update(score_criterium_params)
        format.html { redirect_to @score_criterium, notice: 'Score criterium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @score_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /score_criteria/1
  # DELETE /score_criteria/1.json
  def destroy
    @score_criterium.destroy
    respond_to do |format|
      format.html { redirect_to score_criteria_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score_criterium
      @score_criterium = ScoreCriterium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_criterium_params
      params.require(:score_criterium).permit(:name, :amount)
    end
end
