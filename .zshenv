case `uname` in
Darwin)
  PATH=~/local/bin:/usr/local/bin:$PATH:/usr/local/android/tools:/usr/local/android/platform-tools
  MANPATH=$MANPATH:/opt/local/share/man
  INFOPATH=$INFOPATH:/opt/local/share/info
;;
esac

export LC_ALL=en_US.UTF-8
