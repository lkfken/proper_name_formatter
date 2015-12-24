require 'proper_name_formatter/version'
require 'yaml'

class ProperNameFormatter
  attr_accessor :full_name, :first_name, :last_name, :title

  def initialize(params={})
    self.first_name = params.fetch(:first_name, '')
    self.last_name  = params.fetch(:last_name, '')
    self.title      = params.fetch(:title, '')
    self.full_name  = params.fetch(:full_name, '')
  end

  def value
    return full_name unless full_name.empty?
    self.full_name = [first_name, last_name].join(' ')
    title.empty? ? full_name : [full_name, ', ', title].join
  end

  def patch(name)
    defaults = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'config', 'name_patch.yml'))
    config   = defaults.merge(user_define_values)
    config.each { |target, replace| name.gsub!(target, replace) }
    name
  end

  def capitalize
    after_last_name = value.slice!(/,.*/)
    a               = value.split(' ')
    s               = a.map(&:capitalize).join(' ')
    s << [after_last_name.upcase].join(' ') unless after_last_name.nil?
    patch(s)
  end

  private

  def user_define_values
    user_define_file   = File.join('.', 'config', 'name_patch.yml')
    user_define_values = Hash.new
    user_define_values = YAML.load_file(user_define_file) if File.exist?(user_define_file)
    user_define_values
  end

end
