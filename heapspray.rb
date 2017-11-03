=begin

BETTERCAP

Author   : ***YOUR NAME***
Email    : ***YOUR EMAIL***
Blog     : ***YOUR TWEETS***

This project is released under the GPL 3 license.

=end

class HeapSpray < BetterCap::Proxy::HTTP::Module
    meta(
        'Name'            => 'HeapSpray',
        'Description'     => 'For Internet Explorer browsers, deliver a JS heap spray',
        'Version'         => '1.0.0',
        'Author'          => "***YOUR NAME***",
        'License'         => 'GPL3'
    )

    @@verbose = true
    @@options = nil

    def self.on_options(opts)
        opts.separator ""
        opts.separator "Heap Spray Proxy Module Options:"
        opts.separator ""

        opts.on( '--heapspray-verbose', 'Verbose logging.' ) do |v|
            @@options = v
        end
    end

    def initialize
        @@verbose = false if @@options.nil?
    end

    def on_request(request, response)
	    detect_ie(request)
    end

    def detect_ie(request)
	    BetterCap::Logger.info request.headers['User-Agent'].green	
    end
end

