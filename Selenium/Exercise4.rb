require 'selenium-webdriver'

class Radio_Box_Actions
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
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
instance_of_radio_box_actions=Radio_Box_Actions.new(driver_path)
instance_of_radio_box_actions.radiobutton_checkbox()
instance_of_radio_box_actions.close_browser()