require 'selenium-webdriver'

class Tests
    attr_accessor :driver, :wait

    def initialize()
            Selenium::WebDriver::Chrome.driver_path = "/opt/chromedriver-109.0.5414.74/chromedriver"
            # driver_path= "C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
            # Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @wait =Selenium::WebDriver::Wait.new(:timeout => 10)
            # @driver =Selenium::WebDriver.for :chrome
            
             options = Selenium::WebDriver::Chrome::Options.new
             options.add_argument("--headless")
             options.add_argument("--no-sandbox")
             options.add_argument("--window-size=1366,768")
             options.add_argument("--disable-gpu")
             options.add_argument("--disable-dev-shm-usage")
             @driver = Selenium::WebDriver.for :chrome, options: options
    end

    def navigate_to_and_maximize(url)
        begin
            driver.get(url)
            driver.manage.window.maximize
            sleep(10)
            return "Navigated sucessfully"
        rescue
            return "The given url is wrong"
        end
    end
    
    def get_element_by_id(element_id)
        begin
            driver.find_element(:id,element_id)
            # return "element found"
        rescue => e
            return "A error occured"
        end
    end

    def get_elements_by_class(element_class)
        begin
            puts element_class
            driver.find_elements(:class,element_class)
        rescue => e
            puts "The error occured #{e.message}"
        end
    end

    def close_popup(popup,close_button)
        begin
            iframe =driver.find_element(:id,popup)
            driver.switch_to.frame(iframe)
            button=driver.find_element(:xpath,close_button)
            button.click()
            driver.switch_to.default_content
        rescue => e
            puts e.message
        end
    end

    def send_text(text, element=self)
        begin
            element.send_keys(text)
            return "success"
        rescue => e
            puts e.message
        end
    end

    def scroll(length)
        begin
            driver.execute_script("window.scrollTo(0,#{length})")
            return "scroll successfull"
        rescue
            return "Scrolling gave an error"
        end
    end

    def get_element_by_xpath(element_xpath)
        begin
            driver.find_element(:xpath,element_xpath)
            
        rescue => e
            puts "A error occured "
        end
    end

    # to validate whether the element is dispalyed in the browser
    def displayed?()
        driver.find_element(self).displayed?
    end

    # To click an element
    def click()
        begin
            driver.find_element(self).click
            # puts "click successfull"
        rescue => e
            return "click unsuccessfull"
        end
    end

    def find_elements(identifier)
        key, value = identifier.first
        begin
            return driver.find_elements(key => value)
        rescue => e
            return "no element found"
        end
    end


    def get_element_by_tag(element_tag, parent=driver)
        begin
            parent.find_elements(:tag_name, element_tag)
        rescue => e
            puts "NO element found"
        end
    end

    def get_element_by_name(element_name)
        begin
            driver.find_elements(:name,element_name)
        rescue => e
            puts "name is invalid"
        end
    end

    def get_title
        begin
            return driver.title
        rescue => e
            return "error occured"
        end
    end

    def get_text(element)
        begin
            return element.text
        rescue => e
            return ("invalid element")
        end
    end

    def get_element_by_linktest(element_linktext)
        begin
            driver.find_element(:link, element_linktext)
        rescue => e
            puts "The error occured #{e.message}"
        end
    end



    # To scroll to the locator
    def scroll_to_element()
        driver.scroll_to_locator(self)
    end

    def close_browser()
        driver.close()
    end
end
