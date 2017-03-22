module ApplicationHelper
  
  def homepage? 
    current_page?(root_path) || current_page?('/apartments')
  end 
end
