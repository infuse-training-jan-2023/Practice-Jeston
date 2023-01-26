require 'selenium-webdriver'

class Question2
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def get_title()
        driver.get("https://www.ajio.com/")
        puts driver.title
        sleep(5)
    end
    
    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q1=Question2.new(driver_path)
Q1.get_title()
Q1.close_browser()