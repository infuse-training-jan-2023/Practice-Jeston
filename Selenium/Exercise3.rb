require 'selenium-webdriver'

class Button_click
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @driver =Selenium::WebDriver.for :chrome
    end

    def click_button(url)
        driver.get(url)
        button=driver.find_element(:class,"_9vtf")
        button.click
        sleep(5)
    end
    
    def close_browser()
        driver.close()
    end
end

url="https://www.facebook.com/"
driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
instance_of_button_click=Button_click.new(driver_path)
instance_of_button_click.click_button(url)
instance_of_button_click.close_browser()