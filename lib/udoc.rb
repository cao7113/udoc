require 'fileutils'

module Udoc

  module_function

  #########################################
  #    Public interface
  
  def lookup_paths
    [doc_home]
  end

  def doc_home
    File.expand_path(ENV['unote_home'])
  end

  def normalize_filename(name)
    name = name.gsub(/\s+/, '-')
    name += '.md' unless name.end_with?('.md')
    name[0] = '' if name.start_with?('/')
    name
  end

  def abs_filename(name)
    "#{doc_home}/#{normalize_filename(name)}"
  end

  def abs_filename!(name)
    path = abs_filename(name)
    dir = File.dirname(path)
    FileUtils.mkdir_p(dir) unless File.file?(dir)
    path
  end

  def abs_path(path)
    path[0] = '' if path.start_with?('/')
    File.join(doc_home, path)
  end
end
