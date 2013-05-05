#!/bin/sh

PROJECT=arper

# Exit on error
set -e

# Exit on pipe fails (if possible)
( set -o pipefail 2> /dev/null ) || true

# Check for the tools
test -z "$AUTOMAKE" && AUTOMAKE=automake
test -z "$ACLOCAL" && ACLOCAL=aclocal
test -z "$AUTOCONF" && AUTOCONF=autoconf
test -z "$AUTOHEADER" && AUTOHEADER=autoheader
if [ -x /usr/bin/glibtool ]; then
  test -z "$LIBTOOL" && LIBTOOL=glibtool
  test -z "$LIBTOOLIZE" && LIBTOOLIZE=glibtoolize
else
  test -z "$LIBTOOL" && LIBTOOL=libtool
  test -z "$LIBTOOLIZE" && LIBTOOLIZE=libtoolize
fi

DIE=0

($AUTOCONF --version) < /dev/null > /dev/null 2>&1 || {
  echo
  echo "You must have autoconf installed to compile $PROJECT."
  echo "Download the appropriate package for your distribution,"
  echo "or get the source tarball at ftp://ftp.gnu.org/pub/gnu/"
  DIE=1
}

($AUTOMAKE --version) < /dev/null > /dev/null 2>&1 || {
  echo
  echo "You must have automake installed to compile $PROJECT."
  echo "Download the appropriate package for your distribution, or"
  echo "get http://ftp.gnu.org/gnu/automake/automake-1.10.2.tar.gz"
  echo "(or a newer version if it is available)"
  DIE=1
}

if test "$DIE" -eq 1; then
  exit 1
fi

echo "Running: $ACLOCAL $ACLOCAL_FLAGS..."
rm -f aclocal.m4
$ACLOCAL $ACLOCAL_FLAGS

echo "Running: automake -a $am_opt..."
$AUTOMAKE -a --foreign $am_opt

echo "Running: autoconf..."
$AUTOCONF

if test x$NO_CONFIGURE != x; then
  exit;
fi

./configure "$@"

echo
echo "Now type 'make' to compile $PROJECT."
