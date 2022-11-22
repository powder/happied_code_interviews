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

BASE_URL = "https://api.giphy.com/v1/gifs/search"
API_KEY = "GaQz73BYzGEogZIsMO9YODtH0Ce2rVuO"
LIMIT = 5

require "json"
require "net/http"

# Pass user_input for query, and offset in case of paging through many results.
def get(user_input, offset=0)
    # Your api response object should go in this data object
    data = {}
    
    # Your code goes here.
    uri = URI(BASE_URL)
    request = Net::HTTP.get_response(uri + "?api_key=#{API_KEY}&q=#{user_input}&limit=#{LIMIT}&offset=#{offset}")

    data = JSON.parse request.body
    
    # This routine will return the full API response.
    return data
end

def run
    data = get(ARGV[0])
    data = data
    
    # We'll take the pagination data even though we're not using it yet
    pagination = data["pagination"]
    # We're trimming the API response to only show the data we care about.
    data = data["data"].map { |gif|
      {
        type: gif["type"],
        id: gif["id"],
        url: gif["url"],
        title: gif["title"],
        images: {
            original: {
                url: gif["images"]["original"]["url"],
                width: gif["images"]["original"]["width"],
                height: gif["images"]["original"]["height"],
                size: gif["images"]["original"]["size"],
                frames: gif["images"]["original"]["frames"],
                mp4: gif["images"]["original"]["mp4"],
                mp4_size: gif["images"]["original"]["mp4_size"],
                webp: gif["images"]["original"]["webp"],
                webp_size: gif["images"]["original"]["webp_size"]
            },
        }
      }
    }

    # We're printing out the response currently so that the program has some readable output.
    pp data
end

# In the scheme of favoriting, we can allow favoriting by ID and saving it to a local file or database as a favorited image.   We can then use the
# ID to retrieve the image from the giphy API


# to run, open your terminal and type ruby giphy.rb "user_input"
run
