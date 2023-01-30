require_relative 'SFramework'


class Automation
    attr_accessor :tests_object, :driver_path, :close_button, :account_toggle, :popup, :search_bar_xpath, :search_term, :search_bar_name, :popup2, :add_to_cart

    def initialize
        # @driver_path="C:\\Users\\Jeston\\Downloads\\chromedriver_win32\\chromedriver.exe"
        #@close_button="//*[@id='form-body-main']/div[1]/div/div"
        @popup="cmessage_form_iframe"
        @search_bar_xpath="//*[@id='shopify-section-header']/div/header/div/div/div[3]/form/div/button"
        @search_term="sunscreen"
        @tests_object=Tests.new()
    end
    
    def navigate_to
        tests_object.navigate_to_and_maximize("https://sublimelife.in/")
        sleep(30)
        tests_object.close_popup(popup,"//*[@id='form-body-main']/div[1]/div/div")
    end

    def login_and_signup
        puts "started with automation of login and signup module"
        
        tests_object.get_element_by_id("HeaderAccountToggle").click()
        dropdown=tests_object.get_element_by_id("HeaderAccountMenu")
        puts tests_object.get_element_by_tag("a",dropdown)[5].click
        # puts tests_object.get_element_by_tag("a",dropdown).length
        #login
        email=tests_object.get_element_by_id("CustomerEmail")
        tests_object.send_text("test@abc.com",email)
        pass=tests_object.get_element_by_id("CustomerPassword")
        tests_object.send_text("test@abc.com",pass)
        tests_object.get_element_by_xpath("//*[@id='customer_login']/button").click()
        sleep(5)

        #signup
        tests_object.get_element_by_xpath("//*[@id='CustomerLoginForm']/div/div[1]/a").click()
        
        fname=tests_object.get_element_by_id("FirstName")
        tests_object.send_text("test",fname)
        lname=tests_object.get_element_by_id("LastName")
        tests_object.send_text("test",lname)
        email=tests_object.get_element_by_id("Email")
        tests_object.send_text("test@test.net",email)
        email=tests_object.get_element_by_id("CreatePassword")
        tests_object.send_text("qwerty123",email)
        form=tests_object.get_element_by_id("create_customer")
        buttons=tests_object.get_element_by_tag("button",form)[0].click()

        #logout
        
        tests_object.get_element_by_id("HeaderAccountToggle").click()
        dropdown=tests_object.get_element_by_id("HeaderAccountMenu")
        lists=tests_object.get_element_by_tag("a",dropdown)[5].click()
        puts "done with automation of login and signup module"
        sleep(10)
        tests_object.navigate_to_and_maximize("https://sublimelife.in/")
        
    end

    def search
        puts "started with automation of search module"
        form = tests_object.get_element_by_tag("form")[1]
        inputs = tests_object.get_element_by_tag("input", form)[0]
        tests_object.send_text(search_term, inputs)
        tests_object.get_element_by_xpath(search_bar_xpath).click
        sleep(15)
        tests_object.close_popup(popup,"//*[@id='form-body-main']/div[1]/div/div")
        sleep(5)
        filter=tests_object.get_elements_by_class("snize-product-filters-list")[0]
        items=tests_object.get_element_by_tag("li",filter)[0]
        puts tests_object.get_element_by_xpath("//*[@id='snize_filters_block_snize_facet1']/div").click
        puts "end with automation of add to cart module"
        sleep(10)
        tests_object.navigate_to_and_maximize("https://sublimelife.in/")
    end    

    def add_to_cart
        puts "started with automation of add to cart module"
        tests_object.scroll(2000)
        container=tests_object.get_elements_by_class("slick-track")[2]
        buttons=tests_object.get_element_by_tag("button",container)
        puts  buttons[0].click
        sleep(5)
        c=tests_object.get_element_by_id("QuickView-martiderm-dsp-bright")
        f=tests_object.get_element_by_tag("form",c)[0]
        b=tests_object.get_element_by_tag("button",f);
        b[1].click()
        sleep(3)
        b[2].click
        sleep(10)
        tests_object.get_element_by_xpath("//*[@id='ajaxCartForm']/div[3]/a").click()
        sleep(5)
        puts "finished with add_to_cart module"
        sleep(10)
        tests_object.navigate_to_and_maximize("https://sublimelife.in/")
    end

    def checkout_payment
        puts "started testing the checkout module"
        tests_object.scroll(2000)
        container=tests_object.get_elements_by_class("slick-track")[2]
        buttons=tests_object.get_element_by_tag("button",container)
        puts  buttons[0].click
        sleep(5)
        c=tests_object.get_element_by_id("QuickView-martiderm-dsp-bright")
        f=tests_object.get_element_by_tag("form",c)[0]
        b=tests_object.get_element_by_tag("button",f);
        b[1].click()
        sleep(3)
        b[2].click
        sleep(5)
        puts "[+]cart updated"
        tests_object.get_element_by_xpath("//*[@id='ajaxCartForm']/div[3]/a").click()
        sleep(5)
        tests_object.navigate_to_and_maximize("https://sublimelife.in/")
        sleep(5)
        cart=tests_object.get_element_by_xpath("//*[@id='shopify-section-header']/div/header/div/div/div[4]/ul/li[2]/a").click
        sleep(5)
        tests_object.get_element_by_xpath("//*[@id='ajaxCartForm']/div[3]/a").click()
        sleep(2)
        tests_object.get_element_by_xpath("//*[@id='chck1']/div/div/div[2]/button").click()
        sleep(5)
        puts "[+]filling in deleievry address"
        email=tests_object.get_element_by_id("email")
        tests_object.send_text("test@test.com",email)
        tf1=tests_object.get_element_by_id("TextField1")
        tests_object.send_text("test",tf1)
        tf2=tests_object.get_element_by_id("TextField2")
        tests_object.send_text("test",tf2)
        address1=tests_object.get_element_by_id("address1")
        tests_object.send_text("anywhere",address1)
        tf5=tests_object.get_element_by_id("TextField5")
        tests_object.send_text("Panjim",tf5)
        sleep(5)

        # Get the select element
        select_element = tests_object.get_element_by_id("Select1")
        # Create a select object
        select = Selenium::WebDriver::Support::Select.new(select_element)
        # Select the option with the given text
        select.select_by(:text, 'Goa')

        tf6=tests_object.get_element_by_id("TextField6")
        tests_object.send_text("403706",tf6)
        tf7=tests_object.get_element_by_id("TextField7")
        tests_object.send_text("1234567890",tf7)
        sbmt=tests_object.get_element_by_xpath("//*[@id='Form1']/div[1]/div/div/div[2]/div[1]/button")
        sbmt.click
        sleep(20)
        tests_object.get_element_by_xpath("//*[@id='Form2']/div[1]/div/div/div[2]/div[1]/button").click
        sleep(3)
        puts "[+]module checkout successfull"
        sleep(10)
        tests_object.navigate_to_and_maximize("https://sublimelife.in/")
    end

    def display_product_page
        puts "module to check display page"
        tests_object.scroll(2500)
        sleep(10)
        tests_object.get_element_by_id("ProductImageWrapper-19722052665497").click
        sleep(2)
        # temp=tests_object.get_elements_by_class("jdgm-ask-question-btn")[0].click
        sleep(10)
        puts "[+]module display product successfull"
        sleep(10)
        tests_object.navigate_to_and_maximize("https://sublimelife.in/")
    end

end

F1=Automation.new()
F1.navigate_to()
F1.login_and_signup() 


#F1.search()

sleep(10)
#F1.navigate_to()
F1.display_product_page()

sleep(10)
#F1.navigate_to()
F1.add_to_cart()

sleep(10)
#F1.navigate_to()
F1.checkout_payment()

#sleep(10)
#F1.navigate_to()
#F1.display_product_page()
