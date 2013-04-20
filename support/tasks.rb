task :joybox do

  puts Joybox::Support::Setup.desc
end

namespace :joybox do

  # Setting up a alias for the setup task
  task :sp => :setup

  desc "Joybox: Project Setup"
  task :setup do

    setup = Joybox::Support::Setup.new
    setup.generate_project_structure
    setup.generate_resources
    setup.generate_clases
  end


  # Setting up a alias for the generate task
  task :g => :generate

  desc "Joybox: Class Generator"
  task :generate => :safe_arguments do  

    begin

      generator = Joybox::Support::Generator.new
      generator.generate(ARGV[1], ARGV[2])

    rescue

      # On case of failure print the Generator
      # Description
      puts Joybox::Support::Generator.desc
    end
  end


  # Allow a rake task to receive arguments 
  # with spaces without sending error messages 
  task :safe_arguments do

    ARGV.each { |argv|

      task argv.to_sym do ; end
    }
  end

end