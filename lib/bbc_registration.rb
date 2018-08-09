require 'selenium-webdriver'

class BBCRegistration

  PAGE_URL = 'https://bbc.co.uk'

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def access_home_page
    @chrome_driver.get(PAGE_URL)
  end

  def access_registration_form
    @chrome_driver.find_element(:id, 'idcta-link').click
    @chrome_driver.find_element(:partial_link_text, 'Register').click
  end

  def current_url
    @chrome_driver.current_url
  end

  def confirm_above_13
    @chrome_driver.find_element(:link_text, '13 or over').click
  end

  def enter_dob day, month, year
    @chrome_driver.find_element(:id, 'day-input').send_keys day
    @chrome_driver.find_element(:id, 'month-input').send_keys month
    @chrome_driver.find_element(:id, 'year-input').send_keys year
  end

  def submit_dob
    @chrome_driver.find_element(:id, 'submit-button').click
  end

  def enter_email email
    @chrome_driver.find_element(:id, 'user-identifier-input').send_keys email
  end

  def enter_password password
    @chrome_driver.find_element(:id, 'password-input').send_keys password
    @chrome_driver.find_element(:id, 'postcode-input').click
  end

  def get_password_error_message
    @chrome_driver.find_element(:id, 'form-message-password').text
  end

  def clear_password
    @chrome_driver.find_element(:id, 'password-input').clear()
  end

  def enter_postcode postcode
    @chrome_driver.find_element(:id, 'postcode-input').send_keys postcode
  end

  def select_gender gender
    dropdown = @chrome_driver.find_element(:id, 'gender-input')
    options = dropdown.find_elements(:tag_name, 'option')
    options.each do |option|
      if option['value'] == gender
        option.click
      end
    end
  end

  def opt_in_or_out
    buttons = @chrome_driver.find_elements(:class, 'button__text-wrapper')
    num = rand(0..1)
    if num == 1
      buttons.each do |button|
        if button.find_element(:tag_name, 'span').text == "No, thanks"
          button.click
        end
      end
    else
      buttons.each do |button|
        if button.find_element(:tag_name, 'span').text == "Yes please"
          button.click
        end
      end
    end
  end

  def submit_registration
    @chrome_driver.find_element(:id, 'submit-button').click
  end

  def check_registered
    message = @chrome_driver.find_element(:class, 'header__title--success')
    message.find_element(:tag_name, 'span').text
  end

end
