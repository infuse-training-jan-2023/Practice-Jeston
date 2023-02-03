require 'selenium-webdriver'

class Automation_website
    attr_accessor :driver, :wait

    def initialize(driver_path)
            Selenium::WebDriver::Chrome::Service.driver_path=driver_path
            @driver =Selenium::WebDriver.for :chrome
    end

    def maximize_browser()
        driver.get("https://builder.zety.com/signin")
        driver.manage.window.maximize
        sleep(10)
    end

    def fill_personal_details()
                # Fill Form
                driver.find_element(:name,"FNAM").send_keys("Jeston")
                driver.find_element(:name,"LNAM").send_keys("Fernandes")
                driver.find_element(:id,"textDCTL").send_keys("Software Engineer")
                driver.find_element(:id,"city").send_keys("Panjim")
                driver.find_element(:id,"country").send_keys("India")
                driver.find_element(:id,"zip").send_keys("403704")
                driver.find_element(:id,"HPHN").send_keys("1234567890")
                driver.find_element(:id,"EMAI").send_keys("abc@gmail.com")
    end

    def fill_experience_details()
        driver.find_element(:id,"position").send_keys("Team Intern")
        driver.find_element(:id,"company").send_keys("Infuse")
        driver.find_element(:id,"jobcity").send_keys("Panjim")
    end

    
    def display_content()
        sign_up=driver.find_element(:xpath,"//*[@id='sectionSignIn']/div/div/footer/p[2]/a")
        sign_up.click
        sleep(3)
        create_resume=driver.find_element(:xpath,"//*[@id='contentHowItWorks']/section/div/div/div[2]/a[2]").click
        driver.get("https://builder.zety.com/resume/experience-level")
        sleep(10)

        ##Select no experience
        ele=driver.find_element(:class_name,"experience-btn-group")
        buttons=ele.find_elements(:tag_name,"button")
        buttons[0].click

        ##select student
        ele=driver.find_element(:class_name,"are-you-student")
        buttons=ele.find_elements(:tag_name,"button")[0].click
        sleep(5)


         ele=driver.find_elements(:class_name,"container-dropdown")[0]
         puts ele
         b=ele.find_elements(:tag_name,"button")[0]
        # dropdown=driver.find_element(:id,"autoSuggestDropDown")
        # list=dropdown.find_elements(:tag_name,"li")
        # list.each do |option|
        #     if option=="Turkey"
        #         option.click
        #     end
        # end

        ##select template
        ele=driver.find_element(:xpath,"//*[@id='app']/section/div[1]/button").click
        sleep(10)

        ele=driver.find_element(:class_name,"btn-group-footer")
        buttons=ele.find_elements(:tag_name,"button")[0].click
        sleep(5) 
        
        ele=driver.find_element(:id,"createNewResume").click
        sleep(5)


        fill_personal_details()
        
        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(3)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        ##check
        driver.find_element(:id,"fromCal").click
        e=driver.find_elements(:class_name,"react-calendar__year-view")[0]
        e.find_elements(:tag_name,"button")[0].click
        
        sleep(5)

        ele=driver.find_element(:id,"school").send_keys("Goa University")
        driver.find_element(:id,"SCLO").send_keys("Goa")
    
        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[2].click
        sleep(5)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[1].click
        sleep(5)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        fill_experience_details()
        # driver.find_element(:id,"currentJob").click

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        ele=driver.find_element(:class_name,"modal-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)

        ele=driver.find_element(:class_name,"btn-group-footer")
        ele.find_elements(:tag_name,"button")[0].click
        sleep(5)   
    end

    def close_browser()
        driver.close()
    end
end

driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
instance_of_automation_website=Automation_website.new(driver_path)
instance_of_automation_website.maximize_browser()
instance_of_automation_website.display_content()
instance_of_automation_website.close_browser()