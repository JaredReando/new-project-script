
'https://rubygems.org'
require 'fileutils'
print("Enter your project name: ")
project_name = gets.strip
print("Enter your classes separated by spaces: ")
class_names = gets.strip.split(" ")


  def pwd
    Dir.pwd
  end
 directory = Dir.pwd

FileUtils.mkdir("#{project_name}")
FileUtils.cd("/#{directory}/#{project_name}")
FileUtils.touch("Gemfile")

open('Gemfile', 'a') { |f|
  f.puts "source 'https://rubygems.org'"
  f.puts "gem 'rspec'"
  f.puts "gem 'pry'"
  f.puts "gem 'pivotal_git_scripts'"
}

FileUtils.mkdir("lib")
FileUtils.mkdir("spec")
FileUtils.cd("/#{directory}/#{project_name}/lib")
FileUtils.touch("#{project_name}.rb")
FileUtils.cd("/#{directory}/#{project_name}/spec")
FileUtils.touch("#{project_name}_specs.rb")

class_names.each do |name|
  name.capitalize!()

  FileUtils.cd("/#{directory}/#{project_name}/lib")
  open("#{name}.rb", 'a') { |f|
    f.puts "class #{name}"
    f.puts "end"
  }
  FileUtils.cd("/#{directory}/#{project_name}/spec")
  open("#{name}_specs.rb", 'a') { |f|
    f.puts "require '#{name}'"
    f.puts "describe('#{name}') do"
    f.puts
    f.puts "end"
  }
end
