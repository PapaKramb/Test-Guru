module Admin::GistsHelper
  def gist_hash(url)
    url.split('/').last
  end
end