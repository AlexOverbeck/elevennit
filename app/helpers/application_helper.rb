module ApplicationHelper
  def flash_class(name)
    case name.to_s
      when 'notice' then 'flash-success'
      when 'error' then 'flash-error'
      when 'alert' then 'flash-error'
      when 'info' then 'flash-notice'
      when 'warning' then 'flash-notice'
      else "flash-notice"
    end
  end

  def post_link(post)
    return post.link if post.link?
    return post_path(post) if post.text?
  end
end
