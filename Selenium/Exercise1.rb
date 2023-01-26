require 'selenium-webdriver'

class Question1
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://www.flipkart.com/")
        driver.manage.window.maximize
        # wait.until(driver.manage.window.maximize)
        sleep(10)
    end
    
    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q1=Question1.new(driver_path)
Q1.maximize_browser()
Q1.close_browser()