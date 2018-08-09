require 'spec_helper'

describe 'testing the bbc website login and logout' do

  before(:all) do
    @driver = BBCLogin.new
    @driver.access_login_form
  end

  context 'testing account login' do

    it 'should accept email and password' do
      @driver.enter_email # ENTER VALID EMAIL HERE
      @driver.enter_password # ENTER VALID PASSWORD HERE
      sleep 1
    end

    it 'should log in successfully' do
      @driver.submit_login
      sleep 2
      expect(@driver.check_logged_in).to eq 'Your account'
    end

  end

  context 'testing account logout' do

    it 'should log out successfully' do
      @driver.log_out
      sleep 2
      expect(@driver.check_logged_out).to eq "You've signed out, sorry to see you go."
    end


  end
end
