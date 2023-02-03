require 'selenium-webdriver'

class Search
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://www.google.com/")
        driver.manage.window.maximize
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
instance_of_search=Search.new(driver_path)
instance_of_search.maximize_browser()
instance_of_search.search_and_enter()
instance_of_search.close_browser()