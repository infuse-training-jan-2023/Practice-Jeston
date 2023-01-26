require 'selenium-webdriver'

class Question4
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def radiobutton_checkbox()
        driver.get("https://demo.automationtesting.in/Register.html")
        button=driver.find_element(:name,"radiooptions")
        checkbox=driver.find_element(:id,"checkbox1").click
        button.click
        sleep(5)
    end
    
    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q3=Question4.new(driver_path)
Q3.radiobutton_checkbox()
Q3.close_browser()