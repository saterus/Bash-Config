# stop Rails from adding all this stuff when it starts the server. rails' #h and utility belt's #h conflict.
# utility belt is required second, so rails fails in a lot of places since #h is now #history instead of #sanitize
unless $0 == 'script/server'

  # i always end up wanting ot pretty-print stuff.
  require 'pp'
  require 'rubygems'
  require 'utility_belt'
  require '~/rapleaf/util/raplite/trunk/lib/prolite'
  require 'thrift'
  require '~/rapleaf/spider/trunk/include/rap_support/thrift/diff_extension'

  # terminal color constants!
  unless defined?(IRB_CONSTS_LOADED)
    ANSI_BLACK = "\033[0;30m"
    ANSI_GRAY = "\033[1;30m"
    ANSI_LGRAY = "\033[0;37m"
    ANSI_WHITE = "\033[1;37m"
    ANSI_RED = "\033[0;31m"
    ANSI_LRED = "\033[1;31m"
    ANSI_GREEN = "\033[0;32m"
    ANSI_LGREEN = "\033[1;32m"
    ANSI_BROWN = "\033[0;33m"
    ANSI_YELLOW = "\033[1;33m"
    ANSI_BLUE = "\033[0;34m"
    ANSI_LBLUE = "\033[1;34m"
    ANSI_PURPLE = "\033[0;35m"
    ANSI_LPURPLE = "\033[1;35m"
    ANSI_CYAN = "\033[0;36m"
    ANSI_LCYAN = "\033[1;36m"

    ANSI_BACKBLACK = "\033[40m"
    ANSI_BACKRED = "\033[41m"
    ANSI_BACKGREEN = "\033[42m"
    ANSI_BACKYELLOW = "\033[43m"
    ANSI_BACKBLUE = "\033[44m"
    ANSI_BACKPURPLE = "\033[45m"
    ANSI_BACKCYAN = "\033[46m"
    ANSI_BACKGRAY = "\033[47m"

    ANSI_RESET = "\033[0m"
    ANSI_BOLD = "\033[1m"
    ANSI_UNDERSCORE = "\033[4m"
    ANSI_BLINK = "\033[5m"
    ANSI_REVERSE = "\033[7m"
    ANSI_CONCEALED = "\033[8m"

    XTERM_SET_TITLE = "\033]2;"
    XTERM_END = "\007"
    ITERM_SET_TAB = "\033]1;"
    ITERM_END = "\007"
    SCREEN_SET_STATUS = "\033]0;"
    SCREEN_END = "\007"
    IRB_CONSTS_LOADED = true
  end

  # this always bugged me.
  class Symbol
    include Comparable
    def <=>(other)
      self.to_s <=> other.to_s
    end
  end

  # best debugging method ever. provides on the fly documentation. you can basically grep for methods.
  # usage: "test".pm             OR
  # usage: pm("test", /^to_/)
  class Object
    def print_methods(obj=self, *options) # Print methods
      methods = obj.methods
      methods -= Object.methods unless options.include? :more
      filter = options.select {|opt| opt.kind_of? Regexp}.first
      methods = methods.select {|name| name =~ filter} if filter

      data = methods.sort.collect do |name|
        method = obj.method(name)
        if method.arity == 0
          args = "()"
        elsif method.arity > 0
          n = method.arity
          args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
        elsif method.arity < 0
          n = -method.arity
          args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
        end
        klass = $1 if method.inspect =~ /Method: (.*?)#/
        [name, args, klass]
      end
      max_name = data.collect {|item| item[0].size}.max
      max_args = data.collect {|item| item[1].size}.max
      data.each do |item|
        print " #{ANSI_BOLD}#{ANSI_RED}#{item[0].rjust(max_name)}#{ANSI_RESET}"
        print "#{ANSI_GREEN}#{item[1].ljust(max_args)}#{ANSI_RESET}"
        print " #{ANSI_CYAN}#{item[2]}#{ANSI_RESET}\n"
      end
      data.size
    end
    alias :pm :print_methods
  end

  class InteractiveEditor
    ENV["VISUAL"] = '/usr/local/include/emacs/nextstep/Emacs.app/Contents/MacOS/bin/emacsclient -c'
  end

  module InteractiveEditing
    # this gives errors if i try to use normal alias.
    def edit
      edit_interactively
    end
  end

  # equip my favorite utility belt tools.
  UtilityBelt.equip(:command_history, :convertable_to_file, :google, :hash_math, :interactive_editor, :irb_options, :is_an, :language_greps, :not, :pipe, :prompt, :string_to_proc, :symbol_to_proc, :wirble, :with)
  Wirble::Colorize.enable_pp

  # quick access to the Raplite if needed.
  def sign
    $sign ||= Prolite::Sign.new
  end

  def sample_dus
    $sample_dus ||= [Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :source_membership => Rapleaf::Types::NewPersonData::SourceMembership.new( :exists => true, :source => Rapleaf::Types::NewPersonData::Source.new( :es_site => Rapleaf::Types::PersonData::EsSite::GOOGLE ) ) ) ),
Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :source_membership => Rapleaf::Types::NewPersonData::SourceMembership.new( :exists => false, :source => Rapleaf::Types::NewPersonData::Source.new( :es_site => 135 ) ) ) ),
Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :source_membership => Rapleaf::Types::NewPersonData::SourceMembership.new( :exists => false, :source => Rapleaf::Types::NewPersonData::Source.new( :es_site => 99 ) ) ) ),
Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :source_membership => Rapleaf::Types::NewPersonData::SourceMembership.new( :exists => false, :source => Rapleaf::Types::NewPersonData::Source.new( :es_site => 99 ) ) ) ),
Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :equiv => Rapleaf::Types::NewPersonData::PIN.new( :es_pin => Rapleaf::Types::NewPersonData::EsPIN.new( :site => 135, :identifier => Rapleaf::Types::NewPersonData::UserIdOrName.new( :username => "andrewrgrill" ) ) ) ) ),
Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :equiv => Rapleaf::Types::NewPersonData::PIN.new( :es_pin => Rapleaf::Types::NewPersonData::EsPIN.new( :site => 135, :identifier => Rapleaf::Types::NewPersonData::UserIdOrName.new( :username => "Andrewrgrill" ) ) ) ) ),
Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :equiv => Rapleaf::Types::NewPersonData::PIN.new( :es_pin => Rapleaf::Types::NewPersonData::EsPIN.new( :site => 68, :identifier => Rapleaf::Types::NewPersonData::UserIdOrName.new( :username => "Andrewrgrill" ) ) ) ) ),
Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :equiv => Rapleaf::Types::NewPersonData::PIN.new( :email => "andrewrgrill@gmail.com" ) ) ),
Rapleaf::Types::NewPersonData::DataUnit.new( :data => Rapleaf::Types::NewPersonData::DataUnitValueUnion.new( :equiv => Rapleaf::Types::NewPersonData::PIN.new))]
  end

  def sample_du
    sample_dus.first
  end

  def sample_hash
    $sample_hash ||= {:k => :v, :key => :value, 'k' => 'v', "key" => "v"}
  end

  def sample_array
    $sample_array ||= [1,2,3,4,5,6,7,8,9,10]
  end

end
