describe Mailer do


  describe 'sends a mail' do
    it 'allows user to send email' do
      message = {to: 'test', message: 'testmessage'}
      allow(Gmail).to receive(:sendmail).and_return({to: 'test', message: 'testmessage'})
      expect(Mailer.sendmail(message)).to eq ({to: 'test', message: 'testmessage'})
    end
  end

end
