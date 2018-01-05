# coding: utf-8
def ansied(string, code); "\033[#{code}#{string}\033[0m"; end
def green(s); ansied(s, "32m"); end
def red(s); ansied(s, "31m"); end

def eval_file(path)
  command = <<-COMM
    emacs -Q --batch --eval '(checkdoc-file "#{path}")' 2>&1
    COMM
  value = `#{command}`
  result = !!!(value =~ /#{File.basename(path)}:[0-9]+/)
  [result, value]
end

task :test do
  defaults = {passed: 0, failed: 0, total: 0 }
  paths = Dir.glob("customizations/*.el")
  paths += Dir.glob("elisp/*.el")
  results = paths.inject(defaults) do |result, path|
    filename = File.basename(path)
    success, output = eval_file(path)
    result[:total] += 1
    if success
      result[:passed] += 1
      puts green("#{filename}: ✓")
    else
      result[:failed] += 1
      puts red("#{filename}:")
      puts ""
      puts output.gsub(/^/, '    ')
      puts ""
    end
    result
  end
  puts ""
  if results[:failed] == 0
    puts green("The utmost of successes. #{results[:passed]} passes.")
  else
    puts red("#{results[:failed]}/#{results[:total]} failed")
  end
end
