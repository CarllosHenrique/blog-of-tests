module ApplicationHelper
    def nav_link title, path, method
        content_tag(:li, class:"nav-item")
        link_to "#{title}", path, class: "nav-link", data: {turbo_method: method}  
    end

    def admin_buttons delete_pat, edit_path
        
    end
end
