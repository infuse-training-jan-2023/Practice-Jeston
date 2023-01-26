require 'selenium-webdriver'

class Question10
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
        table_rows=driver.find_elements(:tag_name,"tr")
        table_rows.each do |option|
            table_c=option.find_elements(:tag_name,"td")[0]
            # table_c.each do |option2|
            #     puts option2.text
            # end
            if (table_c!=nil)
                puts table_c.text
            end
         end
        sleep(3)
        # table_columns=table_rows.find_elements(:tag_name,"tr")
        # puts table_columns
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q10=Question10.new(driver_path)
Q10.maximize_browser()
Q10.display_content()
Q10.close_browser()