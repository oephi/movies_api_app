class ImdbService

  def get_call(title, param)
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&t=#{title}").to_s
    parsed_response = JSON.parse(response)
    
    parsed_response["#{param}"]
  end


  # def get_plot_by_title(title)
  #   get_call
  #   parsed_response["Plot"]
  # end

  # def get_image_by_title(title)
  #   response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&t=#{title}").to_s
  #   parsed_response = JSON.parse(response)

  #   parsed_response["Poster"]
  # end

end