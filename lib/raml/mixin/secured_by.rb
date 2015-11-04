module Raml
  # @private
	module SecuredBy
    def parse_secured_by(data)
      validate_array :secured_by, data, [String, Hash]

      data.map do |security_scheme|
        if security_scheme.is_a? Hash
          raise InvalidProperty, 'is property with map with more than one key' if security_scheme.size > 1
          raise InvalidProperty, 'is property with map of security_scheme name but params are not a map' unless
            security_scheme.values[0].is_a? Hash
          SecuritySchemeReference.new( security_scheme.keys[0], security_scheme.values[0], self )
        else
          SecuritySchemeReference.new security_scheme, {}, self
        end
      end
    end

    def _validate_secured_by
      valid_security_schemes = security_scheme_declarations.keys + ["null"]
      secured_by.map(&:name).each do |security_scheme_name|
        raise UnknownSecuritySchemeReference.new(security_scheme_name) unless
          valid_security_schemes.include?(security_scheme_name)
      end
    end
	end
end