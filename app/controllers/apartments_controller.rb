
require 'open-uri'

class ApartmentsController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    before_filter only: [:edit, :update, :destroy] do
        flash[:notice] = 'You do not have permission to access this page.'
        redirect_to :new_user_session unless current_user && current_user.admin?
    end
    before_action :set_apartment, only: [:show, :edit, :update, :destroy]

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

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
        @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
        # now we will save the image and get it's new path

        imgurl = params[:apartment][:img]

        if remote_file_exists? imgurl

            filename = Rails.root.join('public', 'assets', 'apartment_images', sanitize_filename(params[:apartment][:address]) + '.png')

            open(filename, 'wb') do |file|
                file << open(imgurl).read
            end

            params[:apartment][:img] = filename.basename.to_s
        end

        params.fetch(:apartment, {}).permit(:address, :url, :img, :email_sent, :viewing_date)
    end

    # http://stackoverflow.com/questions/1939333/how-to-make-a-ruby-string-safe-for-a-filesystem
    def sanitize_filename(filename)
        filename.gsub(/[^0-9A-Z]/i, '_')
    end

    # http://stackoverflow.com/questions/9543629/verifying-a-remote-image-is-actually-an-image-file-in-ruby
    def remote_file_exists?(url)
        url = URI.parse(url)
        %w(http https).include?(url.scheme)
    rescue URI::BadURIError
        false
    rescue URI::InvalidURIError
        false
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == 'https')
        http.start do |http|
            return http.head(url.request_uri)['Content-Type'].start_with? 'image'
        end
    end
end
