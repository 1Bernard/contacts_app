class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end


  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    respond_to do |format|
      index
      @modal_action = 'open'
      format.html  # fallback if needed
      format.js { render "form" }
    end
  end


  # GET /users/1/edit
  def edit
    respond_to do |format|
      index
      format.html  # fallback if needed
      format.js { render "form" }
    end
  end

  # POST /users or /users.json
  def create
    @modal_action = 'open'  # Ensure it's open by default
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:notice] = "#{@user.fullname} created successfully"
        index   # Ensure the updated table is available
        @modal_action = 'close'  # Now set to close only on success
        format.js { render 'form' }
        flash.discard
      else
        format.js { render 'form', status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:notice] = "#{@user.fullname} created successfully"
        # Ensure the updated table is available
        index
        @modal_action = 'close'
        format.js { render 'form' }
        flash.discard 
      else
        @modal_action = 'open'
        format.js { render 'form', status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_multiple
    if params[:user_ids].present?
      User.where(id: params[:user_ids]).destroy_all
      flash[:notice] = "Selected users deleted successfully."
    else
      flash[:alert] = "No users selected."
    end
    redirect_to users_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params[:user][:mobile_number] = Phonelib.parse(params[:user][:mobile_number]).e164
      params.expect(user: [ :user_code, :first_name, :last_name, :username, :mobile_number, :image_path, :first_login, :active_status, :del_status, :creator_id, :email ])
    end
end
