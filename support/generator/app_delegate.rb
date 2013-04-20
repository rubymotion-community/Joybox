module Joybox
  module Support

    class AppDelegate < Base

      def generate

        app_delegate_path = File.join(Constants::APP_FOLDER, "app_delegate.rb")
        remove_file(app_delegate_path, :verbose => false)
        template('app_delegate.erb', app_delegate_path)
      end

    end

  end
end