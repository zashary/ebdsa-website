module ApplicationHelper
  def format_date time
    time.strftime("%B %e, %Y")
  end

  def format_time_range_short start_time, end_time
    [format_time_short(start_time), format_time_short(end_time)].join(' - ')
  end

  def format_time_short time
    time.strftime("%-l:%M%P")
  end

  def header_menu_items
    @header_menu_items ||= MenuItem.header
  end

  def footer_menu_items
    @footer_menu_items ||= MenuItem.footer
  end

  def current_admin_path
    if @page
      admin_page_path(@page)
    elsif @home
      admin_home_path(@home)
    elsif @post
      admin_blog_post_path(@post)
    else
      admin_dashboard_path
    end
  end
end
