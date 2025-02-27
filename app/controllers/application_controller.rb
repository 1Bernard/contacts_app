class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def set_page_and_count
    params[:count] = params[:count] == 'All' ? 10_000 : params[:count] || 10
    params[:page] ||= 1
  end

  def paginate(query)
    set_page_and_count
    query.paginate(page: params[:page], per_page: params[:count])
  end

end
