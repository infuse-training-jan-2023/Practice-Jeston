require 'selenium-webdriver'

class Browser_title
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
instance_of_browser_title=Browser_title.new(driver_path)
instance_of_browser_title.get_title()
instance_of_browser_title.close_browser()