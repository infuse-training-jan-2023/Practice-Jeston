FROM ruby  
WORKDIR /home/jestonfernandes/HTML_Training_INfuse/Docker/Exercise3/Dockerfile
ENV TEST=TEST_ENV
RUN gem install test-unit
COPY . .

CMD ruby program_tests.rb  