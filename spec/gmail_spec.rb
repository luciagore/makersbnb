describe Mailer do


  describe 'sends a mail' do
    it 'allows user to send email' do
      message = {to: 'test', message: 'testmessage', about: 'lucys house', from: 'person@example.com'}
      allow(Gmail).to receive(:sendmail).and_return(true)
      expect(Mailer.sendmail(message)).to eq (message)
    end
  end

end
