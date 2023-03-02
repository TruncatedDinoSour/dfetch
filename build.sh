#!/usr/bin/env sh

set -xe

GENERIC_FLAGS="$CFLAGS -std=c99 -Wall -Wextra -Wpedantic -Wshadow -Werror -pedantic -march=native -mtune=native -pipe -o ../dfetch main.c"

main() {
    case "$1" in
    -i) install -Dm 700 ./dfetch "$HOME/.local/bin" ;;
    -u) rm -f -- "$HOME/.local/bin/dfetch" ;;
    *) nx=1 ;;
    esac

    [ "$nx" ] || return 0

    CC="${CC:-clang}"

    cd src

    if [ "$DEBUG" ]; then
        $CC -g $GENERIC_FLAGS
    else
        $CC -flto -Ofast -ffunction-sections -fdata-sections -s $GENERIC_FLAGS
        strip $STRIPFLAGS --strip-all --remove-section=.note --remove-section=.gnu.version --remove-section=.comment --strip-debug --strip-unneeded ../dfetch.elf
    fi

    cd ..

    if [ "$1" = '-r' ]; then
        ./dfetch
    fi
}

main "$@"
