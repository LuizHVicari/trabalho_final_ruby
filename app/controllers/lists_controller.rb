class ListsController < ApplicationController
  before_action :set_user
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = @user.lists.all
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = @user.lists.new
    10.times{@list.products.build}
  end

  # GET /lists/1/edit
  def edit
    1.times{@list.products.build}
  end

  # POST /lists or /lists.json
  def create
    @list = @user.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to user_list_url(@user, @list), notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to user_list_url(@user, @list), notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to user_lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:due_date, :bought, products_attributes: [:id, :name, :price, :bought])
    end
end
