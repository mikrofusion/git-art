#!/usr/bin/env ruby
require 'date'

OUTPUT_BASE_DIR = "output"
OUTPUT_FILE = "README.md"

def load_template(file, template)
  if template.nil?
    puts "Error: #{__FILE__} requires a template file to run."
    puts "To run please pass a template file (e.g. `#{__FILE__} templates/groseclose.txt`)."
    nil
  elsif !File.exists? template
    puts "Error:  template file '#{template}' does not exist."
    nil
  else
    file = File.read(template)
    file.split("\n").map { |line| line.split(",") }
  end
end

def find_directory(base_dir)
  offset = 0
  output_dir = nil
  begin
    offset += 1
    output_dir = "#{base_dir}_#{offset}"
  end while Dir.exists? output_dir
  output_dir
end

def do_commit(output_file, date, c)
  `git init` if !Dir.exists? ".git"
  `echo " " >> #{output_file}`
  `git add #{output_file}`
  date_str = "#{date.strftime('%a %d %b %Y')} 12:0#{c}:00 +0000"
  message = "commit #{c + 1} on #{date.strftime('%a %d %b %Y')} by github.com/mikegroseclose/git-commit-art"
  `GIT_COMMITTER_DATE="#{date_str}" git commit --date "#{date_str}" -m "#{message}."`
end

def do_commits(commit_arr)
  width = commit_arr.first.length unless commit_arr.nil?
  height = commit_arr.length unless commit_arr.nil?
  date = (Date.today - Date.today.wday) - (width * height) + height unless width.nil? or height.nil?

  width.times do |x|
    height.times do |y|
      break if date.to_s > (Date.today - 1).to_s
      count = (commit_arr[y][x]).to_i
      count.times do |c|
        puts do_commit(OUTPUT_FILE, date, c)
      end
      date = date + 1
    end unless height.nil?
  end unless width.nil?
end

def done_message(output_dir)
  "====================================================================\n" +
  "Commits completed. A new git repo has been created at './#{output_dir}'.\n" +
  "Create a new repo on GitHub and then run the following:\n" +
  "  cd ./#{output_dir}\n" +
  "  git remote add origin <new github repo>\n" +
  "  git push -u origin master"
end

output_dir = find_directory OUTPUT_BASE_DIR
commit_arr = load_template __FILE__, ARGV[0]

pwd = Dir.pwd
Dir.mkdir output_dir
Dir.chdir output_dir

puts done_message(output_dir) if do_commits commit_arr

Dir.chdir pwd
