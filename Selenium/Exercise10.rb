require 'selenium-webdriver'

class Table_Actions
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://computer-database.gatling.io/computers")
        driver.manage.window.maximize
        sleep(10)
    end
    
    def display_content()
        table_rows=driver.find_elements(:tag_name,"tr")
        table_rows.each do |option|
            table_data=option.find_elements(:tag_name,"td")[0]
            if (table_data!=nil)
                puts table_c.text
            end
         end
        sleep(3)
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
instance_of_table_actions=Table_Actions.new(driver_path)
instance_of_table_actions.maximize_browser()
instance_of_table_actions.display_content()
instance_of_table_actions.close_browser()