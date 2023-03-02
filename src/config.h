#ifndef _CONFIG_H
#define _CONFIG_H

#define _POSIX_C_SOURCE 2

#define MODULE_DISTRO
#define MODULE_USERINFO
#define MODULE_SYSUNAME
#define MODULE_PACKAGES

#define MAX_DISTRO_LENGTH   64
#define DISTRO_NAME_ATTR    "NAME="
#define MAX_PACKAGE_CMD_LEN 49
#define PKG_MANAGER(cmd)    cmd "\n"
#define PACKAGE_MANAGERS_CMD \
    "{\n" \
    PKG_MANAGER("q qlist -I") \
    PKG_MANAGER("dnf list installed") \
    PKG_MANAGER("dpkg-query -f '${binary:Package}\n' -W") \
    PKG_MANAGER("nix-store -q --requisites /run/current-system/sw") \
    PKG_MANAGER("pacman -Qq") \
    PKG_MANAGER("rpm -qa --last") \
    PKG_MANAGER("xbps-query -l") \
    PKG_MANAGER("bonsai list") \
    PKG_MANAGER("apk info") \
    PKG_MANAGER("pkg list-installed") \
    "} 2>/dev/null|wc -l"
#endif /* _CONFIG_H */
