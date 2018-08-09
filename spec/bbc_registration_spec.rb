require 'spec_helper'

describe 'testing the bbc website registration form' do

  before(:all) do
    @driver = BBCRegistration.new
    @driver.access_home_page
  end

  context 'testing account creation' do

    it 'should land on registration page' do
      @driver.access_registration_form
      expect(@driver.current_url).to start_with 'https://account.bbc.com/register'
    end

    it 'should accept new DOB' do
      @driver.confirm_above_13
      sleep 1
      @driver.enter_dob '30', '12', '1991'
      sleep 1
      @driver.submit_dob
    end

    it 'should accept email address' do
      @driver.enter_email # ENTER A NEW VALID EMAIL HERE - you may want to use 10 minute mail
      sleep 1
    end

    it 'should display error message for password too short' do
      @driver.enter_password 'abcde'
      expect(@driver.get_password_error_message).to include 'password is too short'
      sleep 1
      @driver.clear_password
    end

    it 'should display error message for password with only letters' do
      @driver.enter_password 'abcdefgh'
      expect(@driver.get_password_error_message).to include "include something that isn't a letter"
      sleep 1
      @driver.clear_password
    end

    it 'should display error message for password too simple' do
      @driver.enter_password 'abcd1234'
      expect(@driver.get_password_error_message).to include 'hard to guess'
      sleep 1
      @driver.clear_password
    end

    it 'should display error message for password with only numbers' do
      @driver.enter_password '12345678'
      expect(@driver.get_password_error_message).to include 'Please include a letter'
      sleep 1
      @driver.clear_password
    end

    it 'should accept a valid password' do
      @driver.enter_password 'abcd123!'
      sleep 1
    end

    it 'should accept a postcode' do
      @driver.enter_postcode 'S21 1BF'
      sleep 1
    end

    it 'should accept gender input' do
      @driver.select_gender 'male'
      sleep 1
    end

    it 'should opt in or out of email updates' do
      @driver.opt_in_or_out
      sleep 1
    end

    it 'should create new account when submitted' do
      @driver.submit_registration
      sleep 4
      expect(@driver.check_registered).to include "Thanks. You're now signed in."
    end

  end

end
