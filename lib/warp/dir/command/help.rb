require 'warp/dir/command'
class Warp::Dir::Command::Help < Warp::Dir::Command
  description 'Show this extremely unhelpful text'
  aliases :wtf

  USAGE = <<EOF
#{"Usage:".bold.green}  wd [ --command ] [ list | help ] [ flags ]
        wd [ --command ] [ [ warp ] | add  [ -f/--force ] | rm | ls | ] <point>   [ flags ]
        wd --help | help
EOF

  EXAMPLES = <<EOF

#{'Examples'.bold.green}
      wd add proj    add current directory as a warp point
      cd ~/
      wd proj        jumps to proj
      wd list        lists all points
      wd rm proj     removes proj

#{'Installation'.bold.green}

     In order for this awesome warper to work, you must install the shell wrapper which then
     calls into the ruby to do the job. Shell wrapper function is required in order to
     change directory in the outer shell (parent process). Do not worry about this if you
     do not understand it, but please run this command:

     #{'wd install [ --shell [ bash | zsh ] ]'.bold.green}

     This command will ensure you have the wrapper installed in your ~/.bashrc or ~/.zshrc
     files. Once installed, just restart your shell!

EOF
  def run(*args)
    commander = ::Warp::Dir.commander
    on :success do
      message USAGE
      message ' '
      message 'Warp Point Commands:'.bold.green
      message ' '
      commander.commands.select{|cmd| cmd.needs_a_point?}.map(&:command_name).each do |installed_commands|
        message sprintf("  %s\n", commander.find(installed_commands).help)
      end
      message ' '
      message 'Global Commands:'.bold.green
      message ' '
      commander.commands.reject{|cmd| cmd.needs_a_point?}.map(&:command_name).each do |installed_commands|
        message sprintf("  %s\n", commander.find(installed_commands).help)
      end
      message EXAMPLES
    end
  end
end
