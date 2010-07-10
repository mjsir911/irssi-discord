__END__

=head1 NAME

Irssi::Query

=head1 FIELDS

Process->{}
  id - ID for the process
  name - Name for the process (if given)
  args - The command that is being executed

  pid - PID for the executed command
  target - send text with /msg <target> ...
  target_win - print text to this window

  shell - start the program via /bin/sh
  notice - send text with /notice, not /msg if target is set
  silent - don't print "process exited with level xx"

=head1 METHODS
