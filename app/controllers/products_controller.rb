class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  # GET /products/1/edit
  def edit
  end

  # PATCH/PUT /products/1
  def update
    @product.update_attributes(product_params)
    redirect_to shipment_path(@product.shipment.id), notice: 'Product was successfully updated.'
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to shipment_path(@product.shipment.id), notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:description, :value)
    end
end
