class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]

  protect_from_forgery :except => [:update_from_xml]

  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = Shipment.all
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
    @shipment.products.build
    @shipment
  end

  # GET /shipments/1/edit
  def edit
  end

  # POST /shipments
  def create
    @shipment = Shipment.new(shipment_params)
    StoreWorker.perform_async(@shipment.id) if @shipment.save
    redirect_to @shipment, notice: 'Shipment was successfully created.'
  end

  # PATCH/PUT /shipments/1
  def update
    @shipment.update_attributes(shipment_params)
    redirect_to @shipment, notice: 'Shipment was successfully updated.'
  end

  def update_from_xml
    storage = { id: Random.new.rand(0..5) }
    render xml: storage, root: "storage"
  end

  # DELETE /shipments/1
  def destroy
    @shipment.destroy
    redirect_to shipments_url, notice: 'Shipment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:delivery_date, products_attributes: [:description, :value])
    end
end
