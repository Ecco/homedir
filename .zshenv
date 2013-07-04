case `uname` in
Darwin)
  PATH=~/local/bin:/usr/local/bin:$PATH:/usr/local/android/tools:/usr/local/android/platform-tools:/usr/local/share/npm/bin:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin
  MANPATH=$MANPATH:/opt/local/share/man
  INFOPATH=$INFOPATH:/opt/local/share/info
;;
esac

export LC_ALL=en_US.UTF-8
