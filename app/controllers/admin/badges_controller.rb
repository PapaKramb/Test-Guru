class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: %i[edit update destroy show]
  before_action :set_images, only: %i[new edit update create]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_tests_path
  end

  def show; end

  private

  def badge_params
    params.require(:badge).permit(:title, :images, :rule_type, :rule_value)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def set_images
    lib_badges = File.join('**', 'app/assets/images/badges', '*')
    @images = Dir.glob(lib_badges).map { |image| "badges/#{image.split('/').last}" }
  end

end