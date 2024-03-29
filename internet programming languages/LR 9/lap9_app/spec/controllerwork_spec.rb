# frozen_string_literal: true

# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe 'Controllerwork' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'controllerwork' do
    @driver.get('http://localhost:3000/')
    @driver.find_element(:id, 'number1').click
    @driver.find_element(:id, 'number1').send_keys('48')
    @driver.find_element(:id, 'number2').click
    @driver.find_element(:id, 'number2').send_keys('16')
    @driver.find_element(:name, 'commit').click
    element = @driver.find_element(:name, 'commit')
    element = @driver.find_element(By.CSS_SELECTOR, 'body')
    elements = @driver.find_elements(:css, 'table')
    expect(elements.length).to be.positive?
    expect(@driver.find_element(:id, 'gcd').text).to eq('16')
    expect(@driver.find_element(:id, 'lcm').text).to eq('48')
  end
end
