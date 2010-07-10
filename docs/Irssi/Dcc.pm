__END__

=head1 NAME

Irssi::Dcc

=head1 FIELDS

Dcc->{}
  type - Type of the DCC: chat, send, get
  orig_type - Original DCC type that was sent to us - same as type except
              GET and SEND are swapped
  created - Time stamp when the DCC record was created

  server - Server record where the DCC was initiated.
  servertag - Tag of the server where the DCC was initiated.
  mynick - Our nick to use in DCC chat.
  nick - Other side's nick name.

  chat - Dcc chat record if the request came through DCC chat
  target - Who the request was sent to - your nick, channel or empty
           if you sent the request
  arg - Given argument .. file name usually

  addr - Other side's IP address.
  port - Port we're connecting in.

  starttime - Unix time stamp when the DCC transfer was started
  transfd - Bytes transferred

Dcc::Chat->{}
  id - Unique identifier - usually same as nick
  mirc_ctcp - Send CTCPs without the CTCP_MESSAGE prefix
  connection_lost - Other side closed connection

Dcc::Get->{}
  (..contains all the same data as core Dcc object..)
  size - File size
  skipped - Bytes skipped from start (resuming file)

  get_type - What to do if file exists? 0=default, 1=rename, 2=overwrite,
             3=resume
  file - The real file name which we use.
  file_quoted - 1 if file name was received quoted ("file name")

Dcc::Send->{}
  (..contains all the same data as core Dcc object..)
  size - File size
  skipped - Bytes skipped from start (resuming file)

  file_quoted - 1 if file name was received quoted ("file name")
  waitforend - File is sent, just wait for the replies from the other side
  gotalldata - Got all acks from the other end


=head1 METHODS

Dcc::destroy()
  Destroy DCC connection.

Dcc::chat_send(data)
  Send `data' to dcc chat.

Dcc::ctcp_message(target, notice, msg)
  Send a CTCP message/notify to target.
