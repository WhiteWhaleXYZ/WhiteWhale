class UserPagesController < ApplicationController
  def collections
  end

  def sets
  end

  def followlist
  end

  def wishlist
  end

  def rank
  end

  def search
    @query = User.search do
      fulltext params[:search]
    end
    @userslist = @query.resultsls
  end

end
