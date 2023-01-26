require 'selenium-webdriver'

class Question11
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://computer-database.gatling.io/computers")
        driver.manage.window.maximize
        # wait.until(driver.manage.window.maximize)
        sleep(10)
    end
    
    def display_content()
        table_rows = driver.find_elements(:tag_name => 'tr')[3]
        table_data = table_rows.find_elements(:tag_name => 'td')[1]
        puts table_data.text
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q11=Question11.new(driver_path)
Q11.maximize_browser()
Q11.display_content()
Q11.close_browser()