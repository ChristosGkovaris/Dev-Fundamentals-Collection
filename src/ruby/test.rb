def test
    x = "World"
    yield("Hello")
end

x = "Ruby"

result = test {|y| puts "#{y} #{x}"}