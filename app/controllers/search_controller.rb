class SearchController < ApplicationController
  #this controller acts in tandem with its view,
  #taking the search parameter from the user and
  #returning a list of pods, whales, and users
  #who match that search query 
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
