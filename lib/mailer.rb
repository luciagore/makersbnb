require 'gmail'
require_relative 'details'

class Mailer

  def self.sendmail
    username = 'juvenilekoalas@gmail.com'#Details.details[username]
    password = 'makersacademy123'#Details.details[password]

    gmail = Gmail.connect(username, password)
    gmail.deliver do
      to "gore.helena@gmail.com"
      subject "Having fun in Puerto Rico"
      text_part do
        body "Test of plantext message."
      end
    end
    gmail.logout

  end
end
