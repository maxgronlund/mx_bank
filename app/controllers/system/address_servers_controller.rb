class System::AddressServersController < ApplicationController
  before_action :set_system_address_server, only: [:show, :edit, :update, :destroy]

  # GET /system/address_servers
  # GET /system/address_servers.json
  def index
    @system_address_servers = System::AddressServer.all
  end

  # GET /system/address_servers/1
  # GET /system/address_servers/1.json
  def show
  end

  # GET /system/address_servers/new
  def new
    @system_address_server = System::AddressServer.new
  end

  # GET /system/address_servers/1/edit
  def edit
  end

  # POST /system/address_servers
  # POST /system/address_servers.json
  def create
    @system_address_server = System::AddressServer.new(system_address_server_params)

    respond_to do |format|
      if @system_address_server.save
        format.html { redirect_to @system_address_server, notice: 'Address server was successfully created.' }
        format.json { render :show, status: :created, location: @system_address_server }
      else
        format.html { render :new }
        format.json { render json: @system_address_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system/address_servers/1
  # PATCH/PUT /system/address_servers/1.json
  def update
    respond_to do |format|
      if @system_address_server.update(system_address_server_params)
        format.html { redirect_to @system_address_server, notice: 'Address server was successfully updated.' }
        format.json { render :show, status: :ok, location: @system_address_server }
      else
        format.html { render :edit }
        format.json { render json: @system_address_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system/address_servers/1
  # DELETE /system/address_servers/1.json
  def destroy
    @system_address_server.destroy
    respond_to do |format|
      format.html { redirect_to system_address_servers_url, notice: 'Address server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_address_server
      @system_address_server = System::AddressServer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def system_address_server_params
      params.require(:system_address_server).permit(:name, :url, :uuid, :public_key)
    end
end
