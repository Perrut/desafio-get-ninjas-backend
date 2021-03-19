class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def start_queue
    Order.new.start_queue
  end

  # POST /orders or /orders.json
  def create
    Order.transaction do
      @order = Order.create
      user_info = @order.create_user_info(user_info_params)
      address_attributes = @order.create_address_attribute(address_attributes_params)
      request_info = @order.create_request_info(request_info_params)

      respond_to do |format|
        if @order.save
          @order.publish_to_dashboard
          format.html { redirect_to @order, notice: "Order was successfully created." }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    Order.transaction do
      respond_to do |format|
        if @order.user_info.update(user_info_params) && 
           @order.address_attribute.update(address_attributes_params) &&
           @order.request_info.update(request_info_params)
          format.html { redirect_to @order, notice: "Order was successfully updated." }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      user_info_params.merge(address_attributes_params).merge(request_info_params)
    end

    def user_info_params
      params.require(:user_info).permit(
        :phone,
        :name,
        :email
      )
    end

    def address_attributes_params
      params.require(:address_attributes).permit(
        :city,
        :neighborhood,
        :street,
        :uf,
        :zip_code,
        :lat,
        :lng
      )
    end

    def request_info_params
      params.require(:request_info).permit(
        :question1,
        :question2,
        :question3
      )
    end
end
