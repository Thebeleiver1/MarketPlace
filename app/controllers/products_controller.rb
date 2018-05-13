class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    # if user_signed_in?
    #   @p = @products.where(sellerId: current_user.id)
    # end
    #byebug
    if params[:val] == nil
      @products = Product.all
    elsif params[:val] == "New"
      @products = Product.where(condition: params[:val])
    elsif params[:val] == "Old"
      @products = Product.where(condition: params[:val])
    elsif params[:val] == "Unused"
      @products = Product.where(condition: params[:val])
    #byebug
    # @products = if params[:user_id] and (params[:user_id] = current_user.try(:id))
    #   Product.where(sellerId: params[:user_id])
    elsif params[:val] == "User"
      
      @products = Product.where(sellerId: current_user.id)

    else
      redirect_to root_path
    end

    
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
   
    @product = Product.new
    
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    
    @product = Product.new(product_params)
    @product.sellerId = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  def newlisting 
    @products = Product.where(condition: :New)
    #@products = Product.find(params[:product])
  end

  def unusedlisting 
    @products = Product.where(condition: :Unused)
    #@products = Product.find(params[:product])
  end

  def oldlisting 
    @products = Product.where(condition: :Old)
    #@products = Product.find(params[:product])
  end

  def userlisting 
    
    @products = Product.all
    
    
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :condition, :location, :category, :sellerId, {images: []})
    end
end
