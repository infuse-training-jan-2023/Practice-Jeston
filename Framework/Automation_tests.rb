require 'test/unit'
require_relative 'TestFramework'

class MyTests < Test::Unit::TestCase

    attr_accessor :local_url, :docker_url

    docker_url="file:///app/form.html"
    @local_url="file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html"

    def test_check_if_instance
        instance_of_tests = Tests.new(Driver.new)
        assert instance_of_tests.instance_of? Tests
    end

    def test_naviagte_to_url_positive
        instance=Tests.new(Driver.new)
        assert_equal("Navigated sucessfully",instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html"))
    end

    def test_naviagte_to_url_negative
        instance=Tests.new(Driver.new)
        assert_equal("The error invalid argument\n" +
        "  (Session info: chrome=109.0.5414.120) occured",instance.navigate_to_and_maximize("abc"))
    end

    def test_get_element_by_id_positive
        instance=Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        name=instance.get_element_by_id("text")
        instance.send_text("test",name)
       assert_equal("test",instance.get_text(name))
    end

    def test_get_element_by_id_negative
        instance=Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        assert_equal("no such element: Unable to locate element: {\"method\":\"css selector\",\"selector\":\"#jeston\"}\n" +
        "  (Session info: chrome=109.0.5414.120)",instance.get_element_by_id('jeston'))
    end


    # def test_get_element_by_name_positive
    #     instance=Tests.new("/home/jestonfernandes/HTML_Training_INfuse/selenium/chromedriver_linux64/chromedriver")
    #     assert_equal("element found",instance.get_element_by_name("password"))
    # end

    def test_get_element_by_name_negative
        instance=Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        assert_equal([],instance.get_element_by_name("noexist"))
    end

    # def test_get_element_by_tag_positive
    #     instance=Tests.new("/home/jestonfernandes/HTML_Training_INfuse/selenium/chromedriver_linux64/chromedriver")
    #     assert_equal("element found",instance.get_element_by_tag("input"))
    # end

    def test_get_element_by_tag_negative
        instance=Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        assert_equal([],instance.get_element_by_tag("noexist"))
    end

    def test_scroll_positive
        instance=Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        assert_equal("scroll successfull",instance.scroll("200"))
    end

    def test_scroll_negative
        instance=Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        assert_equal("The error javascript error: abc is not defined\n" +
        "  (Session info: chrome=109.0.5414.120) occured",instance.scroll("abc"))
    end

    def test_click_positive
        instance=Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        element=instance.get_element_by_id("text").click()
        assert_equal("testdata",instance.get_text(element))
    end

    def test_click_negative
        instance=Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        assert_equal("The error expected #<Tests:0x000001fc3cc95380 @driver=#<Selenium::WebDriver::Chrome::Driver:0x5da7da62 browser=:chrome>>:Tests to respond 
        to #shift occured",instance.click())
    end   

    def test_page_title
        instance = Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        assert_equal("Test form",instance.get_title())
    end

    def test_get_text
        instance = Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        ele = instance.get_element_by_tag("h2")[0]
        assert_equal("Test Form", instance.get_text(ele))
    end

    def test_send_text
        instance = Tests.new(Driver.new)
        instance.navigate_to_and_maximize("file:///C:\\Users\\Jeston\\Desktop\\Infuse_Training\\Practice-Jeston\\Framework\\form.html")
        ele = instance.get_element_by_id("number")
        assert_equal("success", instance.send_text("2",ele))
    end
end
