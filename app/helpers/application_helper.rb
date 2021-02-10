module ApplicationHelper
  def current_year
    Time.current.zone
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
    
  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
  
end
