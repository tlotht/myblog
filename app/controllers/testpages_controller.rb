class TestpagesController < ApplicationController
  before_action :set_testpage, only: %i[ show edit update destroy ]

  # GET /testpages or /testpages.json
  def index
    @q = Testpage.ransack(params["q"])
    @testpages = @q.result.order("id desc").paginate(:page=>params[:page],:per_page=>per_page)
  end

  # GET /testpages/1 or /testpages/1.json
  def show
  end

  # GET /testpages/new
  def new
    @testpage = Testpage.new
  end

  # GET /testpages/1/edit
  def edit
  end

  # POST /testpages or /testpages.json
  def create
    @testpage = Testpage.new(testpage_params)

    respond_to do |format|
      if @testpage.save
        format.html { redirect_to testpage_url(@testpage), notice: "Testpage was successfully created." }
        format.json { render :show, status: :created, location: @testpage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @testpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testpages/1 or /testpages/1.json
  def update
    respond_to do |format|
      if @testpage.update(testpage_params)
        format.html { redirect_to testpage_url(@testpage), notice: "Testpage was successfully updated." }
        format.json { render :show, status: :ok, location: @testpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @testpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testpages/1 or /testpages/1.json
  def destroy
    @testpage.destroy

    respond_to do |format|
      format.html { redirect_to testpages_url, notice: "Testpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testpage
      @testpage = Testpage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def testpage_params
      params.require(:testpage).permit(:name,:count,:description)
    end
end
