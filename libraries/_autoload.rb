
def load_gem(gem_name, version)
  begin
    gem gem_name, version
  rescue LoadError
    unless defined?(ChefSpec)
      run_context = Chef::RunContext.new(Chef::Node.new, {}, Chef::EventDispatch::Dispatcher.new)

      require 'chef/resource/chef_gem'

      __gem = Chef::Resource::ChefGem.new(gem_name, run_context)
      __gem.version version
      __gem.run_action(:install)

      gem gem_name, version
    end
  end
end

load_gem('dnsmadeeasy', '= 0.3.2')
load_gem('sym', '= 2.8.4')
