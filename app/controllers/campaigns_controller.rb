class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(create_params)

    if @campaign.save
      redirect_to :campaigns
    else
      render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])

    if @campaign.update(update_params)
      redirect_to @campaign
    else
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])

    @campaign.destroy

    redirect_to :campaigns
  end

  private

  def create_params
    params.require(:campaign).permit(:title, :content, :targets)
  end

  def update_params
    params.require(:campaign).permit(:title, :content, :targets)
  end
end
