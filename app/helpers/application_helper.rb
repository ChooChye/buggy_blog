module ApplicationHelper
  def category_link(category)
    return "Uncategorized" if category.nil?

    link_to category.name, articles_category_path(category)
  end

  def status_badge(article)
    tag.span article.status.humanize, class: "badge badge-#{article.status}"
  end

  def display_date(time)
    time&.strftime("%-d %b %Y")
  end

  def display_time(time)
    time&.strftime("%-d %b %Y, %H:%M")
  end
end
