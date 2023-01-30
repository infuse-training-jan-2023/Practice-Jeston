require 'test/unit'
require_relative 'SFramework'

class MyTests < Test::Unit::TestCase

    def test_check_if_instance
        instance_of_tests = Tests.new()
        assert instance_of_tests.instance_of? Tests
    end

    def test_naviagte_to_url_positive
        instance=Tests.new()
        assert_equal("Navigated sucessfully",instance.navigate_to_and_maximize("file:///app/form.html"))
    end

    def test_naviagte_to_url_negative
        instance=Tests.new()
        assert_equal("The given url is wrong",instance.navigate_to_and_maximize(" "))
    end

    def test_get_element_by_id_positive
        instance=Tests.new()
        instance.navigate_to_and_maximize("file:///app/form.html")
        name=instance.get_element_by_id("text")
        instance.send_text("test",name)
       assert_equal("",instance.get_text(name))
    end

    def test_get_element_by_id_negative
        instance=Tests.new()
        instance.navigate_to_and_maximize("file:///app/form.html")
        assert_equal("A error occured",instance.get_element_by_id("jeston"))
    end


    # def test_get_element_by_name_positive
    #     instance=Tests.new("/home/jestonfernandes/HTML_Training_INfuse/selenium/chromedriver_linux64/chromedriver")
    #     assert_equal("element found",instance.get_element_by_name("password"))
    # end

    def test_get_element_by_name_negative
        instance=Tests.new()
        instance.navigate_to_and_maximize("file:///app/form.html")
        assert_equal([],instance.get_element_by_name("noexist"))
    end

    # def test_get_element_by_tag_positive
    #     instance=Tests.new("/home/jestonfernandes/HTML_Training_INfuse/selenium/chromedriver_linux64/chromedriver")
    #     assert_equal("element found",instance.get_element_by_tag("input"))
    # end

    def test_get_element_by_tag_negative
        instance=Tests.new()
        instance.navigate_to_and_maximize("file:///app/form.html")
        assert_equal([],instance.get_element_by_tag("noexist"))
    end

    def test_scroll_positive
        instance=Tests.new()
        instance.navigate_to_and_maximize("file:///app/form.html")
        assert_equal("scroll successfull",instance.scroll("200"))
    end

    def test_scroll_negative
        instance=Tests.new()
        instance.navigate_to_and_maximize("file:///app/form.html")
        assert_equal("Scrolling gave an error",instance.scroll("abc"))
    end

    def test_click_positive
        instance=Tests.new()
        instance.navigate_to_and_maximize("file:///app/form.html")
        assert_equal(nil,instance.get_element_by_id("text").click())
    end

    def test_click_negative
        instance=Tests.new()
        instance.navigate_to_and_maximize("file:///app/form.html")
        assert_equal("click unsuccessfull",instance.click())
    end   

    def test_page_title
        instance = Tests.new
        instance.navigate_to_and_maximize("file:///app/form.html")
        assert_equal("Test form",instance.get_title())
    end

    def test_get_text
        instance = Tests.new
        instance.navigate_to_and_maximize("file:///app/form.html")
        ele = instance.get_element_by_tag("h2")[0]
        assert_equal("Test Form", instance.get_text(ele))
    end

    def test_send_text
        instance = Tests.new
        instance.navigate_to_and_maximize("file:///app/form.html")
        ele = instance.get_element_by_id("number")
        assert_equal("success", instance.send_text("2",ele))
    end


    
end
