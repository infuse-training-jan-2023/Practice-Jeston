require 'selenium-webdriver'

class browser_control
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser(url)
        driver.get(url)
        driver.manage.window.maximize
        sleep(10)
    end
    
    def close_browser()
        driver.close()
    end
end

url="https://www.flipkart.com/"
driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"

instance_of_browser_control=browser_control.new(driver_path)
instance_of_browser_control.maximize_browser(url)
instance_of_browser_control.close_browser()