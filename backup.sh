#! /bin/zsh

echo -e "[Backup script]\n\n"
echo -e "[*] Executing backup from $home_backup to $backups_folder ..."

backup_folder='/mnt/sandisk/archlinux_backups'
backups_folder='/Datos/archlinux_backups'
home_backup='/home/blackout'
system_backup='/'
ignore_home_cache='/home/blackout/.cache'
ignore_npm_cache='/home/blackout/.npm'
ignore_home_videos='/home/blackout/Vídeos'
ignore_home_src='/home/blackout/src'

if [ $# -eq 0 ]; then
        >&2 echo -e "[x] No parameters found... exit.\n"  
else
        echo -e "[*] Parameters: $*"
        if [ $2 = $backups_folder ] && [ $1 = $home_backup ]; then
                echo -e "[*] Selected backup destination to: $backups_folder for $home_backup...\n"
                tar --exclude=$ignore_home_cache --exclude=$ignore_npm_cache  --exclude=$ignore_home_videos -czvpf $backups_folder/backup_$(date +%Y%m%d).tgz $home_backup
        else
                echo -e "[*] back up from $1 to $2"
                tar -czvpf $2 $1
        fi
fi

# tar --exclude=$ignore_home_cache --exclude=$ignore_home_videos -czvpf /Toshiba/archlinux_backups/backup_$(date +%Y%m%d).tgz /home/blackout/

#rsync -avpzf --exclude '/home/blackout/.cache/' --exclude '/home/blackout/Vídeos/' /home/blackout/ /tmp/backup_$(date +%Y%m%d).tgz
