require 'numerizer'
for arg in ARGV
    puts arg
 end

 puts "The command line argument supplied was"
 puts Numerizer.numerize(ENV["TEST"])

 for arg in ARGV
    puts Numerizer.numerize(arg)
 end



