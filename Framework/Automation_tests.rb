require 'test/unit'
require_relative 'TestFramework'
require 'selenium-webdriver'

class MyTests < Test::Unit::TestCase

    attr_accessor :driver


    @docker_url="file:///app/form.html"
    @local_url="file:///C:\\Users\\Jeston\\Desktop\\test\\Practice-Jeston\\Framework\\form.html"


    # def test_check_if_instance
    #     instance_of_tests = Tests.new(Driver.new)
    #     assert instance_of_tests.instance_of? Tests
    # end

    def test_naviagte_to_url_positive
        driver_object=Driver.new.get_driver()
        instance=Tests.new(driver_object)
        assert_equal("Navigated sucessfully",instance.navigate_to_and_maximize("file:///app/form.html"))
    end

    def test_naviagte_to_url_negative
        driver_object=Driver.new.get_driver()
        instance=Tests.new(driver_object)
        assert_equal("The error invalid argument\n" +
12:41:19   "  (Session info: headless chrome=109.0.5414.119) occured",instance.navigate_to_and_maximize("abc"))
    end

    def test_get_element_by_id_positive
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        instance=Tests.new(driver_object)
        name=instance.get_element_by_id("text")
        name.send_keys("test")
        assert_equal("test",name['value'])
    end

    def test_get_element_by_id_negative
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        instance=Tests.new(driver_object)
        assert_equal("o such element: Unable to locate element: {\"method\":\"css selector\",\"selector\":\"#jeston\"}\n" +
12:41:16   "  (Session info: headless chrome=109.0.5414.119)"),instance.get_element_by_id('jeston'))
    end


    # # def test_get_element_by_name_positive
    # #     instance=Tests.new("/home/jestonfernandes/HTML_Training_INfuse/selenium/chromedriver_linux64/chromedriver")
    # #     assert_equal("element found",instance.get_element_by_name("password"))
    # # end

    def test_get_element_by_name_negative
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        instance=Tests.new(driver_object)
        assert_equal([],instance.get_element_by_name("noexist"))
    end

    # # # def test_get_element_by_tag_positive
    # # #     instance=Tests.new("/home/jestonfernandes/HTML_Training_INfuse/selenium/chromedriver_linux64/chromedriver")
    # # #     assert_equal("element found",instance.get_element_by_tag("input"))
    # # # end

    def test_get_element_by_tag_negative
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        instance=Tests.new(driver_object)
        assert_equal([],instance.get_element_by_tag("noexist"))
    end

    def test_scroll_positive
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        instance=Tests.new(driver_object)
        assert_equal("scroll successfull",instance.scroll("200"))
    end

    def test_scroll_negative
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        instance=Tests.new(driver_object)
        #instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\test\\Practice-Jeston\\Framework\\form.html")
        assert_equal("The error javascript error: abc is not defined\n" +
12:41:31   "  (Session info: headless chrome=109.0.5414.119) occured",instance.scroll("abc"))
    end

    def test_click_positive
        instance=Tests.new(Driver.new)
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        element=driver_object.find_element(id:"text")
        element.click()
        sleep(5)
        element=driver_object.find_element(id:"text")
        assert_equal("testdata",element['value'])
    end

    def test_click_negative
        instance=Tests.new(Driver.new)
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        assert_equal("The error undefined method `find_element' for #<Driver:0x0000560a87d0a100> occured",instance.click())
    end   

    def test_page_title
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        instance=Tests.new(driver_object)
        assert_equal("Test form",instance.get_title())
    end

    def test_get_text
        instance = Tests.new(Driver.new)
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        element = driver_object.find_element(:tag_name,"h2")
        assert_equal("Test Form", instance.get_text(element))
    end

    def test_send_text
        instance = Tests.new(Driver.new)
        driver_object=Driver.new.get_driver()
        driver_object.get("file:///app/form.html")
        ele = driver_object.find_element(:id,"number")
        assert_equal("success", instance.send_text("2",ele))
    end
end
