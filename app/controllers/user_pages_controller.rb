class UserPagesController < ApplicationController
  def collections
  end

  # Recommending for users 
  # TODO: make it work 
  def recommend
    @user = current_user
    @pods = @user.pods
    @podsname = @pods.last.name

    if @podsname == nil
      @query = Pod.search do 
        fulltext "djsadpkapodpoakd;sad"
      end
      @podslist = @query.results
    else
      @query = Pod.search do
       fulltext (@podsname)
      end
     @podslist = @query.results 
    end     

  end

  def sets
  end

  def followlist
  end

  def wishlist
  end

  def rank
  end


end
