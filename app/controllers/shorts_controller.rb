class ShortsController < ApplicationController

  def index
    @shorts = Form.order("click DESC").page(params[:page]).per(30)

    if (params[:create_new_link])
    @new_url = Form.new
    end

  end

  def create
    @new_url = Form.new(params.require(:form).permit(:long_url,:short_url,:click))
    @new_url.short_url = "leon.on/" + SecureRandom.hex(3)
    @new_url.save
    redirect_to shorts_path
  end

  def show
    @new_url = Form.find(params[:id])
    if redirect_to @new_url.long_url
    @new_url.click += 1
    @new_url.save
    end
  end

  def destroy
    @url = Form.find(params[:id])
    @url.destroy
    redirect_to shorts_path
  end
end
