class Api 
    def self.request
        resp = Typhoeus.get("https://www.themealdb.com/api/json/v1/1/search.php?f=b")
        results = JSON.parse(resp.response_body)
    end
end