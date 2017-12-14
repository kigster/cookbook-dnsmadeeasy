if defined?(ChefSpec)
  #####################
  # dnsmadeeasy
  #####################
  ChefSpec.define_matcher :dnsmadeeasy

  def create_dnsmadeeasy(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dnsmadeeasy, :create, resource_name)
  end

  def delete_dnsmadeeasy(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dnsmadeeasy, :delete, resource_name)
  end

  def create_dnsmadeeasy_credentials_file(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dnsmadeeasy_credentials_file, :create, resource_name)
  end

  def delete_dnsmadeeasy_credentials_file(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dnsmadeeasy_credentials_file, :delete, resource_name)
  end

  def create_dnsmadeeasy_record(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dnsmadeeasy_record, :create, resource_name)
  end

  def delete_dnsmadeeasy_record(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dnsmadeeasy_record, :delete, resource_name)
  end

  def create_dnsmadeeasy_record_a(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dnsmadeeasy_record_a, :create, resource_name)
  end

  def delete_dnsmadeeasy_record_a(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dnsmadeeasy_record_a, :delete, resource_name)
  end
end
