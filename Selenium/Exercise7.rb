require 'selenium-webdriver'

class Question7
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://letcode.in/forms")
        driver.manage.window.maximize
        # wait.until(driver.manage.window.maximize)
        sleep(10)
    end
    
    def select_display_ith_content(i)
        select=driver.find_element(:xpath,"/html/body/app-root/app-forms/section[1]/div/div/div[1]/div/div/form/div[2]/div[2]/div/div/div/select")
        alloptions=select.find_elements(:tag_name,"option")
        alloptions[i].click
        puts alloptions[i].attribute("text")
        # alloptions.each do |option|
        #     puts option.attribute("text")
        # end
        sleep(3)
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
Q7=Question7.new(driver_path)
Q7.maximize_browser()
Q7.select_display_ith_content(3)
Q7.close_browser()