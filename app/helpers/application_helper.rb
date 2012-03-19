module ApplicationHelper
  def check_for_errors(object)
    render partial: 'shared/form_errors', locals: { object: object } if object.errors.any?
  end
  
  def no_records_check(records, name, options = {})
    options[:message] ||= "There are no #{name} to list."
    content_tag :div, options[:message], class: 'empty-list' if records.blank?
  end
  
  def pretty_date(date, options = {})
    time_format = date.strftime("%l:%M%p").downcase
    if options[:short]
      pretty_date = date.strftime("%D")
      pretty_date += " - " unless !options[:time]
    elsif options[:only_time]
      return time_format
    else
      pretty_date = date.strftime("%A, %B ") + date.strftime("%e").to_i.ordinalize + ", " + date.strftime("%Y")
      pretty_date += " at " unless !options[:time]
    end
    pretty_date += time_format unless !options[:time]
    return pretty_date
  end
  
  def edit_link(path)
    content_tag :span, class: "manage" do
      link_to "edit", path, class: 'edit-link'
    end if logged_in?
  end
  
  def create_link(object, path)
    content_tag :div, class: "manage" do
      link_to "new #{object}", path, class: 'create-link'
    end if logged_in?
  end
  
  def delete_link(object)
    content_tag :div, class: "manage" do
      link_to "delete #{object.class.to_s.downcase}", object, class: 'delete-link', method: 'delete', confirm: 'Are you sure?'
    end if logged_in?
  end
  
  def page_header(title=nil, subtitle=nil)
    header = ''
    header += content_tag(:h1, title) if title.present?
    header += content_tag(:h3, subtitle) if subtitle.present?
    return header.html_safe
  end
end
