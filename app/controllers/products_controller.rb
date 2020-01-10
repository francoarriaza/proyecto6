class ProductsController < ApplicationController    
    def new
        @product = Product.new
    end    

    def create
        @product = Product.new(product_params)
        @product.category = Product.find(params[:category_id])
        @product.save
        relink_to categories_path
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to @product.category
    end

    private
    def product_params
        params.require(:product).permit(:name, :price)
    end
end
