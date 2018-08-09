require 'selenium-webdriver'

class BBCLogin

  PAGE_URL = 'https://bbc.co.uk'

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def access_login_form
    @chrome_driver.get(PAGE_URL)
    @chrome_driver.find_element(:id, 'idcta-link').click
  end

  def enter_email email
    @chrome_driver.find_element(:id, 'user-identifier-input').send_keys email
  end

  def enter_password password
    @chrome_driver.find_element(:id, 'password-input').send_keys password
  end

  def submit_login
    @chrome_driver.find_element(:id, 'submit-button').click
  end

  def check_logged_in
    @chrome_driver.find_element(:id, 'idcta-username').text
  end

  def log_out
    @chrome_driver.find_element(:id, 'idcta-link').click
    @chrome_driver.find_element(:link_text, 'Sign out').click
  end

  def check_logged_out
    @chrome_driver.find_element(:tag_name, 'h1').text
  end

end
