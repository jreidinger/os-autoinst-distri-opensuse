use base "installbasetest";

use testapi;

use strict;
use warnings;
use English;

use Data::Dumper qw(Dumper);
use Carp qw(confess cluck carp croak);

use feature qw/say/;


sub run() {

    wait_serial("Welcome to SUSE Linux Enterprise Server", 300);
    sleep 30; #FIXME Slight delay to make sure the machine has really started and is ready for connection via SSH

    activate_console("ctrl-alt-f2", "ssh-xterm_vt");
    activate_console("ctrl-alt-f3", "ssh-xterm_vt");
    activate_console("ctrl-alt-f4", "ssh-xterm_vt");
    activate_console("ctrl-alt-f5", "ssh-xterm_vt");
    activate_console("ctrl-alt-f6", "ssh-xterm_vt");

    if (!check_var('DESKTOP', 'textmode')) {
        if (get_var("DISPLAY")->{TYPE} eq "VNC") {
        # The vnc parameters are taken from vars.json; connect to the
        # Xvnc running on the system under test...
        activate_console("installation", "remote-vnc" );
        }
    }
}

1;
