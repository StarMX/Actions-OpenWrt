# 管理地址
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile



sed -i "s/OpenWrt build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 固件架构
cat >> .config <<EOF
CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_DEVICE_hiwifi_c526a=y
EOF

# IPV6
cat >> .config <<EOF
CONFIG_PACKAGE_luci-proto-ipv6=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_odhcp6c_ext_cer_id=0

EOF

# 取消默认启用的包
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-ddns=y
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_PACKAGE_luci-app-arpbind is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-wol is not set
# CONFIG_PACKAGE_luci-app-ramfree is not set
CONFIG_PACKAGE_luci-app-turboacc=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-cpufreq is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-zerotier=y
# CONFIG_PACKAGE_v2ray is not set
# CONFIG_PACKAGE_shadowsocks-libev-ss-redir is not set
# CONFIG_PACKAGE_shadowsocksr-libev-server is not set
# CONFIG_PACKAGE_ddns-scripts_aliyun is not set
# CONFIG_PACKAGE_ddns-scripts_dnspod is not set
EOF

# 其它默认的包 luci luci-app-upnp luci-app-nlbwmon luci-app-samba autosamba automount default-settings

# 基本软件:
cat >> .config <<EOF
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_autocore-arm=y
EOF

# 常用软件 默认已启用
cat >> .config <<EOF
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-samba=y
CONFIG_PACKAGE_autosamba=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-i18n-mwan3-zh-cn=y
CONFIG_PACKAGE_mwan3=y
EOF

# 其它
sed -i '21d' package/lean/default-settings/files/zzz-default-settings #禁止网络共享分类到NAS
