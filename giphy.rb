# Hello! Today we're going to build an application 
# that grabs gifs from giphy based on a search input from a user, 
# and returns those gifs to our magical front-end.

# For this test, your goal is only to return gifs to the front-end. We aren't building a UI.
# Below, you will see our "get" request that receives input "text" from the user.

# We want to send the search input to giphy, parse the response, and then return relevant results. 
# In general, here are different concepts we expect you to deliver on:
#   - How are you deciding what results, and each result's respective subdata,
#     to return to the user?
#   - How would you alter this get request to handle a user clicking 
#     through pages of gifs rather than a limited amount?
#   - Let's pretend that the user likes some gifs and wants to return 
#     to visit them later. How should we handle storing the user's preferences?
#       - For this one, map out a proposed data schema.

# Helpful info to get you started: 
#   - base url for giphy is: https://api.giphy.com/v1/gifs/search
#   - api key you can use is: GaQz73BYzGEogZIsMO9YODtH0Ce2rVuO
#   - giphy documentation: https://developers.giphy.com/docs/api/endpoint#search
#   - Performing http requests with ruby: https://www.twilio.com/blog/5-ways-make-http-requests-ruby
#   - if you want to better visualize the api response, you can use https://www.postman.com/

def get(user_input)
    # Your api response object should go in this data object
    data = {}

    # Your code goes here.
    print "Fun with giphy!"

    return data
end

def run
    get('funny dogs')
end

# to run, open your terminal and type ruby giphy.rb
run
