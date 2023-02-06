require 'selenium-webdriver'

class Driver
    attr_accessor :driver

    def initialize()
        # Selenium::WebDriver::Chrome.driver_path = "/opt/chromedriver-109.0.5414.74/chromedriver"
        driver_path= "C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe" 
        Selenium::WebDriver::Chrome::Service.driver_path=driver_path           
        options = Selenium::WebDriver::Chrome::Options.new
        # options.add_argument("--headless")
        # options.add_argument("--no-sandbox")
        # options.add_argument("--window-size=1366,768")
        # options.add_argument("--disable-gpu")
        # options.add_argument("--disable-dev-shm-usage")
        @driver = Selenium::WebDriver.for :chrome, options: options
    end

    def get_driver()
        return driver
    end
end


class Tests
    attr_accessor :driver

    def initialize(driver)
        @driver=driver.driver
    end

    def navigate_to_and_maximize(url)
        begin
            driver.get(url)
            driver.manage.window.maximize
            sleep(10)
            return "Navigated sucessfully"
        rescue => e
            return "The error #{e.message} occured"
        end
    end

    def switch_to_frame(frame)
        begin
            driver.switch_to.frame(frame)
        rescue => e
            puts "The error #{e.message} occured"
        end
    end
    
    def switch_to_default()
        begin
            driver.switch_to.default_content
        rescue => e
            puts "The error #{e.message} occured"
        end
    end

    def get_element(object,parent=driver)
        begin
            element = parent.find_element(object[:key], object[:value])
        rescue => e
            puts "The error #{e.message} occured"
        end
    end
    
    def get_element_by_id(element_id)
        begin
            driver.find_element(:id,element_id)
            # return "element found"
        rescue => e
            return e.message
        end
    end

    def get_elements_by_class(element_class)
        begin
            puts element_class
            driver.find_elements(:class,element_class)
        rescue => e
            "The error #{e.message} occured"
        end
    end


    def send_text(text, element=self)
        begin
            element.send_keys(text)
            return "success"
        rescue => e
            "The error #{e.message} occured"
        end
    end

    def scroll(length)
        begin
            driver.execute_script("window.scrollTo(0,#{length})")
            return "scroll successfull"
        rescue => e
            puts {e.message}
            return "The error #{e.message} occured"
        end
    end

    def get_element_by_xpath(element_xpath)
        begin
            driver.find_element(:xpath,element_xpath)
            
        rescue => e
            puts "The error #{e.message} occured"
        end
    end

    # to validate whether the element is dispalyed in the browser
    def displayed?()
        driver.find_element(self).displayed?
    end

    # To click an element
    def click(element=self)
        begin
            driver.find_element(element).click
            # puts "click successfull"
        rescue => e
            puts "in rescue"
            return "The error #{e.message} occured"
        end
    end

    def find_elements(identifier)
        key, value = identifier.first
        begin
            return driver.find_elements(key => value)
        rescue => e
            return "The error #{e.message} occured"
        end
    end


    def get_element_by_tag(element_tag, parent=driver)
        begin
            parent.find_elements(:tag_name, element_tag)
        rescue => e
            return "The error #{e.message} occured"
        end
    end

    def get_element_by_name(element_name)
        begin
            driver.find_elements(:name,element_name)
        rescue => e
            return "The error #{e.message} occured"
        end
    end

    def get_title
        begin
            return driver.title
        rescue => e
            puts "The error #{e.message} occured"
        end
    end

    def get_text(element)
        begin
            if element.text.empty?
                return element.attribute("value")
            else
                return element.text
            end
        rescue => e
            puts "The error #{e.message} occured"
        end
    end

    def get_element_by_linktest(element_linktext)
        begin
            driver.find_element(:link, element_linktext)
        rescue => e
            puts "The error #{e.message} occured"
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
