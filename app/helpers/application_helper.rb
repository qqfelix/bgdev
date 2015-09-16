module ApplicationHelper
    def list_item_tag(name,controller,action, options={})


      if params[:controller] == controller && params[:action] == action
          content_tag(:a, name,:href => "/#{controller}/#{action}", :class => 'list-group-item list-group-item-success')
      else
          content_tag(:a, name,:href => "/#{controller}/#{action}", :class => 'list-group-item')

      end
    end

    # def status_tag(boolean, options={})
    #   options[:true_text] ||= ''
    #   options[:false_text] ||= ''
    #
    #   if boolean
    #       content_tag(:span, options[:true_text], :class => 'status true')
    #   else
    #       content_tag(:span, options[:false_text], :class => 'status false')
    #
    #   end
    # end
end
