class SearchController < ApplicationController
  
  def search
    @query = User.search do
      fulltext params[:search]
    end
    @query2 = Whale.search do
      fulltext params[:search]
    end
    @query3 = Pod.search do
      fulltext params[:search]
    end
    @userslist = @query.results
    @whaleslist = @query2.results
    @podslist = @query3.results
  end

  def trending
  end
end
