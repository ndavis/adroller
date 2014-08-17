module AdRoll
  module Api
    class Service

      def self.user_name
        ENV['USERNAME']
      end

      def self.password
        ENV['PASSWORD']
      end
    end
  end
end
