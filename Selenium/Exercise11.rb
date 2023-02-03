require 'selenium-webdriver'

class Get_table_data
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
    
    def display_content(row_number,data_index)
        table_rows = driver.find_elements(:tag_name => 'tr')[row_number]
        table_data = table_rows.find_elements(:tag_name => 'td')[data_index]
        puts table_data.text
    end

    def close_browser()
        driver.close()
    end
end

row_number=3
data_index=1
driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
url="https://computer-database.gatling.io/computers"
instance_of_get_table_data=Get_table_data.new(driver_path)
instance_of_get_table_data.maximize_browser(url)
instance_of_get_table_data.display_content(row_number,data_index)
instance_of_get_table_data.close_browser()