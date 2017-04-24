class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio was successfully created.' }
        else
        format.html { render :new }
        end
    end
  end

  def destroy
    # Perform Lookup
    @portfolio_item = Portfolio.find(params[:id])
    # Perform Destroy/delete
    @portfolio_item.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
  	@portfolio_item = Portfolio.find(params[:id])
  	end

  def update
  	@portfolio_item = Portfolio.find(params[:id])
		respond_to do |format|
	      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image))
	        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
	        else
	        format.html { render :edit }
	        end
	    end
  end

end
