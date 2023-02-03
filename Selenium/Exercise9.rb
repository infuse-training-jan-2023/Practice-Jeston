require 'selenium-webdriver'

class Table_headers
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://cosmocode.io/automation-practice-webtable/")
        driver.manage.window.maximize
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
instance_of_table_headers=Table_headers.new(driver_path)
instance_of_table_headers.maximize_browser()
instance_of_table_headers.display_content()
instance_of_table_headers.close_browser()