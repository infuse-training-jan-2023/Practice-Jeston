require 'selenium-webdriver'

class Question8
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://www.globalsqa.com/demo-site/sliders/#Steps")
        driver.manage.window.maximize
        # wait.until(driver.manage.window.maximize)
        sleep(5)
    end
    
    def slider_function()
        frame =driver.find_element(:css,'iframe.lazyloaded')
        driver.switch_to.frame(frame)
        slider = driver.find_element(:tag_name,'span')
        driver.action.key_down(:control).perform
        driver.action.drag_and_drop_by(slider, 100,280).perform
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q8=Question8.new(driver_path)
Q8.maximize_browser()
Q8.slider_function()
Q8.close_browser()