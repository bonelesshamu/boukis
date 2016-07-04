module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} - Boukis"
    else
      'Boukis'
    end
  end
end
