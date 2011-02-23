require 'net/ldap'

module Adconnect
	class ActiveDirectoryUser
		SERVER = 'localhost'   # Active Directory server name or IP
		PORT = 389                    # Active Directory server port (default 389)
		BASE = 'DC=example,DC=com'    # Base to search from
		DOMAIN = 'example.com'        # For simplified user@domain format login
		
		def self.authenticate(username,password)
			@server  ||= SERVER
			@port    ||= PORT
			@base    ||= BASE
			@domain  ||= DOMAIN
			
			conn = Net::LDAP.new :host => @server,
				 :port => @port,
				 :base => @base,
				 :auth => {
					   :method => :simple,
					   :username => "#{username}@#{@domain}",
					   :password => password
				 }
				 
			if conn.bind && user = conn.search(:filter => "sAMAccountName=#{username}").first
			  user
			else
			  nil
			end
		end
		
		def self.server=(s)
			@server = s
		end
		
		def self.port=(p)
			@port = p
		end
		
		def self.base=(b)
			@base = b
		end
		
		def self.domain=(d)
			@domain = d
		end
	end
end
