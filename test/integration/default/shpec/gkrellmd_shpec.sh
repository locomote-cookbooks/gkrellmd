describe "user"
  it "should have gkrellmd running"
    pgrep gkrellmd
    assert equal "$?" 0

  it "should have the default port set"
    grep "port 31337" /etc/gkrellmd.conf
    assert equal "$?" 0

  it "should set the allowed hosts"
    grep "allow-host 127.0.0.1" /etc/gkrellmd.conf
    assert equal "$?" 0

end_describe
