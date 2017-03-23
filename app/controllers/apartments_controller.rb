class ApartmentsController < ApplicationController
    before_action :authenticate_user!
    before_filter only: [:edit, :update, :destroy, :changestatus] do
        if current_user and not current_user.admin?
          flash[:notice] = 'You do not have permission to access this page.'
          redirect_to :new_user_session 
        end
    end
    before_action :set_apartment, only: [:show, :edit, :update, :destroy, :changestatus]

    # GET /apartments
    # GET /apartments.json
    def index
        @apartments = Apartment.all
    end

    # GET /apartments/1
    # GET /apartments/1.json
    def show
    end

    # GET /apartments/new
    def new
        @apartment = Apartment.new
    end

    # GET /apartments/1/edit
    def edit
    end

    # POST /apartments
    # POST /apartments.json
    def create
        @apartment = Apartment.new(apartment_params)

        respond_to do |format|
            if @apartment.save
                format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
                format.json { render :show, status: :created, location: @apartment }
            else
                format.html { render :new }
                format.json { render json: @apartment.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /apartments/1
    # PATCH/PUT /apartments/1.json
    def update
        respond_to do |format|
            if @apartment.update(apartment_params)
                format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
                format.json { render :show, status: :ok, location: @apartment }
            else
                format.html { render :edit }
                format.json { render json: @apartment.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /apartments/1
    # DELETE /apartments/1.json
    def destroy
        @apartment.destroy
        respond_to do |format|
            format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def changestatus
        abort(params.inspect)
        respond_to do |format|
            if current_user.likes @news_item
                format.json { render json: @news_item.to_json, head: :ok }
            else
                format.json { render json: root_path.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
        @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
        params.fetch(:apartment, {}).permit(:address, :url, :img, :email_sent, :viewing_date, :notes, :price, :status_id)
    end

end
