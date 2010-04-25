module Mailee
  class MaileeResource < ActiveResource::Base
    self.site = "http://api.e32aaeac83f0c.lumineiro.mailee.me"
  end
  class Contact < MaileeResource
  end
  class List < MaileeResource
  end
end

