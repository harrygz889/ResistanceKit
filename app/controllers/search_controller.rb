class SearchController < ApplicationController

  def react_search
    if params[:term] != ''
      puts("This is the #{params[:term]}")
      @meetings = Meeting.search(params[:term])
      render :json => @meetings
    else
      @meetings = []
      render :json => @meetings
    end
  end

end
