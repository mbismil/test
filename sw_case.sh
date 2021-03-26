###################################
# Main Script Logic Starts Here   #
###################################
case "$1" in
        mysql)
                backup_mysql
                ;;
        fsbak)
                backup_tar
                ;;
        mount)
                mount_nas
                ;;
        umount)
                umount_nas
                ;;
        *)
                echo "Usage: $0 {mysql|fsbak|mount|umount}"
                echo ""
                echo "Use this shell script to backup mysql database and directories to backup nas server."
esac
