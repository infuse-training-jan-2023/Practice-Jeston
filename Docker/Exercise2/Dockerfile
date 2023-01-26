FROM ruby  
WORKDIR /home/jestonfernandes/HTML_Training_INfuse/Docker/Exercise2/Dockerfile
ENV TEST=TEST_ENV
RUN gem install numerizer
COPY Test_ruby.rb .
CMD ruby Test_ruby.rb 'two and three eighths' 'two and a half' '3'  