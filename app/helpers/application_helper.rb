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
    @header_menu_items ||= MenuItem.where(container: 'header')
  end

  def footer_menu_items
    @footer_menu_items ||= MenuItem.where(container: 'footer')
  end
end
