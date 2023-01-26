require 'selenium-webdriver'

class Question5
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://www.google.com/")
        driver.manage.window.maximize
        # wait.until(driver.manage.window.maximize)
        sleep(10)
    end
    
    def search_and_enter()
        search_bar=driver.find_element(:name,"q")
        search_bar.send_keys("search")
        sleep(5)
        search_bar.send_keys(:enter)
        sleep(3)
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q5=Question5.new(driver_path)
Q5.maximize_browser()
Q5.search_and_enter()
Q5.close_browser()