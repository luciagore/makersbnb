require 'gmail'
require 'csv'

class Mailer

  def self.sendmail(message)
    text = "Listing: #{message[:about]}\n
            There is a new request for your listing. They've written you a message:\n
            #{message[:message]}\n
            please respond to them at this email adddress: #{message[:from]}\n"
    to = message[:to]
    self.connect_to_gmail_and_send_message(to, text)
    message

  end

  private

  def self.connect_to_gmail_and_send_message(to, message)
    auth = CSV.read('./lib/auth.csv')
    username = auth[0][0]
    password = auth[0][1]

    gmail = Gmail.connect(username, password)
    gmail.deliver do
      to to
      subject "New message about your property"
      text_part do
        body message
      end
    end
    gmail.logout
  end

end
