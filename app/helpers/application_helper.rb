module ApplicationHelper
    def sortable(title = nil,column)
        title ||= column.titleize
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title,params.merge(:sort => column, :direction => direction, :page => nil), {:sort => column, :direction => direction}
    end
end
