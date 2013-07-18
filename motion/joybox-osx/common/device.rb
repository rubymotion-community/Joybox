module Joybox
  module Common

    module Device

      module_function

      def self.retina?
        false
      end

      def self.scale_factor
        1
      end

      def self.os_version
        major = Pointer.new(:int)
        Gestalt(GestaltSystemVersionMajor, major)
        minor = Pointer.new(:int)
        Gestalt(GestaltSystemVersionMinor, minor)
        bug_fix = Pointer.new(:int)
        Gestalt(GestaltSystemVersionBugFix, bug_fix)

        "#{major[0]}.#{minor[0]}.#{bug_fix[0]}"
      end

    end

  end
end