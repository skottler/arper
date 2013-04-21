AC_INIT([Arper], [0.1], [shk@linux.com], [arper], [https://github.com/skottler/arper])
AC_PREREQ([2.59])

AC_ARG_WITH([pcap], AC_HELP_STRING([--with-pcap], [libpcap installation path]),
    [], [ withval="yes" ])
AC_MSG_CHECKING([for pcap.h])
if test x_$withval = x_yes; then
    withval="/usr/local /opt/local /usr/pkg /usr"
fi
for dir in $withval; do
    if test -f "$dir/include/pcap.h"; then
        found_libpcap="yes"
        if test x_$dir != x_/usr; then
            CPPFLAGS="$CPPFLAGS -I$dir/include"
        fi
        break;
    fi
done
if test x_$found_libpcap = x_yes; then
    AC_MSG_RESULT([$dir/include/pcap.h])
    if test x_$dir != x_/usr; then
        LDFLAGS="$LDFLAGS -L$dir/lib"
    fi
else
    AC_MSG_ERROR([cannot find pcap.h in $withval])
fi

AM_INIT_AUTOMAKE([1.10 no-define])
AC_CONFIG_HEADERS([config.h])
AC_PROG_CXX
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
