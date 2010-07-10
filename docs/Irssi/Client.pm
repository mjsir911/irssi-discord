__END__

=head1 NAME

Irssi::Client

=head1 FIELDS
Client->{}
  nick - nick of the client
  host - host of the client
  proxy_address - address of the proxy server
  server - Irc::Server for which we proxy to this client
  pass_sent - whether the client already send a PASS command
  user_sent - whether the client already send a USER command
  connected - whether the client is connected and ready
  want_ctcp - whether the client wants to receive CTCPs
  ircnet - network tag of the network we proxy


=head1 METHODS
