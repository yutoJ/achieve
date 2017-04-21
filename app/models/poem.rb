class Poem < ActiveResource::Base #ActiveRecord::Baseから変更した
  self.site = ENV["API_SAMPLE_URL"]
end
