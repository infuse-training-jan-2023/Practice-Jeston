require 'selenium-webdriver'

class Question9
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://cosmocode.io/automation-practice-webtable/")
        driver.manage.window.maximize
        # wait.until(driver.manage.window.maximize)
        sleep(10)
    end
    
    def display_content()
        table_header=driver.find_elements(:tag_name,"tr")[0]
        puts table_header.text
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q9=Question9.new(driver_path)
Q9.maximize_browser()
Q9.display_content()
Q9.close_browser()