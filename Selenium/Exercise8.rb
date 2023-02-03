require 'selenium-webdriver'

class Slider_action
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://www.globalsqa.com/demo-site/sliders/#Steps")
        driver.manage.window.maximize
        sleep(5)
    end
    
    def slider_function()
        frame =driver.find_element(:css,'iframe.lazyloaded')
        driver.switch_to.frame(frame)
        slider = driver.find_element(:tag_name,'span')
        driver.action.move_to(slider).perform
        driver.action.send_keys(:arrow_right).perform
        driver.action.send_keys(:arrow_right).perform
        driver.action.send_keys(:arrow_right).perform
        sleep(10)
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
instance_of_slider_action=Slider_action.new(driver_path)
instance_of_slider_action.maximize_browser()
instance_of_slider_action.slider_function()
instance_of_slider_action.close_browser()