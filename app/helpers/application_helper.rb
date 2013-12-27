module ApplicationHelper
  CATEGORIES = %w[services lodging goods]

  def markdown(text)
    text ||= ""
    markdown_renderer.render(text).html_safe
  end

  def markdown_renderer
    markdown_options = {
      no_intra_emphasis: true,
      autolink: true,
      lax_spacing: true,
      quote: true
    }
    html_options = { filter_html: true }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(html_options), markdown_options)
  end

  def alert_type(level)
    case level
    when :notice  then "alert alert-info"
    when :success then "alert alert-success"
    when :alert   then "alert alert-warning"
    when :error   then "alert alert-danger"
    end
  end

  def active?(path = nil, **options)
    return "active" if current_page? path
  end

  def title(page_title)
    default_page_title = "Sharing Between Effective Alruists"
    content_for(:title)  { page_title }
  end
end
