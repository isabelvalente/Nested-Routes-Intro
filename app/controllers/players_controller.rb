class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @manager = Manager.find(params[:manager_id])
  end

  # GET /players/new
  def new
    @player = Player.new
    @manager = Manager.find(params[:manager_id])
  end

  # GET /players/1/edit
  def edit
    @manager = Manager.find(params[:manager_id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)
    @manager = Manager.find(params[:manager_id])
    @player.manager = @player
    respond_to do |format|
      if @player.save
        format.html { redirect_to manager_path(@manager), notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    @manager = Manager.find(params[:manager_id])
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to manager_path(@manager), notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    @manager = Manager.find(params[:manager_id])
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :team, :age)
    end
end