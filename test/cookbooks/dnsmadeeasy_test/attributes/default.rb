require 'dme'
require 'sym'

TEST_KEY = ENV['DME_KEY']
if TEST_KEY
  creds_hash = { api_key:    "BAhTOh1TeW06OkRhdGE6OldyYXBwZXJTdHJ1Y3QLOhNlbmNyeXB0ZWRfZGF0YSJVWEwLsGkvflEjHmRzv8G_SZ_T98mjyuR5WAVSScDplpDqZmUqBSa1qw62AkDumnDpWxhWbGn-wisXN2cYS3gOAS854Zz23SLl58DO-s2dTSo6B2l2IhUo3XY-bxl97Il3eU32EurzOhBjaXBoZXJfbmFtZSIQQUVTLTI1Ni1DQkM6CXNhbHQwOgx2ZXJzaW9uaQY6DWNvbXByZXNzVA==",
                 api_secret: "BAhTOh1TeW06OkRhdGE6OldyYXBwZXJTdHJ1Y3QLOhNlbmNyeXB0ZWRfZGF0YSJVASqs4-tgMPjzjCm1CMQa8EF3KoYvu2ODepU3OpEBo7m_aQ2D4eptbFa1G7c1ZGtS4mZvYioPF5mh5zXEuWBPgpCrraE_PaKIZWA5OztAOoU6B2l2IhUfHqdrrsMwux40P2z5roeNOhBjaXBoZXJfbmFtZSIQQUVTLTI1Ni1DQkM6CXNhbHQwOgx2ZXJzaW9uaQY6DWNvbXByZXNzVA==" }

  class CredentialsWrapper < Struct.new(:encrypted_key, :encrypted_secret)
    include Sym

    def api_key
      decr(encrypted_key, TEST_KEY)
    end

    def api_secret
      decr(encrypted_secret, TEST_KEY)
    end
  end

  creds = CredentialsWrapper.new(creds_hash[:api_key], creds_hash[:api_secret])

  default['dnsmadeeasy_test']['api_key']        ||= creds.api_key
  default['dnsmadeeasy_test']['api_secret']     ||= creds.api_secret
  default['dnsmadeeasy_test']['encryption_key'] ||= TEST_KEY
else
  default['dnsmadeeasy_test']['api_key']        ||= nil
  default['dnsmadeeasy_test']['api_secret']     ||= nil
  default['dnsmadeeasy_test']['encryption_key'] ||= nil
end

default['dnsmadeeasy_test']['domain']   = 'homebase.systems'
default['dnsmadeeasy_test']['hostname'] = 'cookbook-app100'
default['dnsmadeeasy_test']['cname']    = { 'cookbook-app100' => 'whoohoo' }
