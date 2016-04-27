# As Rakefile, loaded by thor in current directory
# Install into system by: thor install _this_file_ --as udoc

require 'byebug'

lib = File.expand_path('../lib', __FILE__)
$:.unshift lib

require 'udoc'

class UdocCli < Thor

  desc 'note', 'note it'
  def note(name)
    path = Udoc.abs_filename!(name)
    exec "vim + #{path}"
  end 

  desc 'ls', 'list'
  def ls(path = '')
    path = Udoc.abs_path(path) 
    exec "ls #{path}"
  end

  desc 'latest', 'latest changed'
  def latest()
    path = Udoc.doc_home
    exec "ls -lt #{path} | head -n 20"
  end

  ## for Jekyll
  desc 'import', 'import me'
  def import(path)
    path += '/_posts/*.md'
    Dir[path].each do |file|
      puts "==file: #{file}"
      system "mv -b #{file} #{Udoc.doc_home}/#{File.basename(file)[11..-1]}"
    end
  end 

  no_commands do
    def parse_jekyll_post(path)
      filedata = File.read(path)
      flag = "\n---\n\n"
      header, body = filedata.split(flag)
      headers = YAML.load(header)
      filename = File.basename(path)[11..-1]
      # path include categories?
    end 
  end
end
