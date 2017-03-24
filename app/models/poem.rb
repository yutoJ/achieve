#class Poem < ActiveResource::Base #ActiveRecord::Baseから変更した
class Poem# < ActiveRecord::Base
  #self.site = "http://" + "#{ENV['APP_DOMAIN_NAME']}"
  #self.site = "https://stormy-lake-92712.herokuapp.com/"
  include Her::Model
end
