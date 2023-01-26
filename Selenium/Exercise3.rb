require 'selenium-webdriver'

class Question3
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def click_button()
        driver.get("https://www.facebook.com/")
        button=driver.find_element(:class,"_9vtf")
        button.click
        sleep(5)
    end
    
    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q3=Question3.new(driver_path)
Q3.click_button()
Q3.close_browser()