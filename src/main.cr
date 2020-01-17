if ARGV.size == 0
    begin
        raise Exception.new("Usage: crystal run <filename.cr> -- args")
    rescue
        puts "Please, pass file to read from as an argument"
    end
end
array = [] of String | Int32
file = File.new(ARGV[0], "r")
file.each_line() do |line|
    array << line
end

array = array.map{|x| x.to_f}
mean = array.sum / array.size
mean_diffs = array.map{|x| (x - mean)*(x-mean)}
puts Math.sqrt(mean_diffs.sum / array.size)