class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[show edit update destroy]
  before_action :set_images, only: %i[new edit update create]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image, :rule, :description, :value)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_images
    lib_badges = File.join('**', 'app/assets/images/badges', '*')
    @images = Dir.glob(lib_badges).map { |image| "badges/#{image.split('/').last}" }
  end
  
end
