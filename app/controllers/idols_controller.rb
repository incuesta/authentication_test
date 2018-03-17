class IdolsController < ApplicationController
  before_action :set_idol, only: [:show, :edit, :update, :destroy]

  # GET /idols
  # GET /idols.json
  def index
    @idols = Idol.all

    respond_to do | format |
        format.html

        format.pdf do

            prawn_pdf = IdolPdf.new(@idols, view_context)

            send_data prawn_pdf.render, filename: "shyshyshy.pdf", type: 'application/pdf', disposition: "inline"
        end

    end
  end


  # GET /idols/1
  # GET /idols/1.json
  def show

  end





  # GET /idols/new
  def new
    @idol = Idol.new
    @talents = @idol.talents.build
  end

  # POST /idols
  # POST /idols.json
  def create
    @idol = Idol.new(idol_params)
    @talents = @idol.talents.build(talent_params)
    respond_to do |format|
      if @idol.save && @talents.save
          format.html { redirect_to idols_path, notice: 'Idol was successfully debuted.' }
          format.json { render :show, status: :created, location: @idol }
      else
          format.html { redirect_to new_idol_path, notice: 'Failed to register Idol' }
          format.json { render json: @idol.errors, status: :unprocessable_entity }
      end
    end
  end





  # GET /idols/1/edit
  def edit
    @talents = @idol.talents.last
  end

  # PATCH/PUT /idols/1
  # PATCH/PUT /idols/1.json
  def update
      @talents = @idol.talents.last
      respond_to do |format|
          if @idol.update(idol_params) && @talents.update(talent_params)
              shiori = KuboshiMailer.new_shiorichan(@idol, Admin.find(3))
              shiori.deliver_now

              format.html { redirect_to idols_path, notice: 'Idol was successfully updated.' }
              format.json { render :show, status: :created, location: @idol }

          else
              
              format.html { render :edit, notice: 'Failed to update Idol' }
              format.json { render json: @idol.errors, status: :unprocessable_entity }
          end

      end
  end






  # DELETE /idols/1
  # DELETE /idols/1.json
  def destroy
    @idol.destroy
    respond_to do |format|
      format.html { redirect_to idols_url, notice: 'Idol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  def run_a_cmd
    i = Idol.first
    i.run_a_cmd
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idol
      @idol = Idol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idol_params
      params.require(:idol).permit(:last_name, :first_name)
    end

    def talent_params
      params.require(:idol).require(:talents).permit(:description)
    end

end
