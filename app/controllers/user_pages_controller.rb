class UserPagesController < ApplicationController
  def collections
  end

  # Recommending for users 
  # TODO: slighty bugged, recommends too many collections
  # takes a user's list of pods, grabs a name of one of the pods,
  # and recommends pods based on that name 
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
